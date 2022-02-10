import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

import '../../../../../shared/shared.dart';
import '../pastor.dart';

class PastorRepository extends Disposable {

  final Dio dio;
  PastorRepository(this.dio);

  ///Pegar a lista dos pastores
  Future<List<PastorModel>> getPastors() async {

    List<PastorModel> listaPastorModel = [];

    await Future.delayed(const Duration(seconds: 1));

    try {

      var body = json.encode({
        'token': GlobalInformation.token,
      });

      //final response = await dio.post(BackendRoutes.listaPastores, data: body,);

      //Parte de teste, por não ter ambiente
      final response = Response(
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
        data: returnPastors,
      );

      if(response.statusCode == 200) {
        for (Map<String, dynamic> item in response.data!) {
          PastorModel shepherd = PastorModel.fromJson(item);
          listaPastorModel.add(shepherd);
        }
      }

    } catch (e) {
      rethrow;
    }

    return listaPastorModel;

  }

  @override
  void dispose() {}

}

const returnPastors = [
  {
    "id": 1,
    "name": "Fulano Gomes",
    "email": "fulano@gmail.com",
    "telefone": "37988776655",
  },
  {
    "id": 2,
    "name": "Murilo Brito",
    "email": "fulano@gmail.com",
    "telefone": "37988776655"
  },
  {
    "id": 3,
    "name": "Ciclano da Silva",
    "email": "fulano@gmail.com",
    "telefone": "37988776655"
  },
  {
    "id": 4,
    "name": "Pedro Faria",
    "email": "fulano@gmail.com",
    "telefone": "37988776655"
  },
];