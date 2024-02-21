import 'package:vdlib/vdlib.dart';
import 'package:flutter/material.dart';

class PrivacyButton extends StatelessWidget {
  const PrivacyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'کاربر با نصب یا استفاده از برنامه با',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          TextButton(
            onPressed: () async {
              await Utility.urlLauncher(context, 'https://vazir.io/terms');
              if (context.mounted) {
                await Utility.urlLauncher(context, 'https://vazir.io/privacy');
              }
            },
            child: const Text(
              'شرایط و حریم خصوصی آن',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          const Text(
            'موافقت کرده است',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
