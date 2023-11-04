import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppObserver extends AutoRouteObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    log('New route pushed: ${route.settings.name} from ${previousRoute?.settings.name ?? ''}');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    log('Route poped: ${route.settings.name} to ${previousRoute?.settings.name ?? ''}');
    super.didPop(route, previousRoute);
  }
}
