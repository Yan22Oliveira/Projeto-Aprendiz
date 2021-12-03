import 'package:flutter_modular/flutter_modular.dart';

import './access.dart';

class AccessModule extends Module {
  @override
  List<Bind> binds = [
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => const AccessPage()),
    ChildRoute('/login', child: (context, args) => LoginPage()),
    ChildRoute(
      '/creatAccount',
      child: (context, args) => const CreateAccountFirst(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/createAccountSecond',
      child: (context, args) => const CreateAccountSecond(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/createAccountThird',
      child: (context, args) => const CreateAccountThird(),
      transition: TransitionType.fadeIn,
    ),
  ];
}
