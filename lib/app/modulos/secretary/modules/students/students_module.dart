import 'package:flutter_modular/flutter_modular.dart';

import './students_page.dart';

class StudentsModule extends Module{

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => const StudentsPage(),
    ),
  ];

}