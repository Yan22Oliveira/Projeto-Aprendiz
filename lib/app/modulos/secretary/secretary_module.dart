import 'package:flutter_modular/flutter_modular.dart';

import './secretary.dart';

class SecretaryModule extends Module{

  @override
  List<Bind> get binds => [
    Bind.singleton((i) => AnnouncementsBloc(i(),i())),
    Bind.factory((i)   => AnnouncementsRepository(i())),

    Bind.singleton((i) => PastorBloc(i(),i())),
    Bind.factory((i)   => PastorRepository(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => SecretaryPage(),
    ),

    ModuleRoute(
      '/announcements',
      module: AnnouncementsModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/create_announcemnts',
      module: CreateAnnouncemntsModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/view_announcements',
      module: ViewAnnouncementsModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/dashboard',
      module: DashboardModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/dashboard',
      module: DashboardModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/pastor',
      module: PastorModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/create_pastor',
      module: CreatePastorModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/edit_pastor',
      module: EditPastorModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/church',
      module: ChurchModule(),
      transition: TransitionType.fadeIn,
    ),
  ];

}