abstract class StudentsEvent {}

class PesquisarStudents implements StudentsEvent{
  final String pesquisa;
  PesquisarStudents({required this.pesquisa,});
}