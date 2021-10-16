import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:splash_screen_view/SplashScreenView.dart';

import '../../modulos/modulos.dart';
import '../../shared/shared.dart';

class SplashPage extends StatefulWidget {

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: LoginPage(),
      duration: 2000,
      imageSize: 280,
      imageSrc: AppImages.logoDiv,
      backgroundColor: AppColors.background,
    );
  }
}