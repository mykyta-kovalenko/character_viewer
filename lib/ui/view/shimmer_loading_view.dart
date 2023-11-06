import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../resources/app_strings.dart';
import 'placeholder_view.dart';

class ShimmerLoadingView extends StatelessWidget {
  const ShimmerLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
          child: Shimmer.fromColors(
            enabled: true,
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppStrings.theSimpsonsCharacters,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List<Widget>.generate(
                      10,
                      (_) => const PlaceholderView(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
