import 'package:flutter_modular/flutter_modular.dart';

import './create_pastor_page.dart';

class CreatePastorModule extends Module{

  @override
  List<Bind> get binds => [
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => const CreatePastorPage(),
    ),
  ];

}