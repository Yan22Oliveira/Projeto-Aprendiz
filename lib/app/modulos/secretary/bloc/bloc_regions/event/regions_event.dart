abstract class RegionsEvent{

}

class PesquisarRegions implements RegionsEvent{

  final String pesquisa;
  PesquisarRegions({required this.pesquisa,});

}