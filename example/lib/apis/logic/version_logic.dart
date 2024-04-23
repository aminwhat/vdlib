// import 'dart:developer';
// import 'package:example/core/version.dart';
// import 'package:vdlib/vdlib.dart';

// void versionCheckLogic() {
//   final kvdb = VDLib.vKvDB(VKvDBOptions(
//     schemaVersion: appVersionSimple,
//     // onConfig: (schema) {
//     //   return localConfiguration([schema]);
//     // },
//   ));
//   final cacheAppVersion = kvdb.get('appVersion')?.trim();
//   if (cacheAppVersion == null || cacheAppVersion == "") {
//     log('appVersion is Empty :|');
//     kvdb.set(KeyValue('appVersion', value: appVersion));
//   }
//   kvdb.dispose();
// }
