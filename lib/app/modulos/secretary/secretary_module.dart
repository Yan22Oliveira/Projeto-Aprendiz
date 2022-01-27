import 'package:flutter_modular/flutter_modular.dart';

import './secretary.dart';

class SecretaryModule extends Module{

  @override
  List<Bind> get binds => [
    Bind.singleton((i) => ShepherdBloc(i())),
    Bind.factory((i)   => ShepherdRepository(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => SecretaryPage(),
    ),
    ModuleRoute(
      '/home_secretary',
      module: HomeSecretaryModule(),
      transition: TransitionType.fadeIn,
    ),
  ];

}