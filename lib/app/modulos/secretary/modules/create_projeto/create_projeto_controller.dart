import 'package:flutter/material.dart';

import './models/models.dart';

class CreateProjetoController extends ChangeNotifier {

  DatesModel? datesProjeto;
  set setDatesProjeto(DatesModel? value){
    datesProjeto = value;
    notifyListeners();
  }

  bool get selectDatesProjeto => datesProjeto != null;

  DatesModel? datesTeachers;
  set setdatesTeachers(DatesModel? value){
    datesTeachers = value;
    notifyListeners();
  }

  bool get selectDatesTeachers => datesTeachers != null;

  DatesModel? datesStudents;
  set setDatesStudents(DatesModel? value){
    datesStudents = value;
    notifyListeners();
  }

  bool get selectDatesStudents => datesStudents != null;

  void clean(){
    setDatesProjeto  = null;
    setdatesTeachers = null;
    setDatesStudents = null;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    clean();
  }

}