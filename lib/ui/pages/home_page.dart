import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/core/home_page/home_page_cubit.dart';
import '../../config/locator.dart';

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
          return ListView.builder(
            itemCount: state.characters.length,
            itemBuilder: (_, index) => Text(state.characters[index].firstUrl),
          );
        },
      ),
    );
  }
}
