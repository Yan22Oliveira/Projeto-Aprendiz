import 'package:flutter_modular/flutter_modular.dart';

import './area_page.dart';

class AreaModule extends Module{

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => const AreaPage(),
    ),
  ];

}