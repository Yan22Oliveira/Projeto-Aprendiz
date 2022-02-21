abstract class TeachersEvent {}

class PesquisarTeachers implements TeachersEvent{
  final String pesquisa;
  PesquisarTeachers({required this.pesquisa,});
}