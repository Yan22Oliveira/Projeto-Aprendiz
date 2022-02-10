import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

import '../list_churches.dart';
import '../../../../../shared/shared.dart';

class ListChurchesRepository extends Disposable {

  final Dio dio;
  ListChurchesRepository(this.dio);

  ///Pegar a lista das Igrejas
  Future<List<ChurchModel>> getListChurches() async {

    List<ChurchModel> listChurches = [];

    await Future.delayed(const Duration(seconds: 1));

    try {

      var body = json.encode({
        'token': GlobalInformation.token,
      });

      //final response = await dio.post(BackendRoutes.listaIgrejas, data: body,);

      //Parte de teste, por não ter ambiente
      final response = Response(
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
        data: returnListChurches,
      );

      if(response.statusCode == 200) {
        for (Map<String, dynamic> item in response.data!) {
          ChurchModel church = ChurchModel.fromJson(item);
          listChurches.add(church);
        }
      }

    } catch (e) {
      print(e);
      rethrow;
    }

    return listChurches;

  }

  @override
  void dispose() {}

}

const returnListChurches = [
  {
    "id": 1,
    "nome": "Serra Verde",
    "idArea": 1,
    "nomeArea": "Centro",
    "idRegiao": 1,
    "nomeRegiao": "Divinópolis",
    "endereco": {
      "id":1,
      "cep": "35502811",
      "logradouro": "RUA AMADEU SILVA",
      "numero": "280",
      "complemento": "DEPOSITO MATERIAL CONSTRUÇÃO SERRA VERDE",
      "bairro": "SERRA VERDE",
      "cidade": "DIVINOPOLIS",
      "codigoIBGE": "3122306",
      "estado": "MG",
      "latitude": -20.113638,
      "longitude": -44.9042497,
    }
  },
  {
    "id": 2,
    "nome": "Central",
    "idArea": 1,
    "nomeArea": "Centro",
    "idRegiao": 1,
    "nomeRegiao": "Divinópolis",
    "endereco": {
      "id":1,
      "cep": "35502811",
      "logradouro": "RUA AMADEU SILVA",
      "numero": "280",
      "complemento": "DEPOSITO MATERIAL CONSTRUÇÃO SERRA VERDE",
      "bairro": "SERRA VERDE",
      "cidade": "DIVINOPOLIS",
      "codigoIBGE": "3122306",
      "estado": "MG",
      "latitude": -20.113638,
      "longitude": -44.9042497,
    }
  },
  {
    "id": 3,
    "nome": "Bom Pastor",
    "idArea": 2,
    "nomeArea": "Bom Pastor",
    "idRegiao": 1,
    "nomeRegiao": "Divinópolis",
    "endereco": {
      "id":1,
      "cep": "35502811",
      "logradouro": "RUA AMADEU SILVA",
      "numero": "280",
      "complemento": "DEPOSITO MATERIAL CONSTRUÇÃO SERRA VERDE",
      "bairro": "SERRA VERDE",
      "cidade": "DIVINOPOLIS",
      "codigoIBGE": "3122306",
      "estado": "MG",
      "latitude": -20.113638,
      "longitude": -44.9042497,
    }
  },
  {
    "id": 4,
    "nome": "Alvorada",
    "idArea": 2,
    "nomeArea": "Bom Pastor",
    "idRegiao": 1,
    "nomeRegiao": "Divinópolis",
    "endereco": {
      "id":1,
      "cep": "35502811",
      "logradouro": "RUA AMADEU SILVA",
      "numero": "280",
      "complemento": "DEPOSITO MATERIAL CONSTRUÇÃO SERRA VERDE",
      "bairro": "SERRA VERDE",
      "cidade": "DIVINOPOLIS",
      "codigoIBGE": "3122306",
      "estado": "MG",
      "latitude": -20.113638,
      "longitude": -44.9042497,
    }
  },
  {
    "id": 5,
    "nome": "Esplanada",
    "idArea": 3,
    "nomeArea": "Esplanada",
    "idRegiao": 1,
    "nomeRegiao": "Divinópolis",
    "endereco": {
      "id":1,
      "cep": "35502811",
      "logradouro": "RUA AMADEU SILVA",
      "numero": "280",
      "complemento": "DEPOSITO MATERIAL CONSTRUÇÃO SERRA VERDE",
      "bairro": "SERRA VERDE",
      "cidade": "DIVINOPOLIS",
      "codigoIBGE": "3122306",
      "estado": "MG",
      "latitude": -20.113638,
      "longitude": -44.9042497,
    }
  },
  {
    "id": 6,
    "nome": "São Luiz",
    "idArea": 3,
    "nomeArea": "Esplanada",
    "idRegiao": 1,
    "nomeRegiao": "Divinópolis",
    "endereco": {
      "id":1,
      "cep": "35502811",
      "logradouro": "RUA AMADEU SILVA",
      "numero": "280",
      "complemento": "DEPOSITO MATERIAL CONSTRUÇÃO SERRA VERDE",
      "bairro": "SERRA VERDE",
      "cidade": "DIVINOPOLIS",
      "codigoIBGE": "3122306",
      "estado": "MG",
      "latitude": -20.113638,
      "longitude": -44.9042497,
    }
  },
  {
    "id": 7,
    "nome": "Pará de Minas",
    "idArea": 4,
    "nomeArea": "Pará de Minas",
    "idRegiao": 1,
    "nomeRegiao": "Divinópolis",
    "endereco": {
      "id":1,
      "cep": "35502811",
      "logradouro": "RUA AMADEU SILVA",
      "numero": "280",
      "complemento": "DEPOSITO MATERIAL CONSTRUÇÃO SERRA VERDE",
      "bairro": "SERRA VERDE",
      "cidade": "DIVINOPOLIS",
      "codigoIBGE": "3122306",
      "estado": "MG",
      "latitude": -20.113638,
      "longitude": -44.9042497,
    }
  },
  {
    "id": 8,
    "nome": "Pompéu",
    "idArea": 4,
    "nomeArea": "Pará de Minas",
    "idRegiao": 1,
    "nomeRegiao": "Divinópolis",
    "endereco": {
      "id":1,
      "cep": "35502811",
      "logradouro": "RUA AMADEU SILVA",
      "numero": "280",
      "complemento": "DEPOSITO MATERIAL CONSTRUÇÃO SERRA VERDE",
      "bairro": "SERRA VERDE",
      "cidade": "DIVINOPOLIS",
      "codigoIBGE": "3122306",
      "estado": "MG",
      "latitude": -20.113638,
      "longitude": -44.9042497,
    }
  },
];