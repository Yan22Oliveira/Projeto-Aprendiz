import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AppLocale extends ChangeNotifier {

  AppLocale(){
    _loadCurrentLanguage();
  }

  Locale? _locale;

  Locale get locale => _locale ?? const Locale('en');

  void changeLocale(Locale newLocale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(newLocale == const Locale('pt')) {
      _locale = const Locale('pt');
    } else {
      _locale = const Locale('en');
    }
    prefs.setString('locale', locale.toString());
    notifyListeners();
  }

  ///Carregar o idioma atual
  Future<void> _loadCurrentLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var language = prefs.getString('locale');
    if(language != null){
      _locale = Locale(prefs.getString('locale')!);
    }
    notifyListeners();
  }

}

///Para selecionar o idioma

//  var language = Provider.of<AppLocale>(context);

/*

  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('English'),
      const SizedBox(width: 8,),
      CupertinoSwitch(
        onChanged: (bool value) {
          value == true ?
          language.changeLocale(const Locale('pt')) :
          language.changeLocale(const Locale('en'));
        },
        value: language.locale == const Locale('en') ? false : true,
      ),
      const SizedBox(width: 8,),
      const Text('Portugues'),
    ],
  ),

*/