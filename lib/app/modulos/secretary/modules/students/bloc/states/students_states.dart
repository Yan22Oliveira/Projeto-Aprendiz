import '../../students.dart';

abstract class StudentsState {}

class StudentsInitial implements StudentsState {}

class StudentsLoading implements StudentsState {}

class StudentsSucessful implements StudentsState{
  final List<StudentModel> lista;
  StudentsSucessful(this.lista);
}

class StudentsNoConnection implements StudentsState{
  final String message;
  StudentsNoConnection(this.message);
}

class StudentsError implements StudentsState{
  final String message;
  StudentsError(this.message);
}