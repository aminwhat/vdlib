import 'package:example/core/core.dart';
import 'package:example/widgets/widgets.dart';
import 'package:flutter/material.dart';

abstract class VDialogs {
  static BuildContext get context =>
      GLobal.navigatorKey.currentState!.overlay!.context;

  static void about() {
    Size size = MediaQuery.of(context).size;
    showAboutDialog(
      context: context,
      applicationIcon: LogoWidget(width: size.width / 10),
      applicationName: 'پلتفرم مالی وزیر',
      children: [
        const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ':0.0.0',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 60),
              PrivacyButton(),
            ],
          ),
        ),
      ],
    );
  }
}
