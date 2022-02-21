import '../../../secretary.dart';

abstract class AreaState {}

class AreaInitial implements AreaState {}

class AreaLoading implements AreaState {}

class AreaSucessful implements AreaState{
  final List<AreaModel> lista;
  AreaSucessful(this.lista);
}

class AreaNoConnection implements AreaState{
  final String message;
  AreaNoConnection(this.message);
}

class AreaError implements AreaState{
  final String message;
  AreaError(this.message);
}