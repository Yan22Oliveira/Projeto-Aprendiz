import 'package:flutter_modular/flutter_modular.dart';

import './create_projeto_page.dart';

class CreateProjetoModule extends Module{

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => const CreateProjetoPage(),
    ),
  ];

}