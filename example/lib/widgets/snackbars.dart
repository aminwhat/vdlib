import 'package:example/core/global.dart';
import 'package:flutter/material.dart';

abstract class VSnacks {
  static void custom(String msg) {
    SnackBar(
      content: _SnackBarContent(
        child: SelectableText(msg),
      ),
    ).show();
  }

  static void runAppError() {
    custom('...خطا در اجرای برنامه');
  }

  static void submited() {
    custom('با موفقیت ثبت شد');
  }

  static void wrongCredentials() {
    custom('.رمز یا نام کاربری اشتباه است');
  }

  static void unknownError() {
    custom('.خطای ناشناخته رخ داد');
  }

  static void knownError(String error) {
    custom('Error: $error');
  }
}

extension ShowSnackBarMessenger on ScaffoldMessengerState {
  void show(SnackBar snackBar) {
    _showSnackBar(snackBar);
  }
}

extension ShowSnackBar on SnackBar {
  void show() {
    _showSnackBar(this);
  }
}

void _showSnackBar(SnackBar snackBar) {
  GLobal.scaffoldMessengerKey.currentState?.clearSnackBars();
  GLobal.scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
}

class _SnackBarContent extends StatelessWidget {
  const _SnackBarContent({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
      child: Center(child: child),
    );
  }
}
