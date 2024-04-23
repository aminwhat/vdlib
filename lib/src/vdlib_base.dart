import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vdlib/src/connection/connection.dart';

/// *Vazir Database Library*
abstract class VDLib {
  static VConnection? _connection;
  static bool _initialized = false;
  static VDLibOptions _options = const VDLibOptions();

  ///
  /// Initialize when Main part of the app start to function
  static Future<void> init(VDLibOptions options) async {
    assert(!kIsWeb);
    _options = options;
    _initialized = true;
  }

  /// Basic Connection to the server
  ///
  /// [*Required for (initializing the app/other parts)*]
  static VConnection vConnection(
    BuildContext context,
    VConnectionOptions options,
    void Function(ConnectionStatus connectionStatus) onStatus,
  ) {
    assert(_initialized);
    _connection = VConnection(
      options: options,
      onStatus: onStatus,
      context: context,
    );
    assert(_connection != null);
    return _connection!;
  }

  static void dispose() {
    _initialized = false;
    _options = const VDLibOptions();
    _connection = null;
  }
}

class VDLibOptions extends Equatable {
  final bool forced;

  const VDLibOptions({
    this.forced = false,
  });

  @override
  List<Object> get props => [forced];
}
