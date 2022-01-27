import 'package:flutter_modular/flutter_modular.dart';

import './home_secretary_page.dart';

class HomeSecretaryModule extends Module{

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => const HomeSecretaryPage(),
    ),
  ];

}