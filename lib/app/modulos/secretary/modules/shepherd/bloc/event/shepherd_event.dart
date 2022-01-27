abstract class ShepherdEvent{

}

class PesquisarPastores implements ShepherdEvent{

  final String pesquisa;
  PesquisarPastores({required this.pesquisa,});

}