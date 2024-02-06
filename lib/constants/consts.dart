import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:news_desktop_app/models/article_category.dart';
import 'package:news_desktop_app/models/news.dart';

// List<NavigationPaneItem> items = [
//   PaneItem(
//     icon: const Icon(FluentIcons.home),
//     title: const Text('Home'),
//     body: Container(),
//   ),
//   PaneItemSeparator(),
//   PaneItem(
//     icon: const Icon(FluentIcons.issue_tracking),
//     title: const Text('Track orders'),
//     infoBadge: const InfoBadge(source: Text('8')),
//     body: Container(),
//   ),
//   PaneItem(
//     icon: const Icon(FluentIcons.disable_updates),
//     title: const Text('Disabled Item'),
//     body: Container(),
//     enabled: false,
//   ),
//   PaneItemExpander(
//     icon: const Icon(FluentIcons.account_management),
//     title: const Text('Account'),
//     body: Container(),
//     items: [
//       PaneItemHeader(header: const Text('Apps')),
//       PaneItem(
//         icon: const Icon(FluentIcons.mail),
//         title: const Text('Mail'),
//         body: Container(),
//       ),
//       PaneItem(
//         icon: const Icon(FluentIcons.calendar),
//         title: const Text('Calendar'),
//         body: Container(),
//       ),
//     ],
//   ),
// ];

List<NewsPage> pages = const [
  NewsPage(
      title: 'Top Headlines',
      iconData: FluentIcons.news,
      category: ArticleCategory.general),
  NewsPage(
      title: 'Business',
      iconData: FluentIcons.business_center_logo,
      category: ArticleCategory.business),
  NewsPage(
      title: 'Technology',
      iconData: FluentIcons.laptop_secure,
      category: ArticleCategory.technology),
  NewsPage(
      title: 'Entertainment',
      iconData: FluentIcons.my_movies_t_v,
      category: ArticleCategory.entertainment),
  NewsPage(
      title: 'Sports',
      iconData: FluentIcons.more_sports,
      category: ArticleCategory.sports),
  NewsPage(
      title: 'Science',
      iconData: FluentIcons.communications,
      category: ArticleCategory.science),
  NewsPage(
      title: 'Health',
      iconData: FluentIcons.health,
      category: ArticleCategory.health),
];
final buttonColors = WindowButtonColors(
    iconNormal: const Color(0xFF805306),
    mouseOver: const Color(0xFFF6A00C),
    mouseDown: const Color(0xFF805306),
    iconMouseOver: const Color(0xFF805306),
    iconMouseDown: const Color(0xFFFFD500));

final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: const Color(0xFF805306),
    iconMouseOver: Colors.white);

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
