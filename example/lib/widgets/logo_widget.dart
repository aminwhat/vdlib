import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, this.height, this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo/vazir.png',
      height: height,
      width: width,
    );
  }
}
