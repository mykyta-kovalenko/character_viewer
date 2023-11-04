import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'config/locator.dart';
import 'config/router/app_observer.dart';
import 'config/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = locator<AppRouter>();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: appRouter.defaultRouteParser(),
      routeInformationProvider: appRouter.routeInfoProvider(),
      routerDelegate: appRouter.delegate(
        navigatorObservers: () => [
          AppObserver(),
          AutoRouteObserver(),
        ],
      ),
    );
  }
}
