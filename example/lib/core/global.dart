import 'package:example/apps/apps.dart';
import 'package:flutter/material.dart';
import 'package:vdlib/vdlib.dart';

abstract class GLobal {
  static late VConnection vConnection;

  static ConnectionStatus connectionStatus = ConnectionStatus.connecting;

  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static AppsType appsType = AppsType.update;
}
