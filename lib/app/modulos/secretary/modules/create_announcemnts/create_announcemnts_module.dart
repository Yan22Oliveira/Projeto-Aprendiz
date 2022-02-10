import 'package:flutter_modular/flutter_modular.dart';

import './create_announcemnts_page.dart';

class CreateAnnouncemntsModule extends Module{

  @override
  List<Bind> get binds => [
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => const CreateAnnouncemntsPage(),
    ),
  ];

}