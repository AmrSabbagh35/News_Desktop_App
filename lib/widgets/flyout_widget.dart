import 'package:fluent_ui/fluent_ui.dart';

class FlyOutWidget extends StatelessWidget {
  final Widget widget;

  const FlyOutWidget({super.key, required this.widget});
  @override
  Widget build(BuildContext context) {
    final contextController = FlyoutController();
    final contextAttachKey = GlobalKey();

    return GestureDetector(
      onSecondaryTapUp: (d) {
        // This calculates the position of the flyout according to the parent navigator
        final targetContext = contextAttachKey.currentContext;
        if (targetContext == null) return;
        final box = targetContext.findRenderObject() as RenderBox;
        final position = box.localToGlobal(
          d.localPosition,
          ancestor: Navigator.of(context).context.findRenderObject(),
        );

        contextController.showFlyout(
          barrierColor: Colors.black.withOpacity(0.1),
          position: position,
          builder: (context) {
            return FlyoutContent(
              child: SizedBox(
                width: 130.0,
                child: CommandBar(
                  primaryItems: [
                    CommandBarButton(
                      icon: const Icon(FluentIcons.add_favorite),
                      label: const Text('Favorite'),
                      onPressed: () {},
                    ),
                    CommandBarButton(
                      icon: const Icon(FluentIcons.copy),
                      label: const Text('Copy'),
                      onPressed: () {},
                    ),
                    CommandBarButton(
                      icon: const Icon(FluentIcons.share),
                      label: const Text('Share'),
                      onPressed: () {},
                    ),
                    CommandBarButton(
                      icon: const Icon(FluentIcons.save),
                      label: const Text('Save'),
                      onPressed: () {},
                    ),
                    CommandBarButton(
                      icon: const Icon(FluentIcons.delete),
                      label: const Text('Delete'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: FlyoutTarget(
          key: contextAttachKey, controller: contextController, child: widget),
    );
  }
}
