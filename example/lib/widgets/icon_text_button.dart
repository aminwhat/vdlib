import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.elevation = 0,
    this.backgroundColor = Colors.white,
    this.iconAndtextSpacing = 5,
  });

  final double elevation;
  final Widget icon;
  final Widget text;
  final void Function() onPressed;
  final Color backgroundColor;
  final double iconAndtextSpacing;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: elevation,
      backgroundColor: backgroundColor,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(height: iconAndtextSpacing),
          text,
        ],
      ),
    );
  }
}
