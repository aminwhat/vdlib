import 'package:flutter/material.dart';
import 'package:example/core/cache_configuration.dart';
import 'package:example/data/models/models.dart';
import 'package:vdlib/vdlib.dart';
import 'package:realm/realm.dart';

Future<void> loadUriInfoDashboardLogic(BuildContext context) async {
  final realm = Realm(localConfiguration([Info.schema]));
  var info = realm.find<Info>('dashboard_screen');
  realm.write(() {
    info ??= Info('dashboard_screen', 'https://vazir.io/docs');
  });
  final String uri = info!.uri;
  realm.close();
  await Utility.urlLauncher(context, uri);
}

void setInfoDashboardLogic(String uri) {
  final realm = Realm(localConfiguration([Info.schema]));
 realm.write((){
   realm.add(Info('dashboard_screen', uri),update:true);
 });
  realm.close();
}
