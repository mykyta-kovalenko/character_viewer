import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/core/home_page/home_page_cubit.dart';
import '../../config/router/app_observer.dart';
import '../../config/router/cv_app_router.dart';
import '../../resources/app_strings.dart';
import '../../utils/bloc_auto_route_mixin.dart';
import '../view/character_tile.dart';

@RoutePage()
class HomePage extends StatefulWidget with BlocAutoRouteMixin<HomePageCubit> {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutoRouteAwareStateMixin {
  AppObserver? _observer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _observer = router.getObserver<AppObserver>(context);
    if (_observer != null) {
      _observer?.subscribe(this, context.routeData);
    }
  }

  @override
  void dispose() {
    _observer?.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 24),
                  Expanded(child: _buildBody(state)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return const Text(
      AppStrings.theSimpsonsCharacters,
      style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildBody(HomePageState state) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: state.characters.length,
      itemBuilder: (_, index) => CharacterTile(
        character: state.characters[index],
      ),
    );
  }
}
