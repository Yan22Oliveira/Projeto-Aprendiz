abstract class AnnouncementsEvent{

}

class PesquisarComunicados implements AnnouncementsEvent{

  final String pesquisa;
  PesquisarComunicados({required this.pesquisa,});

}