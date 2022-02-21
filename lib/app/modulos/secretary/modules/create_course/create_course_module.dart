import 'package:flutter_modular/flutter_modular.dart';

import './create_course_page.dart';

class CreateCourseModule extends Module{

  @override
  List<Bind> get binds => [
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
      child: (_, args) => const CreateCoursePage(),
    ),
  ];

}