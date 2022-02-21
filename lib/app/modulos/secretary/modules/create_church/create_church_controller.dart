import 'package:flutter/material.dart';

import '../../secretary.dart';

class CreateChurchController extends ChangeNotifier {

  RegionsModel? region;

  bool get selectRegion => region!=null;

  set setRegion(RegionsModel? value){
    region = value;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    region = null;
  }

}