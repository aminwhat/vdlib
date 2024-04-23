// import 'package:example/apis/logic/info_logic.dart';
import 'package:example/apis/v_connetion/v_connection.dart';
import 'package:example/core/global.dart';
import 'package:example/data/dto/info.dart';
import 'package:example/screens/blog_screen.dart';
import 'package:example/screens/projects_screen.dart';
import 'package:example/screens/settings_screen.dart';
import 'package:example/widgets/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vdlib/vdlib.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with StreamListener {
  int _selectedIndex = 0;
  final Map<NavigationRailAndTab, Widget> _tabs = {
    const NavigationRailAndTab(
      navigationRailDestination: NavigationRailDestination(
        icon: Icon(Icons.archive_outlined),
        selectedIcon: Icon(Icons.archive_rounded),
        label: Text('پروژه ها'),
      ),
      tab: Tab(
        icon: Icon(Icons.archive_outlined),
      ),
    ): const ProjectsScreen(),
    const NavigationRailAndTab(
      navigationRailDestination: NavigationRailDestination(
        icon: Icon(Icons.analytics_outlined),
        selectedIcon: Icon(Icons.analytics_rounded),
        label: Text('بلاگ'),
      ),
      tab: Tab(
        icon: Icon(Icons.analytics_outlined),
      ),
    ): const BlogScreen(),
    const NavigationRailAndTab(
      navigationRailDestination: NavigationRailDestination(
        icon: Icon(Icons.settings),
        selectedIcon: Icon(Icons.settings_applications, size: 30),
        label: Text('تنظیمات'),
      ),
      tab: Tab(
        icon: Icon(Icons.settings),
      ),
    ): const SettingsScreen(),
  };

  @override
  void initState() {
    streamListener<InfoDto>(
      getInfo(GLobal.vConnection.socket, 'dashboard_screen'),
      (data) {
        // setInfoDashboardLogic(data!.uri);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _tabs.length,
      child: CallbackShortcuts(
        bindings: <ShortcutActivator, VoidCallback>{
          const SingleActivator(LogicalKeyboardKey.keyK, control: true): () {
            _showSearchDialog();
          }
        },
        child: Focus(
          autofocus: true,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                isScrollable: true,
                splashBorderRadius: BorderRadius.circular(15),
                tabs: [
                  for (var destination in _tabs.keys) destination.tab,
                ],
              ),
              leading: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 6,
                  bottom: 6,
                  right: 6,
                ),
                child: FloatingActionButton(
                  heroTag: 'ShowSearchDialog',
                  tooltip: 'Ctrl+k',
                  elevation: 0,
                  onPressed: () {
                    _showSearchDialog();
                  },
                  child: const Icon(Icons.search),
                ),
              ),
              leadingWidth: 80,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LogoWidget(
                    height: size.height / 21,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text('|'),
                  ),
                  const Text(
                    'پلتفرم مالی وزیر',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
            ),
            body: Row(
              children: [
                NavigationRail(
                  labelType: NavigationRailLabelType.all,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  destinations: [
                    for (var destination in _tabs.keys)
                      destination.navigationRailDestination,
                  ],
                  selectedIndex: _selectedIndex,
                ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(
                  child: TabBarView(
                    children: _tabs.values.toList(),
                  ),
                ),
              ],
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: FloatingActionButton(
                tooltip: 'راهنما',
                onPressed: () async {
                  // await loadUriInfoDashboardLogic(context);
                },
                elevation: 0,
                child: const Icon(Icons.question_mark_outlined),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
          ),
        ),
      ),
    );
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) => const SearchDialog(),
    );
  }
}

class NavigationRailAndTab extends Equatable {
  final NavigationRailDestination navigationRailDestination;
  final Tab tab;

  const NavigationRailAndTab({
    required this.navigationRailDestination,
    required this.tab,
  });

  @override
  List<Object> get props => [navigationRailDestination, tab];
}
