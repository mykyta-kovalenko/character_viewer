import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../models/character.dart';
import '../../ui/pages/details_page.dart';
import '../../ui/pages/home_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: DetailsRoute.page),
      ];
}
