import 'package:flutter/widgets.dart';

extension KeyboardExtensionsOnBuildContext on BuildContext {
  Future<void> hideKeyboard() async {
    final mq = MediaQuery.of(this);
    // hide keyboard
    FocusManager.instance.primaryFocus?.unfocus();

    // wait to it to be closed
    final isKeyboardClosed = mq.viewInsets.bottom == 0;
    if (!isKeyboardClosed) {
      await Future<void>.delayed(const Duration(milliseconds: 230));
    }
  }
}
