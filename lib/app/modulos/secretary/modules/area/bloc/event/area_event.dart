abstract class AreaEvent{

}

class PesquisarArea implements AreaEvent{

  final String pesquisa;
  PesquisarArea({required this.pesquisa,});

}