import '../../shepherd.dart';

abstract class ShepherdState {

}

class ShepherdInitial implements ShepherdState{

}

class ShepherdLoading implements ShepherdState{

}

class ShepherdSucessful implements ShepherdState{
  final List<ShepherdModel> lista;
  ShepherdSucessful(this.lista);
}

class ShepherdError implements ShepherdState{
  final String message;
  ShepherdError(this.message);
}