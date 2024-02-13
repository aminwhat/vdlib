import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:vdlib/src/connection/connection.dart';
import 'package:vdlib/src/db/db.dart';

/// *Vazir Database Library*
abstract class VDLib {
  static VConnection? _connection;
  static bool _initialized = false;
  static bool _forced = false;

  ///
  /// Initialize when Main part of the app start to function
  static Future<void> init([bool forced = false]) async {
    assert(!kIsWeb);
    _initialized = true;
    _forced = forced;
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
  static VKvDB vKvDB() {
    _checkForced();
    return VKvDB();
  }

  static void _checkForced() {
    if (_forced) {
      assert(_initialized);
      assert(_connection != null);
    }
  }

  static void dispose() {
    _initialized = false;
    _connection = null;
  }
}
