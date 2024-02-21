import 'package:example/core/global.dart';
import 'package:example/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen>
    with AutomaticKeepAliveClientMixin<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
              child: const Text(' :کاربر'), // TODO: fix username
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('تنظیمات'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('درباره'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.exit_to_app_outlined,
                color: Colors.red,
              ),
              title: const Text(
                'خروج از حساب کاربری',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              onTap: () async {
                Navigator.of(context).pop();
                GLobal.vConnection.dispose();
                // await authApp.run();
                // TODO: implement LogOut the Account
              },
            ),
            SizedBox(
              height: size.height / 1.7,
            ),
            const PrivacyButton(),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Admin Panel'),
      ),
      body: const Center(
        child: Text('Admin Screen'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
