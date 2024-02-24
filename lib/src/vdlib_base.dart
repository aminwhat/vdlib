import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:vdlib/src/connection/connection.dart';
import 'package:vdlib/src/db/db.dart';
import 'package:vdlib_web/vdlib_web.dart';

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
    VKvDB.path = _options.path;
    VKvDB.customPath = _options.customPath;
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
    VDB.vConnection = _connection!;
    VKvDB.vConnection = _connection!;
    return _connection!;
  }

  /// Create vDB instance from a Configuration and custom schema
  ///
  static VDB vDB<T extends RealmObject>(Configuration config) {
    _checkForced();
    return VDB<T>(config);
  }

  /// Create Key Value vDB instance
  ///
  static VKvDB vKvDB(VKvDBOptions options) {
    _checkForced();
    return VKvDB(options);
  }

  static void _checkForced() {
    if (_options.forced) {
      assert(_initialized);
      assert(_connection != null);
    }
  }

  static void dispose() {
    _initialized = false;
    _options = const VDLibOptions();
    _connection = null;
  }
}

class VDLibOptions extends Equatable {
  final bool forced;
  final String? path;
  final String? customPath;

  const VDLibOptions({
    this.forced = false,
    this.path,
    this.customPath,
  }) : assert(!(path != null && customPath != null));

  @override
  List<Object?> get props => [forced, path, customPath];
}
