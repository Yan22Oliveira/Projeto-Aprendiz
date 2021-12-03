import 'package:flutter_modular/flutter_modular.dart';

import './student.dart';

class StudentModule extends Module {

  @override
  List<Bind> binds = [
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => const StudentPage()),
  ];

}
