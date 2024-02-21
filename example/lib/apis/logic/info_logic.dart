import 'package:flutter/material.dart';
import 'package:example/core/cache_configuration.dart';
import 'package:example/data/models/models.dart';
import 'package:vdlib/vdlib.dart';

Future<void> loadUriInfoDashboardLogic(BuildContext context) async {
  final vdb = VDLib.vDB<Info>(localConfiguration([Info.schema]));
  var info = vdb.realm.find<Info>('dashboard_screen');
  vdb.realm.write(() {
    info ??= Info('dashboard_screen', 'https://vazir.io/docs');
  });
  final String uri = info!.uri;
  vdb.dispose();
  await Utility.urlLauncher(context, uri);
}

void setInfoDashboardLogic(String uri) {
  final vdb = VDLib.vDB<Info>(localConfiguration([Info.schema]));
  vdb.add(Info('dashboard_screen', uri));
  vdb.dispose();
}
