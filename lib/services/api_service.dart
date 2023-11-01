import 'package:injectable/injectable.dart';

import '../api/api_client.dart';
import '../models/character.dart';
import 'core/base_service.dart';

@injectable
class ApiService extends BaseService {
  final ApiClient apiClient;

  ApiService(this.apiClient);

  Future<List<Character>> getSimpsonsCharacters() {
    return makeErrorParsedCall(() async {
      final response = await apiClient.getSimpsonsCharacters();

      return response.relatedTopics;
    });
  }
}
