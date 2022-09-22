library keyboard_richtext;

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:rich_text_composer/richtext_append_controller.dart';
import 'package:rich_text_composer/views/widgets/keyboard_toolbar.dart';

class KeyboardRichText extends StatelessWidget {
  const KeyboardRichText({
    Key? key,
    required this.child,
    required this.richTextAppendController,
    required this.backgroundKeyboardToolBarColor,
    required this.insertImage,
    required this.insertAttachment,
    required this.appendRickText,
  }) : super(key: key);

  final Widget child;
  final RichTextAppendController richTextAppendController;
  final Color backgroundKeyboardToolBarColor;
  final VoidCallback insertImage;
  final VoidCallback insertAttachment;
  final VoidCallback appendRickText;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        body: child,
        bottomSheet: StreamBuilder(
          stream: richTextAppendController.richTextAppendStream,
          builder: (context, snapshot) {
            return Visibility(
              visible: snapshot.hasData &&
                  snapshot.data == true &&
                  isKeyboardVisible,
              child: KeyboardToolBar(
                backgroundKeyboardToolBarColor: backgroundKeyboardToolBarColor,
                insertImage: insertImage,
                insertAttachment: insertAttachment,
                appendRickText: appendRickText,
              ),
            );
          },
        ),
      );
    });
  }
}
