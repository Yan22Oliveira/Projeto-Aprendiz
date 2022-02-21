import 'package:flutter_modular/flutter_modular.dart';

import '../../secretary.dart';

class ChurchModule extends Module{

  @override
  List<Bind> get binds => [
    Bind.singleton((i) => AreaBloc(i(),i())),
    Bind.factory((i)   => AreaRepository(i())),

    Bind.singleton((i) => RegionsBloc(i(),i())),
    Bind.factory((i)   => RegionsRepository(i())),

    Bind.singleton((i) => ListChurchesBloc(i(),i())),
    Bind.factory((i)   => ListChurchesRepository(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => const ChurchPage(),
    ),

    ChildRoute(
      '/address',
      child: (context, args) => const CreateCruchAddressPage(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/create_churches',
      module: CreateChurchModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/create_churches_address',
      module: CreateChurchAddressModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/list_churches',
      module: ListChurchesModule(),
      transition: TransitionType.fadeIn,
    ),

    ModuleRoute(
      '/regions',
      module: RegionsModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/create_regions',
      module: CreateRegionsModule(),
      transition: TransitionType.fadeIn,
    ),

    ModuleRoute(
      '/areas',
      module: AreaModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/create_areas',
      module: CreateAreaModule(),
      transition: TransitionType.fadeIn,
    ),

  ];

}