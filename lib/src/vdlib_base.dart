import 'package:realm/realm.dart';
import 'package:vdlib/src/db/db.dart';

/// Vazir Database Library
abstract class VDLib {
  /// Create vDB instance from a Configuration and custom schema
  ///
  static VDB vDB<T extends RealmObject>(Configuration config) {
    return VDB<T>(config);
  }

  /// Create Key Value vDB instance
  ///
  static VKvDB vKvDB() {
    return VKvDB();
  }
}
