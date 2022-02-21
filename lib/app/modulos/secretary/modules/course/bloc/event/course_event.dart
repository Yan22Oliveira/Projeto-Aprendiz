abstract class CourseEvent {}

class PesquisarCourse implements CourseEvent {
  final String pesquisa;
  PesquisarCourse({required this.pesquisa,});
}