import '../../home_secretary.dart';

abstract class HomeSecretaryState {}

class HomeSecretaryInitial implements HomeSecretaryState{}

class HomeSecretaryLoading implements HomeSecretaryState{}

class HomeSecretarySucessful implements HomeSecretaryState{
  final HomeModel home;
  HomeSecretarySucessful(this.home);
}

class HomeSecretaryNoConnection implements HomeSecretaryState{
  final String message;
  HomeSecretaryNoConnection(this.message);
}

class HomeSecretaryError implements HomeSecretaryState{
  final String message;
  HomeSecretaryError(this.message);
}

class HomeSecretaryEmpty implements HomeSecretaryState{
  final String message;
  HomeSecretaryEmpty(this.message);
}