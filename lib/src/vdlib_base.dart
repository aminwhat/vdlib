import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:vdlib/src/connection/connection.dart';
import 'package:vdlib/src/db/db.dart';

/// Vazir Database Library
abstract class VDLib {
  static VConnection? _connection;
  static bool _initialized = false;

  ///
  /// Initialize when Main part of the app start to function
  static Future<void> init() async {
    _initialized = true;
  }

  /// Basic Connection to the server
  ///
  /// [*Required for other parts*]
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

  /// Create vDB instance from a Configuration and custom schema
  ///
  static VDB vDB<T extends RealmObject>(Configuration config) {
    assert(_initialized);
    assert(_connection != null);
    VDB.vConnection = _connection!;
    return VDB<T>(config);
  }

  /// Create Key Value vDB instance
  ///
  static VKvDB vKvDB() {
    assert(_initialized);
    assert(_connection != null);
    VKvDB.vConnection = _connection!;
    return VKvDB();
  }

  static void dispose() {
    _initialized = false;
    _connection = null;
  }
}
