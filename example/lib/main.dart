import 'package:example/apis/observers/app_logger.dart';
import 'package:example/apps/apps.dart';
import 'package:example/apps/palette.dart';
import 'package:example/core/core.dart';
import 'package:example/screens/update_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await configApp(appsType: AppsType.update, context: null);
  runApp(ProviderScope(
    observers: [AppLogger()],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kDebugMode ? 'Vazir Financial Platform' : 'پلتفرم مالی وزیر',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: GLobal.scaffoldMessengerKey,
      navigatorKey: GLobal.navigatorKey,
      home: const UpdateScreen(),
      themeMode: Palette.themeMode,
      theme: Palette.theme,
      darkTheme: Palette.darkTheme,
      builder: (context, child) => AppBuilder(child: child!),
    );
  }
}
