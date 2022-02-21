abstract class HomeSecretaryEvent {}

class PesquisarInformacoes implements HomeSecretaryEvent{
  final String pesquisa;
  PesquisarInformacoes({required this.pesquisa,});
}