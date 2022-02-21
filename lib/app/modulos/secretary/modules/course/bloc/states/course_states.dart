import '../../course.dart';

abstract class CourseState {}

class CourseInitial implements CourseState {}

class CourseLoading implements CourseState {}

class CourseSucessful implements CourseState{
  final List<CourseModel> lista;
  CourseSucessful(this.lista);
}

class CourseNoConnection implements CourseState{
  final String message;
  CourseNoConnection(this.message);
}

class CourseError implements CourseState{
  final String message;
  CourseError(this.message);
}