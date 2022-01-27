import '../shared.dart';

///Classe para gerenciar as rotas
class BackendRoutes {

  static String baseURL = GlobalInformation.baseURL;

  ///Api dos Pastores
  static String listaPastores = baseURL + '/listaPastores.php';

//static String enderecosId(String id) => "/endereco/$id";

}
