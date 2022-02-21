import 'package:flutter_modular/flutter_modular.dart';

import 'create_church_page.dart';

class CreateChurchModule extends Module{

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => const CreateChurchPage(),
    ),
  ];

}