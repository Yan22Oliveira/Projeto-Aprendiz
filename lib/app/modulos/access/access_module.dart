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
      '/creat_account',
      child: (context, args) => const CreateAccountFirst(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/create_account_second',
      child: (context, args) => const CreateAccountSecond(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/create_account_third',
      child: (context, args) => const CreateAccountThird(),
      transition: TransitionType.fadeIn,
    ),
  ];
}
