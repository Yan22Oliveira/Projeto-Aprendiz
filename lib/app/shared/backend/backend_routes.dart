import '../shared.dart';

///Classe para gerenciar as rotas
class BackendRoutes {

  static String baseURL = GlobalInformation.baseURL;

  ///Api dos Pastores
  static String listaPastores = baseURL + '/listaPastores.php';

  ///Api dos Comunicados
  static String listaComunicados = baseURL + '/listaComunicados.php';

  ///Api das Regiões
  static String listaRegioes = baseURL + '/listaRegioes.php';

  ///Api das Áreas
  static String listaAreas = baseURL + '/listaAreas.php';

  ///Api das Igrejas
  static String listaIgrejas = baseURL + '/listaIgrejas.php';

//static String enderecosId(String id) => "/endereco/$id";

}
