import '../../pastor.dart';

abstract class PastorState {

}

class PastorInitial implements PastorState{

}

class PastorLoading implements PastorState{

}

class PastorSucessful implements PastorState{
  final List<PastorModel> lista;
  PastorSucessful(this.lista);
}

class PastorNoConnection implements PastorState{
  final String message;
  PastorNoConnection(this.message);
}

class PastorError implements PastorState{
  final String message;
  PastorError(this.message);
}