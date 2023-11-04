import 'dart:convert';

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

    return CharactersResponse.fromJson(data);
  }
}
