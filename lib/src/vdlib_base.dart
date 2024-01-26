import 'package:realm/realm.dart';
import 'package:vdlib/src/db/db.dart';
import 'package:vdlib/src/rust/frb_generated.dart';

/// Vazir Database Library
abstract class VDLib {
  /// Initialize VDLib
  ///
  /// Must Be Called Before runningApp
  static Future<void> init() async {
    await RustLib.init();
  }

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
