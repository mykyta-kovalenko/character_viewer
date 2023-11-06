import 'package:injectable/injectable.dart';

import '../../models/character.dart';
import '../locator.dart';
import 'app_router.dart';
import 'base_router.dart';

CvAppRouter get router => locator<CvAppRouter>();

@singleton
class CvAppRouter extends BaseRouter {
  CvAppRouter(AppRouter router) : super(router);

  Future<void> pushDetailsPage(Character character) async {
    await push(DetailsRoute(character: character));
  }
}
