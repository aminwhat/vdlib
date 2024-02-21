part of 'apps.dart';

class AppBuilder extends StatefulWidget {
  const AppBuilder({super.key, required this.child});

  final Widget child;

  static Future<void> updateBuilderState(
    BuildContext context, {
    bool? initilize,
  }) async {
    final state = context.findAncestorStateOfType<_AppBuilderState>()!;
    if (initilize != null && initilize) {
      state.initialize();
    }
  }

  @override
  State<AppBuilder> createState() => _AppBuilderState();
}

class _AppBuilderState extends State<AppBuilder> with StreamListener {
  late ConnectionStatus connectionStatus = ConnectionStatus.connecting;
  late Widget theChild = widget.child;

  void initialize() {
    if (GLobal.appsType == AppsType.hessab) {
      setState(() {
        GLobal.vConnection = VDLib.vConnection(
          context,
          VConnectionOptions(
            subSocketPath: 'hessab',
            appVersion: appVersion,
            appBuildToken: appBuildToken,
            onStatus: (data) {
              bool status =
                  bool.tryParse(data.toString(), caseSensitive: false) ?? false;
              if (!status) {
                theChild = const _ErrorApp(
                  text:
                      '!!!این نسخه از برنامه برای ارتباط با این نسخه از سرور مناسب نیست',
                );
              }
              if (mounted) setState(() {});
            },
          ),
          (status) {
            connectionStatus = status;
            GLobal.connectionStatus = connectionStatus;
            if (mounted) setState(() {});
          },
        );
      });

      streamListener(
        updateExists(GLobal.vConnection.socket),
        (data) async {
          if (data != null && data.exists && data.update != null) {
            try {
              log(data.update.toString());
              const downloadPath = "C:\\Vazir\\Downloads";

              await Directory(downloadPath).delete(recursive: true);
              await Directory(downloadPath).create(recursive: true);

              var dl = DownloadManager();
              var url = data.update!.downloadUri;
              DownloadTask? task = await dl.addDownload(url, downloadPath);

              task?.status.addListener(() {
                if (kDebugMode) {
                  print(task.status.value);
                }
              });

              task?.status.addListener(() {
                if (kDebugMode) {
                  print(task.progress.value);
                }
              });

              await task?.whenDownloadComplete();

              final fileList =
                  Directory(downloadPath).listSync(recursive: true);

              if (await fileList.single.exists()) {
                log(fileList.single.absolute.path);

                Process.run(
                  'start',
                  [fileList.single.absolute.path],
                  runInShell: true,
                );

                GLobal.vConnection.dispose();
                await windowManager.destroy();
              }
            } catch (e) {
              VSnacks.knownError('...خطا در آپدیت کردن برنامه');
            }
          }
        },
      );
    }
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (context) => DragToResizeArea(
            child: Stack(
              children: [
                theChild,
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: kToolbarHeight,
                    child: DragToMoveArea(
                      child: Container(),
                    ),
                  ),
                ),
                if (GLobal.appsType != AppsType.update) _titleFooter(),
                if (GLobal.appsType != AppsType.update)
                  StatusFloatingActionButton(
                    connectionStatus: connectionStatus,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _titleFooter() {
    return const Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        height: kToolbarHeight,
        child: _TabFooter(),
      ),
    );
  }
}

class _TabFooter extends StatefulWidget {
  const _TabFooter();

  @override
  State<_TabFooter> createState() => __TabFooterState();
}

class __TabFooterState extends State<_TabFooter> {
  ButtonStyle? closeButtonStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Row(
        children: [
          Expanded(
            child: IconButton(
              onPressed: () async {
                if (!await windowManager.isMinimized()) {
                  windowManager.minimize();
                } else {
                  windowManager.restore();
                }
              },
              icon: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(math.pi),
                child: const Icon(
                  Icons.arrow_outward_rounded,
                  size: 20,
                ),
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () async {
                if (!await windowManager.isMaximized()) {
                  windowManager.maximize();
                } else {
                  windowManager.restore();
                }
              },
              icon: const Icon(Icons.fullscreen_rounded, size: 20),
            ),
          ),
          Expanded(
            child: MouseRegion(
              onEnter: (event) {
                closeButtonStyle = const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                );
                setState(() {});
              },
              onExit: (event) {
                closeButtonStyle = null;
                setState(() {});
              },
              child: IconButton(
                style: closeButtonStyle,
                onPressed: () async {
                  GLobal.vConnection.dispose();
                  VDLib.dispose();
                  await windowManager.destroy();
                },
                icon: const Icon(Icons.close_rounded, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorApp extends StatelessWidget {
  const _ErrorApp({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sentiment_very_dissatisfied_outlined,
              size: 80,
              color: Colors.deepOrange,
            ),
            SizedBox(height: 10),
            Text(
                '!!!این نسخه از برنامه برای ارتباط با این نسخه از سرور مناسب نیست'),
            SizedBox(height: 15),
            Text('Version: $appVersion'),
          ],
        ),
      ),
    );
  }
}
