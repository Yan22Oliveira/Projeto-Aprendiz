import 'package:flutter_modular/flutter_modular.dart';

import './list_churches.dart';

class ListChurchesModule extends Module{

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => const ListChurchesPage(),
    ),
  ];

}