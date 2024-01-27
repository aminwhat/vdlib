import 'package:realm/realm.dart';
import 'package:vdlib/src/connection/connection.dart';
import 'package:vdlib/src/db/db.dart';

/// Vazir Database Library
abstract class VDLib {
  static late VConnection _connection;

  /// Basic Connection to the server
  ///
  /// Initialize when Main part of the app start to function
  ///
  /// [*Required for other parts*]
  static VConnection vConnection() {
    _connection = VConnection();
    return _connection;
  }

  /// Create vDB instance from a Configuration and custom schema
  ///
  static VDB vDB<T extends RealmObject>(Configuration config) {
    VDB.vConnection = _connection;
    return VDB<T>(config);
  }

  /// Create Key Value vDB instance
  ///
  static VKvDB vKvDB() {
    VKvDB.vConnection = _connection;
    return VKvDB();
  }
}
