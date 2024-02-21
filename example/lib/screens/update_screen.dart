import 'dart:developer' as dev;
import 'dart:math';
import 'package:example/apis/logic/init_logic.dart';
import 'package:example/apps/apps.dart';
import 'package:example/core/global.dart';
import 'package:example/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vdlib/vdlib.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen>
    with StreamListener<UpdateScreen> {
  Future<void> _runHessabApp() async {
    if (mounted) await configApp(appsType: AppsType.hessab, context: context);
  }

  @override
  void initState() {
    Future.microtask(() async {
      await initLogic();
      int tryTimes = 0;
      while (true) {
        dev.log('Checking for the ConnectionStatus\t Try: $tryTimes');
        await Future.delayed(const Duration(seconds: 1));
        if (GLobal.connectionStatus != ConnectionStatus.connected) {
          if (tryTimes >= (kDebugMode ? 3 : Random().nextInt(15) + 20)) {
            await _runHessabApp();
            break;
          } else {
            tryTimes = tryTimes + 1;
            continue;
          }
        } else if (GLobal.connectionStatus == ConnectionStatus.connected) {
          await _runHessabApp();
          break;
        }
        VSnacks.runAppError();
        tryTimes = 0;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return IntroductionScreen(
      showNextButton: false,
      showDoneButton: false,
      autoScrollDuration: 5000,
      infiniteAutoScroll: true,
      globalFooter: const Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('... در حال بارگزاری برنامه'),
            SizedBox(width: 15),
            CurvedCircularProgressIndicator(),
          ],
        ),
      ),
      pages: [
        PageViewModel(
          title: 'پلتفرم مالی وزیر',
          bodyWidget: Center(
            child: Column(
              children: [
                SizedBox(
                  width: size.height / 2.08,
                  child: Lottie.asset('assets/content/intro_1.json'),
                ),
                const Text(':) تنها ابزار مورد نیاز شما برای حرفه مالی '),
              ],
            ),
          ),
        ),
        PageViewModel(
          title: 'بررسی و پردازش انواع داده های مالی',
          bodyWidget: Column(
            children: [
              SizedBox(
                width: size.width / 1.65,
                child: Lottie.asset('assets/content/intro_2.json'),
              ),
              const Text(
                  'صورت های مالی, حسابرسی, خرید و فروش و یا حتی انبار, هیج تفاوتی نمیکند'),
            ],
          ),
        ),
        PageViewModel(
          title: 'بر پایه ساختار ابری',
          bodyWidget: Column(
            children: [
              SizedBox(
                width: size.width / 3.07,
                child: Lottie.asset('assets/content/intro_3.json'),
              ),
              const Text(
                  'هیچ وقت داده های خود را از دست ندهید\nبدون نیاز به نصب هیچگونه ساختار و تحمیل هزینه های اضافی'),
            ],
          ),
        ),
        PageViewModel(
          title: 'با بهره گیری از تکنولوژی روز دنیا',
          bodyWidget: Column(
            children: [
              SizedBox(
                width: size.width / 2.88,
                child: Lottie.asset('assets/content/intro_4.json'),
              ),
              const Text('نظاره گر قدرت تکنولوژی باشید'),
            ],
          ),
        ),
        PageViewModel(
          title: 'کاملا امن',
          bodyWidget: Column(
            children: [
              SizedBox(
                width: size.width / 2.88,
                child: Lottie.asset('assets/content/intro_5.json'),
              ),
              const Text('تنها و تنها شما به داده هایتان دسترسی دارید'),
            ],
          ),
        ),
        PageViewModel(
          title: 'رایگان برای پروژه های شخصی',
          bodyWidget: Column(
            children: [
              SizedBox(
                width: size.width / 2,
                child: Lottie.asset('assets/content/intro_6.json'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 18),
                child: Text(
                    'ما باور داریم این حق شماست تا براحتی بتوانین از چنین ابزار قدرتمندی برای خودتان استفاده کنید'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
