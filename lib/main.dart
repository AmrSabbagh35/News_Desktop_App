import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:news_desktop_app/screens/home_screen.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  // windowManager.waitUntilReadyToShow().then((_) async {
  //   await windowManager.setTitle('title');
  //   await windowManager.setTitleBarStyle(TitleBarStyle.normal);
  //   await windowManager.setBackgroundColor(Colors.transparent);
  //   await windowManager.setSize(const Size(755, 545));
  //   // await windowManager.setAsFrameless();
  //   await windowManager.setMinimumSize(const Size(755, 545));
  //   await windowManager.center();
  //   await windowManager.show();
  //   await windowManager.setSkipTaskbar(false);

  //   return null;
  // });
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(600, 450);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Custom window with Flutter";
    win.show();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: FluentThemeData(
          brightness: Brightness.dark, accentColor: Colors.orange),
      home: const HomeScreen(),
    );
  }
}
