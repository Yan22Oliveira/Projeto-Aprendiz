import '../../../../secretary.dart';

abstract class TeachersState {}

class TeachersInitial implements TeachersState {}

class TeachersLoading implements TeachersState {}

class TeachersSucessful implements TeachersState {
  final List<TeacherModel> lista;
  TeachersSucessful(this.lista);
}

class TeachersNoConnection implements TeachersState {
  final String message;
  TeachersNoConnection(this.message);
}

class TeachersError implements TeachersState {
  final String message;
  TeachersError(this.message);
}