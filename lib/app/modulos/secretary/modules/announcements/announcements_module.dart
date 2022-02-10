import 'package:flutter_modular/flutter_modular.dart';

import './announcements_page.dart';

class AnnouncementsModule extends Module{

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => const AnnouncementsPage(),
    ),
  ];

}