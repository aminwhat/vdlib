import 'package:animations/animations.dart';
import 'package:example/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:vdlib/vdlib.dart';

class StatusFloatingActionButton extends StatelessWidget {
  const StatusFloatingActionButton({super.key, required this.connectionStatus});

  final ConnectionStatus connectionStatus;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 23, bottom: 20),
        child: FloatingActionButton(
          elevation: 3,
          shape: const CircleBorder(),
          mini: true,
          tooltip: 'وضعیت اتصال',
          onPressed:
              (connectionStatus == ConnectionStatus.connected) ? () {} : null,
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              transitionBuilder: (child, animation) => FadeScaleTransition(
                animation: animation,
                child: child,
              ),
              child: (connectionStatus != ConnectionStatus.connected)
                  ? const CurvedCircularProgressIndicator(
                      strokeWidth: 3.5,
                    )
                  : const Icon(Icons.person),
            ),
          ),
        ),
      ),
    );
  }
}
