import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:vdlib/src/connection/stream_controller.dart';
import 'package:vdlib/src/db/db.dart';
import 'package:vdlib/src/widgets/widgets.dart';

export 'stream_controller.dart';

class VConnectionOptions extends Equatable {
  final String subSocketPath;
  final String appVersion;
  final String appBuildToken;
  final void Function()? onLogOut;
  final void Function(dynamic data)? onStatus;

  const VConnectionOptions({
    required this.subSocketPath,
    required this.appVersion,
    required this.appBuildToken,
    this.onLogOut,
    this.onStatus,
  });

  @override
  List<Object?> get props => [
        subSocketPath,
        appVersion,
        appBuildToken,
        onLogOut,
        onStatus,
      ];
}

class VConnection {
  final VConnectionOptions options;
  final BuildContext context;
  late final io.Socket socket;
  late final VKvDB vKvDB = VKvDB(VKvDBOptions(
    path: 'v_connection',
    schemaVersion: int.tryParse(options.subSocketPath) ?? 0,
  ));

  VConnection({
    required this.options,
    required this.context,
    required void Function(ConnectionStatus status) onStatus,
  }) {
    socket = io.io(
      '${kDebugMode ? 'http://localhost:3779' : 'https://api.vazir.io'}/${options.subSocketPath}.v${options.appVersion[0]}',
      io.OptionBuilder().setTransports(['websocket']).setAuth({
        'clientId': vKvDB.get('vdlib_connection_clientId'),
        'version': options.appVersion,
        'token': options.appBuildToken,
      }).build(),
    );

    socket.connect();

    socket.onConnect((data) {
      onStatus(ConnectionStatus.connected);
    });

    socket.onConnecting((data) {
      onStatus(ConnectionStatus.connecting);
    });

    socket.onConnectError((data) {
      onStatus(ConnectionStatus.error);
    });

    socket.onDisconnect((data) {
      onStatus(ConnectionStatus.disconnect);
    });

    socket.on('logout', (data) async {
      Map<String, dynamic> receivedData = data as Map<String, dynamic>;
      bool logOut = receivedData['valid'] as bool;
      if (logOut) {
        Future.delayed(
          const Duration(seconds: 3),
          () {
            _showSnackBar(
              'خروج از حساب کاربری به دستور سرور, شاید به دلیل اتمام زمان توکن امنیتی',
            );
          },
        );
        options.onLogOut?.call();
      } else {
        _showSnackBar('خطا در خروج از برنامه');
      }
    });

    socket.on('credentials', (data) {
      Map<String, dynamic> receivedData = data as Map<String, dynamic>;
      vKvDB.set(KeyValue(
        'vdlib_connection_clientId',
        value: receivedData['clientId'].toString(),
      ));
      socket.auth = {
        'token': options.appBuildToken,
        'clientId': receivedData['clientId'].toString(),
        'version': options.appVersion,
      };
    });

    socket.on('msg', (data) {
      _showSnackBar(data.toString());
    });

    socket.on('status', (data) {
      options.onStatus?.call(data);
    });
  }

  Stream<T?> listen<T extends Equatable>(
      VStreamControllerOptions<T> options) async* {
    yield* vStreamController<T>(
      options,
    );
  }

  void _showSnackBar(String text) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SnackBarContent(
            child: SelectableText(text),
          ),
        ),
      );
    }
  }

  void dispose() {
    socket.dispose();
    vKvDB.dispose();
  }
}

enum ConnectionStatus {
  connected,
  connecting,
  disconnect,
  error,
}
