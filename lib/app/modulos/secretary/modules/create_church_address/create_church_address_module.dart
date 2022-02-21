import 'package:flutter_modular/flutter_modular.dart';

import './create_church_address_page.dart';

class CreateChurchAddressModule extends Module{

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => const CreateCruchAddressPage(),
    ),
  ];

}