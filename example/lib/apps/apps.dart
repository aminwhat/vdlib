import 'dart:developer';
import 'dart:io';
import 'package:example/apis/v_connetion/v_connection.dart';
import 'package:example/screens/admin_screen.dart';
import 'package:example/screens/dashboard_screen.dart';
import 'package:example/screens/update_screen.dart';
import 'package:example/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:example/core/core.dart';
import 'package:flutter_download_manager/flutter_download_manager.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vdlib/vdlib.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

part 'builder.dart';

enum AppsType {
  update,
  hessab,
  admin,
}

Future<void> configApp({
  required AppsType appsType,
  required BuildContext? context,
}) async {
  windowManager.hide();
  GLobal.appsType = appsType;
  _titleInit();
  await _appsInit();
  if (context != null && context.mounted) {
    AppBuilder.updateBuilderState(context, initilize: true);
    Navigator.of(context).pushAndRemoveUntil(
        PageTransition(
          child: switch (GLobal.appsType) {
            AppsType.admin => const AdminScreen(),
            AppsType.hessab => const DashboardScreen(),
            AppsType.update => const UpdateScreen(),
          },
          type: PageTransitionType.fade,
        ),
        (route) => false);
  }
  windowManager.show();
  if (GLobal.appsType == AppsType.hessab) {
    if (!(await windowManager.isMaximized())) {
      windowManager.maximize();
    }
  }
}

Future<void> _appsInit() async {
  if (GLobal.appsType == AppsType.update) {
    windowManager.setMinimumSize(const Size(800, 500));
    windowManager.setMaximumSize(const Size(900, 600));
    windowManager.setSize(const Size(850, 550));
    windowManager.setAlignment(Alignment.center);
    windowManager.setResizable(false);
  } else {
    windowManager.setMinimumSize(const Size(1200, 900));
    windowManager.setMaximumSize(const Size(2400, 1800));
    windowManager.setResizable(true);
  }
  windowManager.setAsFrameless();
  windowManager.setHasShadow(true);
}

void _titleInit() {
  final appsTitles = <AppsType, String>{
    AppsType.update:
        kDebugMode ? 'Vazir Financial Platform' : 'پلتفرم مالی وزیر',
    AppsType.admin: kDebugMode ? 'Vazir Admin' : 'پنل ادمین',
    AppsType.hessab:
        kDebugMode ? 'Vazir Financial Platform' : 'پلتفرم مالی وزیر',
  };
  String title = appsTitles[GLobal.appsType] ??
      (kDebugMode ? 'Vazir Financial Platform' : 'پلتفرم مالی وزیر');
  WindowManager.instance.setTitle(title);
}
