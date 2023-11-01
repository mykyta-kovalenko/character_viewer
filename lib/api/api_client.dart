import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'characters_response.dart';

class ApiClient {
  final Dio dio;

  ApiClient(this.dio);

  Future<CharactersResponse> getSimpsonsCharacters() async {
    final response = await dio.get(
      ApiConstants.baseUrl + ApiConstants.simpsonsQuery,
    );

    Map<String, dynamic> data = jsonDecode(response.data);

    log(CharactersResponse.fromJson(data).toString());

    return CharactersResponse.fromJson(data);
  }
}
