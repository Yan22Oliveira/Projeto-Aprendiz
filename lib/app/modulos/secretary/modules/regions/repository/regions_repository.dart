import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

import '../../../../../shared/shared.dart';
import '../regions.dart';

class RegionsRepository extends Disposable {

  final Dio dio;
  RegionsRepository(this.dio);

  ///Pegar a lista das regions
  Future<List<RegionsModel>> getRegions() async {

    List<RegionsModel> listaRegions = [];

    await Future.delayed(const Duration(seconds: 1));

    try {

      var body = json.encode({
        'token': GlobalInformation.token,
      });

      //final response = await dio.post(BackendRoutes.listaRegioes, data: body,);

      //Parte de teste, por não ter ambiente
      final response = Response(
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
        data: returnRegions,
      );


      if(response.statusCode == 200) {
        for (Map<String, dynamic> item in response.data!) {
          RegionsModel shepherd = RegionsModel.fromJson(item);
          listaRegions.add(shepherd);
        }
      }

    } catch (e) {
      rethrow;
    }

    return listaRegions;

  }

  @override
  void dispose() {}

}

const returnRegions = [
  {
    "id": 1,
    "nome": "Divinópolis",
  },
  {
    "id": 2,
    "nome": "Test Name",
  }
];