import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../shared.dart';

class ButtonBorda extends StatelessWidget {

  final String? text;
  final VoidCallback? onPressed;
  final Color color;
  final IconData? icon;

  const ButtonBorda({
    this.text,
    this.onPressed,
    this.color = AppColors.green,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: AppColors.background,
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
            color: color,
          ),
        ),
      ),
      child: SizedBox(
        height: 36,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  text??'',
                  style: GoogleFonts.lexendDeca(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: color,
                  ),
                ),
              ),
              Container(
                alignment: text!=null?Alignment.centerRight:Alignment.center,
                child: Icon(
                  icon,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
