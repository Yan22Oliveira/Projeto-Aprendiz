import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

import '../area.dart';
import '../../../../../shared/shared.dart';

class AreaRepository extends Disposable {

  final Dio dio;
  AreaRepository(this.dio);

  ///Pegar a lista das area
  Future<List<AreaModel>> getAreas() async {

    List<AreaModel> listaAreas = [];

    await Future.delayed(const Duration(seconds: 1));

    try {

      var body = json.encode({
        'token': GlobalInformation.token,
      });

      //final response = await dio.post(BackendRoutes.listaAreas, data: body,);

      //Parte de teste, por não ter ambiente
      final response = Response(
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
        data: returnAreas,
      );

      if(response.statusCode == 200) {
        for (Map<String, dynamic> item in response.data!) {
          AreaModel shepherd = AreaModel.fromJson(item);
          listaAreas.add(shepherd);
        }
      }

    } catch (e) {
      rethrow;
    }

    return listaAreas;

  }

  @override
  void dispose() {}

}

const returnAreas = [
  {
    "id": 1,
    "nome": "Centro",
    "idRegiao": 1,
    "nomeRegiao": "Divinópolis",
  },
  {
    "id": 2,
    "nome": "Bom Pastor",
    "idRegiao": 1,
    "nomeRegiao": "Divinópolis",
  },
  {
    "id": 3,
    "nome": "Esplanada",
    "idRegiao": 1,
    "nomeRegiao": "Divinópolis",
  },
  {
    "id": 4,
    "nome": "Pará de Minas",
    "idRegiao": 1,
    "nomeRegiao": "Divinópolis",
  },
];