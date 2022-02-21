import '../../../secretary.dart';

abstract class RegionsState {}

class RegionsInitial implements RegionsState {}

class RegionsLoading implements RegionsState {}

class RegionsSucessful implements RegionsState {
  final List<RegionsModel> lista;
  RegionsSucessful(this.lista);
}

class RegionsNoConnection implements RegionsState{
  final String message;
  RegionsNoConnection(this.message);
}

class RegionsError implements RegionsState{
  final String message;
  RegionsError(this.message);
}