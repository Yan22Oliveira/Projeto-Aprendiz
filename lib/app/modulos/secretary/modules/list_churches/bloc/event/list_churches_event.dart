abstract class ListChurchesEvent {}

class PesquisarListChurches implements ListChurchesEvent{
  final String pesquisa;
  PesquisarListChurches({required this.pesquisa,});
}