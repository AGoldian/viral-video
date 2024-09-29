import 'package:flutter/material.dart';

import '../theme/color_theme.dart';

class PrettyButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final TextAlign? textAlign;
  final Color? buttonColor;
  final ShapeBorder? shape;
  final Alignment? alignment;
  final double height;
  final EdgeInsetsGeometry padding;
  final bool enabled;

  const PrettyButton._({
    required this.text,
    required this.onTap,
    this.textAlign,
    this.buttonColor,
    this.shape,
    this.alignment,
    this.height = 56,
    this.padding = EdgeInsets.zero,
    this.enabled = true,
    super.key,
  });

  factory PrettyButton.action({
    required String text,
    required VoidCallback onTap,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    bool enabled = true,
    Key? key,
  }) =>
      PrettyButton._(
        text: text,
        onTap: onTap,
        textAlign: TextAlign.center,
        buttonColor: ColorTheme.controlMain,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabled: enabled,
        padding: padding,
        key: key,
      );

  factory PrettyButton.secondary({
    required String text,
    required VoidCallback onTap,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    bool enabled = true,
    Key? key,
  }) =>
      PrettyButton._(
        text: text,
        onTap: onTap,
        textAlign: TextAlign.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            color: ColorTheme.controlMain,
            width: 2,
          ),
        ),
        enabled: enabled,
        padding: padding,
        key: key,
      );

  factory PrettyButton.flat({
    required String text,
    required VoidCallback onTap,
    Alignment? alignment,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    TextAlign? textAlign,
    bool enabled = true,
    Key? key,
  }) =>
      PrettyButton._(
        text: text,
        onTap: onTap,
        textAlign: textAlign ?? TextAlign.center,
        alignment: alignment ?? Alignment.centerLeft,
        enabled: enabled,
        padding: padding,
        height: 48,
        key: key,
      );

  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 64,
          maxWidth: 160,
          minHeight: height,
        ),
        child: Padding(
          padding: padding,
          child: MaterialButton(
            elevation: 0,
            color: buttonColor,
            shape: shape,
            onPressed: enabled ? () => onTap() : null,
            child: Align(
              alignment: alignment ?? Alignment.center,
              child: Text(
                text,
                textAlign: textAlign,
              ),
            ),
          ),
        ),
      );
}
