import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'characters_response.dart';

class ApiClient {
  final Dio dio;

  ApiClient(this.dio);

  Future<CharactersResponse> getSimpsonsCharacters() async {
    final response = await dio
        .get('http://api.duckduckgo.com/?q=simpsons+characters&format=json');

    Map<String, dynamic> data = jsonDecode(response.data);

    // Access specific data in the response
    // final List<dynamic> abstract = data['RelatedTopics'];

    log(CharactersResponse.fromJson(data).toString());

    // log('RelatedTopics: $abstract');
    //Change
    return CharactersResponse.fromJson(data);
  }
}
