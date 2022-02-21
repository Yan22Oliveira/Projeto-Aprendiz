import 'package:flutter_modular/flutter_modular.dart';

import './secretary.dart';

class SecretaryModule extends Module{

  @override
  List<Bind> get binds => [
    Bind.singleton((i) => AnnouncementsBloc(i(),i())),
    Bind.factory((i)   => AnnouncementsRepository(i())),

    Bind.singleton((i) => CourseBloc(i(),i())),
    Bind.factory((i)   => CourseRepository(i())),

    Bind.singleton((i) => PastorBloc(i(),i())),
    Bind.factory((i)   => PastorRepository(i())),

    Bind.singleton((i) => HomeBloc(i(),i())),
    Bind.factory((i)   => HomeRepository(i())),

    Bind.singleton((i) => StudentsBloc(i(),i())),
    Bind.factory((i)   => StudentsRepository(i())),

    Bind.singleton((i) => TeachersBloc(i(),i())),
    Bind.factory((i)   => TeachersRepository(i())),
  ];

  @override
  List<ModularRoute> get routes => [

    ChildRoute('/:name',
      child: (_, args) => SecretaryPage(name: args.params['name']),
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
    ModuleRoute(
      '/courses',
      module: CourseModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/create_course',
      module: CreateCourseModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/create_projeto',
      module: CreateProjetoModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/students',
      module: StudentsModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/teachers',
      module: TeachersModule(),
      transition: TransitionType.fadeIn,
    ),
  ];

}