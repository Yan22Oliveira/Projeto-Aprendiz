import 'package:flutter/cupertino.dart';

import '../modulos.dart';

class SecretaryController {

  SecretaryController(this._pageController);

  final PageController _pageController;

  EnumsSecretary page = EnumsSecretary.home;

  void setPage(EnumsSecretary value){
    if(value == page) {
      return;
    }
    page = value;
    _pageController.jumpToPage(value.index);
  }

}