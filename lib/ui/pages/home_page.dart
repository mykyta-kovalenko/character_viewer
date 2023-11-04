import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/core/home_page/home_page_cubit.dart';
import '../../config/locator.dart';
import '../../resources/app_strings.dart';
import '../view/character_tile.dart';

class HomePage extends StatelessWidget {
  static Widget create() {
    return BlocProvider(
      create: (context) =>
          locator.get<HomePageCubit>()..getSimpsonsCharacters(),
      child: const HomePage._(),
    );
  }

  const HomePage._();

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
        fontSize: 24,
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
