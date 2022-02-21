import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

import '../teachers.dart';
import '../../../../../shared/shared.dart';

class TeachersRepository extends Disposable {

  final Dio dio;
  TeachersRepository(this.dio);

  ///Pegar a lista dos professores
  Future<List<TeacherModel>> getTeachers() async {

    List<TeacherModel> listaTeachers = [];

    await Future.delayed(const Duration(seconds: 1));

    try {

      var body = json.encode({
        'token': GlobalInformation.token,
      });

      //final response = await dio.post(BackendRoutes.listaProfessoresGeral, data: body,);

      //Parte de teste, por não ter ambiente
      final response = Response(
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
        data: returnTeachers,
      );

      if(response.statusCode == 200) {
        for (Map<String, dynamic> item in response.data!) {
          TeacherModel student = TeacherModel.fromJson(item);
          listaTeachers.add(student);
        }
      }

    } catch (e) {
      print(e);
      rethrow;
    }

    return listaTeachers;

  }

  @override
  void dispose() {}

}

const returnTeachers = [
  {
    "id": 1,
    "ativo": 1,
    "user": {
      'id':       1,
      'email':    'joao@gmail.com',
      'nome':     'João Paulo silva',
      'telefone': '37984736251',
      'imagem':   'imagem',
      'dataNascimento':  '1990-05-21',
      'dataCadastro':    '2022-01-01',
      'dataAtualizacao': '2022-01-01',
      'igreja':   {
        'id':         1,
        'nome':       'Belvedere',
        'idArea':     1,
        'nomeArea':   'Centro',
        'idRegiao':   1,
        'nomeRegiao': 'Divinópolis',
        "endereco": {
          "id":1,
          "cep": "35502133",
          "logradouro": "RUA JOAO DE BARRO",
          "numero": "521",
          "complemento": "CASA",
          "bairro": "SERRA VERDE",
          "cidade": "DIVINOPOLIS",
          "codigoIBGE": "3122306",
          "estado": "MG",
          "latitude": -20.113638,
          "longitude": -44.9042497,
        }
      },
      "endereco": {
        "id":1,
        "cep": "35502133",
        "logradouro": "RUA JOAO DE BARRO",
        "numero": "521",
        "complemento": "CASA",
        "bairro": "SERRA VERDE",
        "cidade": "DIVINOPOLIS",
        "codigoIBGE": "3122306",
        "estado": "MG",
        "latitude": -20.113638,
        "longitude": -44.9042497,
      }
    },
  },
  {
    "id": 2,
    "ativo": 0,
    "user": {
      'id':       2,
      'email':    'priscila@gmail.com',
      'nome':     'Priscila Faria',
      'telefone': '37998122334',
      'imagem':   'imagem',
      'dataNascimento':  '1990-05-12',
      'dataCadastro':    '2022-01-01',
      'dataAtualizacao': '2022-01-01',
      'igreja':   {
        'id':         2,
        'nome':       'Bom Pastor',
        'idArea':     2,
        'nomeArea':   'Bom Pastor',
        'idRegiao':   2,
        'nomeRegiao': 'Divinópolis',
        "endereco": {
          "id":1,
          "cep": "35502133",
          "logradouro": "RUA JOAO DE BARRO",
          "numero": "521",
          "complemento": "CASA",
          "bairro": "SERRA VERDE",
          "cidade": "DIVINOPOLIS",
          "codigoIBGE": "3122306",
          "estado": "MG",
          "latitude": -20.113638,
          "longitude": -44.9042497,
        }
      },
      "endereco": {
        "id":1,
        "cep": "35502133",
        "logradouro": "RUA JOAO DE BARRO",
        "numero": "521",
        "complemento": "CASA",
        "bairro": "SERRA VERDE",
        "cidade": "DIVINOPOLIS",
        "codigoIBGE": "3122306",
        "estado": "MG",
        "latitude": -20.113638,
        "longitude": -44.9042497,
      }
    },
  },
  {
    "id": 3,
    "ativo": 2,
    "user": {
      'id':       3,
      'email':    'pedro@gmail.com',
      'nome':     'Pedro Paulo',
      'telefone': '37991827364',
      'imagem':   'imagem',
      'dataNascimento':  '2000-04-19',
      'dataCadastro':    '2022-01-01',
      'dataAtualizacao': '2022-01-01',
      'igreja':   {
        'id':         3,
        'nome':       'São Luiz',
        'idArea':     3,
        'nomeArea':   'Esplanada',
        'idRegiao':   2,
        'nomeRegiao': 'Divinópolis',
        "endereco": {
          "id":1,
          "cep": "35502133",
          "logradouro": "RUA JOAO DE BARRO",
          "numero": "521",
          "complemento": "CASA",
          "bairro": "SERRA VERDE",
          "cidade": "DIVINOPOLIS",
          "codigoIBGE": "3122306",
          "estado": "MG",
          "latitude": -20.113638,
          "longitude": -44.9042497,
        }
      },
      "endereco": {
        "id":1,
        "cep": "35502133",
        "logradouro": "RUA JOAO DE BARRO",
        "numero": "521",
        "complemento": "CASA",
        "bairro": "SERRA VERDE",
        "cidade": "DIVINOPOLIS",
        "codigoIBGE": "3122306",
        "estado": "MG",
        "latitude": -20.113638,
        "longitude": -44.9042497,
      }
    },
  },
];