import 'package:flutter_modular/flutter_modular.dart';

import './shepherd_page.dart';

class ShepherdModule extends Module{

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => const ShepherdPage(),
    ),
  ];

}