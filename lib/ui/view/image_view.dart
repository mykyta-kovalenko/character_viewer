import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../resources/app_strings.dart';

class ImageView extends StatelessWidget {
  final String url;
  final double width;
  final double height;

  const ImageView({
    super.key,
    required this.url,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return _buildImage(AppStrings.imagePlaceholder);
    }
    return _buildImage('https://duckduckgo.com$url');
  }

  Widget _buildImage(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return SizedBox(
          width: width,
          height: height,
          child: Image(
            image: imageProvider,
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
}
