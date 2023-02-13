import 'package:flutter/widgets.dart';

class KeyboardDismisser extends StatelessWidget {
  const KeyboardDismisser({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // Global GestureDetector that will dismiss the keyboard
    return GestureDetector(
      key: const ValueKey('GlobalKeyboardDismisser'),
      behavior: HitTestBehavior.deferToChild,
      onTap: () {
        // When running in iOS, dismiss the keyboard when any Tap happens
        // outside a TextField
        // if (Platform.isIOS) _hideKeyboard(context);
        _hideKeyboard(context);
      },
      child: child,
    );
  }

  void _hideKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
