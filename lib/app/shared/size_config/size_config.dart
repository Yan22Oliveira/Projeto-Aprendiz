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

  double width(){
    return mediaQueryData.size.width;
  }

  double dynamicScaleSize({double? size, double? scaleFactorTablet, double? scaleFactorMini}) {
    if(isTablet()) {
      final scaleFactor = scaleFactorTablet ?? 2;
      return size! * scaleFactor;
    }

    if(isMobile()) {
      final scaleFactor = scaleFactorMini ?? 0.8;
      return size! * scaleFactor;
    }

    return size!;
  }

  /// Define o tipo de dispositivo com base em pixels de dispositivo lógico.

  /// Mais de 1100 significa que é um web
  bool isWeb() {
    final shortestSide = mediaQueryData.size.width;
    return shortestSide >= 1100;
  }

  /// Mais de 850 significa que é um tablet
  bool isTablet() {
    final shortestSide = mediaQueryData.size.width;
    return shortestSide < 1100 && shortestSide >= 850;
  }

  /// Menor que 850 significa que é um Mobile
  bool isMobile() {
    final shortestSide = mediaQueryData.size.width;
    return shortestSide < 850;
  }

}