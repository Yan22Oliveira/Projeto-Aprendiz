import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

import '../announcements.dart';
import '../../../../../shared/shared.dart';

class AnnouncementsRepository extends Disposable {

  final Dio dio;
  AnnouncementsRepository(this.dio);

  ///Pegar a lista dos comunicados
  Future<List<AnnouncementsModel>> getAnnouncements() async {

    List<AnnouncementsModel> listaAnnouncements = [];

    await Future.delayed(const Duration(seconds: 1));

    try {

      var body = json.encode({
        'token': GlobalInformation.token,
      });

      //final response = await dio.post(BackendRoutes.listaComunicados, data: body,);

      //Parte de teste, por não ter ambiente
      final response = Response(
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
        data: returnAnnouncements,
      );


      if(response.statusCode == 200) {
        for (Map<String, dynamic> item in response.data!) {
          AnnouncementsModel announcements = AnnouncementsModel.fromJson(item);
          listaAnnouncements.add(announcements);
        }
      }

    } catch (e) {
      rethrow;
    }

    return listaAnnouncements;

  }

  @override
  void dispose() {}

}

const returnAnnouncements = [
  {
    "id": 1,
    "title": "Início do Projeto Aprendiz",
    "subTitle": "Próxima semana dia 04/04/2022",
    "mensagem": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    "dataCadastro": "2022-03-28 12:12:12",
  },
  {
    "id": 2,
    "title": "Inscrições abertas para os Professores",
    "subTitle": "De 04/04 à 28/04",
    "mensagem": "   Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. \n\nThe first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
    "dataCadastro": "2022-03-28 12:12:12",
  },
  {
    "id": 3,
    "title": "Inscrições abertas para os Alunos",
    "subTitle": "De 01/05 a 20/05",
    "mensagem": "   It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.  \n\nMany desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.  \n\nVarious versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
    "dataCadastro": "2022-03-28 12:12:12",
  },
  {
    "id": 4,
    "title": "Reunião Geral",
    "subTitle": "Reunião com todos os professores no dia 21/05",
    "mensagem": "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.\n\n   All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
    "dataCadastro": "2022-03-28 12:12:12",
  },
];