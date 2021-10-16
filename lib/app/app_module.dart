import 'package:flutter_modular/flutter_modular.dart';

import './modulos/modulos.dart';

class AppModule extends Module{

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/splash', child: (context, args) => const SplashPage()),
    ChildRoute('/', child: (context, args) => LoginPage()),
    ChildRoute('/home', child: (context, args) => const HomePage()),
    ChildRoute('/creatAccount', child: (context, args) => const CreateAccountFirst(),transition: TransitionType.fadeIn),
    ChildRoute('/createAccountSecond', child: (context, args) => const CreateAccountSecond(),transition: TransitionType.fadeIn),
    ChildRoute('/createAccountThird', child: (context, args) => const CreateAccountThird(),transition: TransitionType.fadeIn),
  ];

}