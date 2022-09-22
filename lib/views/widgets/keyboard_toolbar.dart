import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rich_text_composer/views/commons/image_paths.dart';

typedef IconWebCallback = void Function();

class KeyboardToolBar extends StatelessWidget {
  final Color backgroundKeyboardToolBarColor;
  final VoidCallback insertImage;
  final VoidCallback insertAttachment;
  final VoidCallback appendRickText;

  final ImagePaths _imagePaths = ImagePaths();

  KeyboardToolBar({
    super.key,
    required this.backgroundKeyboardToolBarColor,
    required this.insertImage,
    required this.insertAttachment,
    required this.appendRickText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: backgroundKeyboardToolBarColor,
      alignment: Alignment.centerLeft,
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          _buildIconWeb(
            iconPadding: EdgeInsets.zero,
            icon: SvgPicture.asset(
              _imagePaths.icAttachmentsComposer,
              color: Colors.black,
              fit: BoxFit.fill,
            ),
            onTap: () => insertAttachment(),
          ),
          _buildIconWeb(
            minSize: 30,
            iconPadding: EdgeInsets.zero,
            icon: SvgPicture.asset(
              _imagePaths.icInsertImage,
              color: Colors.black,
              fit: BoxFit.fill,
            ),
            onTap: () => insertImage(),
          ),
          const SizedBox(width: 10),
          _buildIconWeb(
            minSize: 30,
            iconPadding: EdgeInsets.zero,
            icon: SvgPicture.asset(
              _imagePaths.icRichText,
              color: Colors.black,
              fit: BoxFit.fill,
            ),
            onTap: () => appendRickText(),
          ),
        ],
      ),
    );
  }

  Widget _buildIconWeb({
    required Widget icon,
    IconWebCallback? onTap,
    EdgeInsets? iconPadding,
    double? iconSize,
    double? splashRadius,
    double? minSize,
    Color? colorSelected,
    Color? colorFocus,
    ShapeBorder? shapeBorder,
  }) {
    return Material(
        color: colorSelected ?? Colors.transparent,
        shape: shapeBorder ?? const CircleBorder(),
        child: IconButton(
            icon: icon,
            focusColor: colorFocus,
            iconSize: iconSize,
            constraints: minSize != null
                ? BoxConstraints(minWidth: minSize, minHeight: minSize)
                : null,
            padding: iconPadding ?? const EdgeInsets.all(8.0),
            splashRadius: splashRadius ?? 15,
            onPressed: onTap));
  }
}
