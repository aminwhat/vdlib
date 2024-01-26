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

  static VDB vDB() {
    return VDB();
  }
}
