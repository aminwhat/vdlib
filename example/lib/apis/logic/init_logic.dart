import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:example/apis/logic/version_logic.dart';
import 'package:vdlib/vdlib.dart';

Future<void> initLogic() async {
  await VDLib.init(const VDLibOptions());
  versionCheckLogic();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/Vazir/OFL.txt');
    yield LicenseEntryWithLineBreaks(['Vazir'], license);
  });
  log('initLogic Initialized');
}
