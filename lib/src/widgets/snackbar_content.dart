import 'package:flutter/material.dart';

class SnackBarContent extends StatelessWidget {
  const SnackBarContent({super.key, required this.child});

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
