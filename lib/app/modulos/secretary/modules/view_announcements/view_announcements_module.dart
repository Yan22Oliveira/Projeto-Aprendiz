import 'package:flutter_modular/flutter_modular.dart';

import './view_announcements_page.dart';

class ViewAnnouncementsModule extends Module{

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => ViewAnnouncementsPage(
        announcements: args.data,
      ),
    ),
  ];

}