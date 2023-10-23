import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../api/api_client.dart';
import '../../api/api_constants.dart';

@module
abstract class ApiModule {
  @lazySingleton
  Dio dio() {
    return Dio()
      ..options.sendTimeout = const Duration(milliseconds: 10000)
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      );
  }

  @lazySingleton
  ApiClient factClient(Dio dio) => ApiClient(
        dio,
        baseUrl: ApiConstants.baseUrl,
      );
}
