import 'package:flutter_modular/flutter_modular.dart';

import './home.dart';

class HomeModule extends Module {
  @override
  List<Bind> binds = [
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => const HomePage()),
  ];
}
