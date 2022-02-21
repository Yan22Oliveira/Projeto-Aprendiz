import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

import '../../../../../shared/shared.dart';
import '../course.dart';

class CourseRepository extends Disposable {

  final Dio dio;
  CourseRepository(this.dio);

  ///Pegar a lista dos courses
  Future<List<CourseModel>> getCourses() async {

    List<CourseModel> listaCourses = [];

    await Future.delayed(const Duration(seconds: 1));

    try {

      var body = json.encode({
        'token': GlobalInformation.token,
      });

      //final response = await dio.post(BackendRoutes.listaCursos, data: body,);

      //Parte de teste, por não ter ambiente
      final response = Response(
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
        data: returnCourses,
      );

      if(response.statusCode == 200) {
        for (Map<String, dynamic> item in response.data!) {
          CourseModel shepherd = CourseModel.fromJson(item);
          listaCourses.add(shepherd);
        }
      }

    } catch (e) {
      rethrow;
    }

    return listaCourses;

  }

  @override
  void dispose() {}

}

const returnCourses = [
  {
    "id": 9,
    "nome": "Acordeon"
  },
  {
    "id": 8,
    "nome": "Baixo"
  },
  {
    "id": 10,
    "nome": "Bateria"
  },
  {
    "id": 11,
    "nome": "Cajon"
  },
  {
    "id": 12,
    "nome": "Clarinete"
  },
  {
    "id": 6,
    "nome": "Contralto"
  },
  {
    "id": 13,
    "nome": "Educação Musical"
  },
  {
    "id": 14,
    "nome": "Escaleta"
  },
  {
    "id": 15,
    "nome": "Fagote"
  },
  {
    "id": 3,
    "nome": "Piano"
  },
  {
    "id": 16,
    "nome": "Flauta Doce"
  },
  {
    "id": 17,
    "nome": "Flauta Transversal"
  },
  {
    "id": 18,
    "nome": "Gaita"
  },
  {
    "id": 19,
    "nome": "Harpa"
  },
  {
    "id": 20,
    "nome": "Oboé"
  },
  {
    "id": 21,
    "nome": "Percussão"
  },
  {
    "id": 22,
    "nome": "Saxofone Alto"
  },
  {
    "id": 23,
    "nome": "Saxofone Soprano"
  },
  {
    "id": 24,
    "nome": "Saxofone Tenor"
  },
  {
    "id": 25,
    "nome": "Sonorização"
  },
  {
    "id": 5,
    "nome": "Soprano"
  },
  {
    "id": 27,
    "nome": "Teclado"
  },
  {
    "id": 28,
    "nome": "Técnica Vocal"
  },
  {
    "id": 7,
    "nome": "Tenor"
  },
  {
    "id": 29,
    "nome": "Teoria Musical"
  },
  {
    "id": 30,
    "nome": "Trombone"
  },
  {
    "id": 31,
    "nome": "Trompa"
  },
  {
    "id": 32,
    "nome": "Ukulelê"
  },
  {
    "id": 33,
    "nome": "Viola Caipira"
  },
  {
    "id": 34,
    "nome": "Viola Clássica"
  },
  {
    "id": 35,
    "nome": "Violão"
  },
  {
    "id": 1,
    "nome": "Violino I"
  },
  {
    "id": 2,
    "nome": "Violino II"
  },
  {
    "id": 36,
    "nome": "Violoncelo"
  },
];