import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import './themes.dart';

class TextStyles {
  static final titleAppBar = GoogleFonts.inter(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );
  static final titleCard = GoogleFonts.lexendDeca(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.secundary,
  );
  static final textCard = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.secundary,
  );
  static final textButton = GoogleFonts.lexendDeca(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.background,
  );
  static final textForm = GoogleFonts.lexendDeca(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
  static final labelText = GoogleFonts.lexendDeca(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    color: AppColors.black87,
  );
  static final formText = GoogleFonts.lexendDeca(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
  static final textLabelButton = GoogleFonts.lexendDeca(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );
  static final textLabelButtonBold = GoogleFonts.lexendDeca(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
}