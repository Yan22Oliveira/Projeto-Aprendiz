import 'package:flutter_modular/flutter_modular.dart';

import './regions_page.dart';

class RegionsModule extends Module{

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => const RegionsPage(),
    ),
  ];

}