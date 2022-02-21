import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

import '../home_secretary.dart';
import '../../../../../shared/shared.dart';

class HomeRepository extends Disposable {

  final Dio dio;
  HomeRepository(this.dio);

  int statusVazio = 0;
  int statusAtivo = 1;
  int statusErro  = 2;

  ///Pegar as informações
  Future<HomeModel> getInformacoes() async {

    await Future.delayed(const Duration(seconds: 1));

    HomeModel homeModel = HomeModel();

    try {

      var body = json.encode({
        'token': GlobalInformation.token,
      });

      //final response = await dio.post(BackendRoutes.listaInformacoes, data: body,);

      ///Parte de teste, por não ter ambiente
      final response = Response(
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
        data: dataReturn,
      );

      if(response.statusCode == 200) {
        homeModel = HomeModel.fromJson(response.data!);
      }else{
        homeModel = HomeModel(status: statusErro);
      }

    } catch (e) {
      print(e);
      rethrow;
    }

    return homeModel;

  }

  @override
  void dispose() {}

}

const dataReturn = {
  "id": 1,
  "status": 0,
  "idSecretario": 1,
  "nomeSecretario": "Gabriel",
  "dataCadastro": "2022-01-01",
  "informacoes": returnHomeStart,
};

const returnHome = [
  {
    "id": 1,
    "texto": "Início do Projeto Aprendiz",
    "subTexto": "Data início 04/04/2021",
    "status": false,
    "ativo": false,
  },
  {
    "id": 2,
    "texto": "Projeto Aprendiz Iníciado",
    "subTexto": "Início 04/04/2021",
    "status": true,
    "ativo": true,
  },
  {
    "id": 3,
    "texto": "Fim do Projeto Aprendiz",
    "subTexto": "Data do términio 11/11/2021",
    "status": false,
    "ativo": true,
  },
  {
    "id": 4,
    "texto": "Projeto Aprendiz Finalizado",
    "subTexto": "Fim 04/04/2021",
    "status": true,
    "ativo": false,
  },
  {
    "id": 5,
    "texto": "Início das inscrições dos Professores",
    "subTexto": "Data início 04/04/2021",
    "status": false,
    "ativo": false,
  },
  {
    "id": 6,
    "texto": "Inscrições dos Professores finalizadas",
    "subTexto": "Início 04/04/2021",
    "status": true,
    "ativo": true,
  },
  {
    "id": 7,
    "texto": "Início das inscrições dos Alunos",
    "subTexto": "Data início 04/04/2021",
    "status": false,
    "ativo": false,
  },
  {
    "id": 8,
    "texto": "Inscrições dos Alunos finalizadas",
    "subTexto": "Início 04/04/2021",
    "status": true,
    "ativo": true,
  },
];

const returnHomeStart = [
  {
    "id": 1,
    "texto": "Início do Projeto Aprendiz",
    "subTexto": "Data início 04/04/2021",
    "status": false,
    "ativo": true,
  },
  {
    "id": 2,
    "texto": "Projeto Aprendiz Iníciado",
    "subTexto": "Início 04/04/2021",
    "status": true,
    "ativo": false,
  },
  {
    "id": 3,
    "texto": "Fim do Projeto Aprendiz",
    "subTexto": "Data do términio 11/11/2021",
    "status": false,
    "ativo": true,
  },
  {
    "id": 4,
    "texto": "Projeto Aprendiz Finalizado",
    "subTexto": "Fim 04/04/2021",
    "status": true,
    "ativo": false,
  },
  {
    "id": 5,
    "texto": "Início das inscrições dos Professores",
    "subTexto": "Data início 04/04/2021",
    "status": false,
    "ativo": true,
  },
  {
    "id": 6,
    "texto": "Inscrições dos Professores finalizadas",
    "subTexto": "Início 04/04/2021",
    "status": true,
    "ativo": false,
  },
  {
    "id": 7,
    "texto": "Início das inscrições dos Alunos",
    "subTexto": "Data início 12/04/2021",
    "status": false,
    "ativo": true,
  },
  {
    "id": 8,
    "texto": "Inscrições dos Alunos finalizadas",
    "subTexto": "Início 04/04/2021",
    "status": true,
    "ativo": false,
  },
];

const returnHomeFinalizado = [
  {
    "id": 2,
    "texto": "Projeto Aprendiz Iníciado",
    "subTexto": "Início 04/04/2021",
    "status": true,
    "ativo": true,
  },
  {
    "id": 3,
    "texto": "Fim do Projeto Aprendiz",
    "subTexto": "Data do términio 11/11/2021",
    "status": false,
    "ativo": true,
  },
  {
    "id": 6,
    "texto": "Inscrições dos Professores finalizadas",
    "subTexto": "Início 04/04/2021",
    "status": true,
    "ativo": true,
  },
  {
    "id": 8,
    "texto": "Inscrições dos Alunos finalizadas",
    "subTexto": "Início 04/04/2021",
    "status": true,
    "ativo": true,
  },
];