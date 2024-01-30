import 'dart:math';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vdlib/src/widgets/widgets.dart';

extension StringUtility on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

abstract class Utility {
  static String randomString([int length = 10]) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();

    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  static Future<void> urlLauncher(
    BuildContext context,
    String url, {
    Function(Uri uri)? onError,
  }) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.inAppBrowserView,
    )) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: SnackBarContent(
              child: SelectableText("خطا در باز کردن لینک: $url "),
            ),
          ),
        );
      }
    }
  }

  static Future<void> emailLauncher(
    BuildContext context,
    String email,
    String subject,
    String body, {
    Function(Uri uri)? onError,
  }) async {
    await urlLauncher(
      context,
      'mailto:$email?subject=$subject&body=$body',
      onError: onError,
    );
  }

  static Future<void> telLauncher(
    BuildContext context,
    String phoneNumber, {
    Function(Uri uri)? onError,
  }) async {
    await urlLauncher(
      context,
      'tel:$phoneNumber',
      onError: onError,
    );
  }

  static Future<void> smsLauncher(
    BuildContext context,
    String phoneNumber, {
    Function(Uri uri)? onError,
  }) async {
    await urlLauncher(
      context,
      'sms:$phoneNumber',
      onError: onError,
    );
  }

  static Future<void> fileLauncher(
    BuildContext context,
    String path, {
    Function(Uri uri)? onError,
  }) async {
    await urlLauncher(
      context,
      'file:$path',
      onError: onError,
    );
  }
}
