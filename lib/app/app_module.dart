import 'package:flutter_modular/flutter_modular.dart';

import 'package:shared_preferences/shared_preferences.dart';

import './modulos/modulos.dart';
import 'modulos/splash/splash_module.dart';

class AppModule extends Module{

  @override
  List<Bind> get binds => [
    AsyncBind ((i) =>  SharedPreferences.getInstance()),
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute(
      Modular.initialRoute,
      module: SplashModule(),
    ),
   // ChildRoute('/', child: (context, args) => const SplashPage()),
    ModuleRoute(
      '/home',
      module: HomeModule(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute('/login', child: (context, args) => LoginPage()),
    ChildRoute('/creatAccount', child: (context, args) => const CreateAccountFirst(),transition: TransitionType.fadeIn),
    ChildRoute('/createAccountSecond', child: (context, args) => const CreateAccountSecond(),transition: TransitionType.fadeIn),
    ChildRoute('/createAccountThird', child: (context, args) => const CreateAccountThird(),transition: TransitionType.fadeIn),
  ];

}