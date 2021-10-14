import 'package:flutter/material.dart';

import '../../shared.dart';

class ButtonPrincipal extends StatelessWidget {

  final String text;
  final VoidCallback? onPressed;
  final Color color;
  final IconData? icon;

  const ButtonPrincipal({
    required this.text,
    required this.onPressed,
    this.color = AppColors.verde,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 3,
        primary: color,
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: SizedBox(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: TextStyles.textButton,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
