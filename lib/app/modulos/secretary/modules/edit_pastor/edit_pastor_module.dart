import 'package:flutter_modular/flutter_modular.dart';

import './edit_pastor_page.dart';

class EditPastorModule extends Module{

  @override
  List<Bind> get binds => [
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => EditPastorPage(shepherd: args.data,),
    ),
  ];

}