import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizeConfig {

  final MediaQueryData mediaQueryData;

  SizeConfig({required this.mediaQueryData});

  static SizeConfig of(BuildContext context) =>
      SizeConfig(mediaQueryData: MediaQuery.of(context));

  ///Calcula o tamanho da tela
  double height(){
    double appbar = AppBar().preferredSize.height;//Pegar o tamanho da AppBar
    return mediaQueryData.size.height - mediaQueryData.padding.top - appbar;
  }

  double dynamicScaleSize({double? size, double? scaleFactorTablet, double? scaleFactorMini}) {
    if(isTablet()) {
      final scaleFactor = scaleFactorTablet ?? 2;
      return size! * scaleFactor;
    }

    if(isMini()) {
      final scaleFactor = scaleFactorMini ?? 0.8;
      return size! * scaleFactor;
    }

    return size!;
  }

  /// Define o tipo de dispositivo com base em pixels de dispositivo lógico.
  /// Mais de 600 significa que é um tablet
  bool isTablet() {
    final shortestSide = mediaQueryData.size.shortestSide;
    return shortestSide > 600;
  }

  /// Define o tipo de dispositivo com base em pixels de dispositivo lógico.
  /// Menor ou igual a 320 significa que é um mini dispositivo
  bool isMini() {
    final shortestSide = mediaQueryData.size.shortestSide;
    return shortestSide <= 320;
  }
}