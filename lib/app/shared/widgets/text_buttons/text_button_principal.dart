import 'package:flutter/material.dart';

import '../../shared.dart';

class TextButtonPrincipal extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;

  const TextButtonPrincipal({
    required this.text,
    required this.onPressed,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle ?? TextStyles.textLabelButton,
      ),
    );
  }
}
