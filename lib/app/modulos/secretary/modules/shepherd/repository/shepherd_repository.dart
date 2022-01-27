import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

import '../../../../../shared/shared.dart';
import '../shepherd.dart';

class ShepherdRepository extends Disposable {

  final Dio dio;
  ShepherdRepository(this.dio);

  ///Pegar a lista dos pastores
  Future<List<ShepherdModel>> getShepherds() async {

    List<ShepherdModel> listaShepherdModel = [];

    await Future.delayed(const Duration(seconds: 3));

    try {

      var body = json.encode({
        'token': GlobalInformation.token,
      });

      //final response = await dio.post(BackendRoutes.listaPastores, data: body,);

      //Parte de teste, por não ter ambiente
      final response = Response(
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
        data: returnShepherds,
      );


      if(response.statusCode == 200) {
        for (Map<String, dynamic> item in response.data!) {
          ShepherdModel shepherd = ShepherdModel.fromJson(item);
          listaShepherdModel.add(shepherd);
        }
      }

    } catch (e) {
      return listaShepherdModel;
    }

    return listaShepherdModel;

  }

  @override
  void dispose() {}

}

const returnShepherds = [
  {
    "id": 1,
    "name": "Fulano Gomes",
    "email": "fulano@gmail.com",
    "telefone": "37988776655"
  },
  {
    "id": 1,
    "name": "Murilo Brito",
    "email": "fulano@gmail.com",
    "telefone": "37988776655"
  },
  {
    "id": 1,
    "name": "Ciclano da Silva",
    "email": "fulano@gmail.com",
    "telefone": "37988776655"
  },
  {
    "id": 1,
    "name": "Pedro Faria",
    "email": "fulano@gmail.com",
    "telefone": "37988776655"
  },
];