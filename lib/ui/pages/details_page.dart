import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../models/character.dart';
import '../../utils/string_ext.dart';
import '../view/image_view.dart';

@RoutePage()
class DetailsPage extends StatelessWidget {
  final Character character;

  const DetailsPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: context.router.pop,
                  child: const Icon(Icons.arrow_back_ios, size: 36),
                ),
                const SizedBox(height: 24),
                ImageView(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3,
                  url: character.icon.url,
                ),
                const SizedBox(height: 24),
                Text(
                  character.firstUrl.extractNameFromUrl(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  character.text,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
