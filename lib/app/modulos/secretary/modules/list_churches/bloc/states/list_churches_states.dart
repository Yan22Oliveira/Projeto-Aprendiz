import '../../../../../../shared/shared.dart';

abstract class ListChurchesState {}

class ListChurchesInitial implements ListChurchesState{}

class ListChurchesLoading implements ListChurchesState{}

class ListChurchesSucessful implements ListChurchesState{
  final List<ChurchModel> lista;
  ListChurchesSucessful(this.lista);
}

class ListChurchesNoConnection implements ListChurchesState{
  final String message;
  ListChurchesNoConnection(this.message);
}

class ListChurchesError implements ListChurchesState{
  final String message;
  ListChurchesError(this.message);
}