import 'package:flutter_modular/flutter_modular.dart';

import './teachers_page.dart';

class TeachersModule extends Module{

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => const TeachersPage(),
    ),
  ];

}