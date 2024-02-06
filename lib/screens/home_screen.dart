// ignore_for_file: use_build_context_synchronously

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:news_desktop_app/constants/consts.dart';
import 'package:news_desktop_app/widgets/news_list.dart';
import 'package:window_manager/window_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WindowListener {
  final viewKey = GlobalKey();
  int index = 0;

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      key: viewKey,
      appBar: NavigationAppBar(
          title: const Text('News'),
          actions: WindowTitleBarBox(
            child: Row(
              children: [Expanded(child: MoveWindow()), const WindowButtons()],
            ),
          ),
          leading: Container(),
          automaticallyImplyLeading: true),
      pane: NavigationPane(
          size: const NavigationPaneSize(compactWidth: 60),
          selected: index,
          onChanged: (i) => setState(() => index = i),
          displayMode: PaneDisplayMode.compact,
          items: pages
              .map<NavigationPaneItem>(((e) => PaneItem(
                  icon: Icon(
                    e.iconData,
                    size: 20,
                  ),
                  title: Text(e.title),
                  body: NewsListPage(newsPage: pages[index]))))
              .toList()),
    );
  }

  @override
  void onWindowClose() async {
    showContentDialog(context);
    bool isPreventClose = await windowManager.isPreventClose();
    if (isPreventClose) {
      showDialog(
          context: context,
          builder: (_) {
            return ContentDialog(
              title: const Text('Confirm'),
              content: const Text('Are you sure?'),
              actions: [
                FilledButton(
                    child: const Text('Yes'),
                    onPressed: () {
                      Navigator.pop(context);
                      windowManager.destroy();
                    }),
                FilledButton(child: const Text('No'), onPressed: () {})
              ],
            );
          });
    }
  }

  void showContentDialog(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Delete file permanently?'),
        content: const Text(
          'If you delete this file, you won\'t be able to recover it. Do you want to delete it?',
        ),
        actions: [
          Button(
            child: const Text('Delete'),
            onPressed: () {
              Navigator.pop(context, 'User deleted file');
              // Delete file here
            },
          ),
          FilledButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context, 'User canceled dialog'),
          ),
        ],
      ),
    );
    setState(() {});
  }
}
