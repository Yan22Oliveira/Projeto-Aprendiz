import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

import '../students.dart';
import '../../../../../shared/shared.dart';

class StudentsRepository extends Disposable {

  final Dio dio;
  StudentsRepository(this.dio);

  ///Pegar a lista dos alunos
  Future<List<StudentModel>> getStudents() async {

    List<StudentModel> listaStudents = [];

    await Future.delayed(const Duration(seconds: 1));

    try {

      var body = json.encode({
        'token': GlobalInformation.token,
      });

      //final response = await dio.post(BackendRoutes.listaAlunosGeral, data: body,);

      //Parte de teste, por não ter ambiente
      final response = Response(
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
        data: returnStudents,
      );

      if(response.statusCode == 200) {
        for (Map<String, dynamic> item in response.data!) {
          StudentModel student = StudentModel.fromJson(item);
          listaStudents.add(student);
        }
      }

    } catch (e) {
      print(e);
      rethrow;
    }

    return listaStudents;

  }

  @override
  void dispose() {}

}

const returnStudents = [
  {
    "id": 1,
    "classe": 1,
    "ativo": 1,
    "user": {
      'id':       1,
      'email':    'yanoliveira2014@gmail.com',
      'nome':     'Yan Ribeiro de Oliveira',
      'telefone': '37991110247',
      'imagem':   'imagem',
      'dataNascimento':  '1996-11-22',
      'dataCadastro':    '2022-01-01',
      'dataAtualizacao': '2022-01-01',
      'igreja':   {
        'id':         1,
        'nome':       'Serra Verde',
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
    "classe": 1,
    "ativo": 0,
    "user": {
      'id':       2,
      'email':    'samara@gmail.com',
      'nome':     'Samara Brito Oliveira',
      'telefone': '37991710350',
      'imagem':   'imagem',
      'dataNascimento':  '2002-09-30',
      'dataCadastro':    '2022-01-01',
      'dataAtualizacao': '2022-01-01',
      'igreja':   {
        'id':         2,
        'nome':       'Central',
        'idArea':     2,
        'nomeArea':   'Centro',
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
    "classe": 1,
    "ativo": 2,
    "user": {
      'id':       3,
      'email':    'anapaula@gmail.com',
      'nome':     'Ana Paula Reis',
      'telefone': '37988771122',
      'imagem':   'imagem',
      'dataNascimento':  '2002-09-30',
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