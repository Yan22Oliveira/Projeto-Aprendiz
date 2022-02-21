import '../shared.dart';

///Classe para gerenciar as rotas
class BackendRoutes {

  static String baseURL = GlobalInformation.baseURL;

  ///Api dos Alunos
  static String listaAlunosGeral = baseURL + '/listaAlunosGeral.php';

  ///Api dos Professores
  static String listaProfessoresGeral = baseURL + '/listaProfessoresGeral.php';

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

  ///Api das Cursos
  static String listaCursos = baseURL + '/listaCursos.php';

  ///Api das Informações
  static String listaInformacoes = baseURL + '/listaInformacoes.php';

//static String enderecosId(String id) => "/endereco/$id";

}
