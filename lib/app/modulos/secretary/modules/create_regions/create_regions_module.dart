import 'package:flutter_modular/flutter_modular.dart';

import './create_regions_page.dart';

class CreateRegionsModule extends Module{

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => const CreateRegionsPage(),
    ),
  ];

}