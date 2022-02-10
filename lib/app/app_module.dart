import 'package:flutter_modular/flutter_modular.dart';

import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './modulos/modulos.dart';
import './shared/shared.dart';

class AppModule extends Module{

  @override
  List<Bind> get binds => [
    AsyncBind ((i) =>  SharedPreferences.getInstance()),
    Bind.factory((i) => Connectivity()),
    Bind.factory((i) => Dio()),

    Bind.factory((i) => ConnectivityService(i())),

  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute(
      Modular.initialRoute,
      module: SplashModule(),
    ),
    ModuleRoute(
      '/access',
      module: AccessModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/home',
      module: HomeModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/secretary',
      module: SecretaryModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/student',
      module: StudentModule(),
      transition: TransitionType.fadeIn,
    ),

  ];

}