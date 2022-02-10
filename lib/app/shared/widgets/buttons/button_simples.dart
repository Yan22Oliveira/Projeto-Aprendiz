import 'package:flutter/material.dart';

import '../../shared.dart';

class ButtonSimples extends StatelessWidget {

  final String text;
  final VoidCallback? onPressed;
  final Color color;

  const ButtonSimples({
    required this.text,
    required this.onPressed,
    this.color = AppColors.grey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 3,
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: SizedBox(
        height: 28,
        child: Center(
          child: Text(
            text,
            style: TextStyles.textButton,
          ),
        ),
      ),
    );

  }
}