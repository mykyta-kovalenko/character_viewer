import 'package:flutter/material.dart';

import '../../config/router/cv_app_router.dart';
import '../../models/character.dart';
import '../../utils/string_ext.dart';
import 'image_view.dart';

class CharacterTile extends StatelessWidget {
  final Character character;

  const CharacterTile({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () => router.pushDetailsPage(character),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 8,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              _buildImage(),
              const SizedBox(width: 8),
              _buildCharacterName(),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Colors.grey.shade500,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ImageView(
      width: 36,
      height: 36,
      url: character.icon.url,
    );
  }

  Widget _buildCharacterName() {
    return Text(
      character.firstUrl.extractNameFromUrl(),
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
