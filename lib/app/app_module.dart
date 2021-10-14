import 'package:flutter_modular/flutter_modular.dart';

import './modulos/modulos.dart';

class AppModule extends Module{

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/home', child: (context, args) => const HomePage()),
    ChildRoute('/login', child: (context, args) => const LoginPage()),
    ChildRoute('/', child: (context, args) => const CreateAccountFirst()),
  ];

}