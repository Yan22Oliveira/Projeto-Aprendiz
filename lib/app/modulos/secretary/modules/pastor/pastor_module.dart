import 'package:flutter_modular/flutter_modular.dart';

import './pastor_page.dart';

class PastorModule extends Module{

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => const PastorPage(),
    ),
  ];

}