abstract class PastorEvent{

}

class PesquisarPastores implements PastorEvent{

  final String pesquisa;
  PesquisarPastores({required this.pesquisa,});

}