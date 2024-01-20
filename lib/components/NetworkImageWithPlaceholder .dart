import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NetworkImageWithSkeleton extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;

  const NetworkImageWithSkeleton({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.fill,
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        color: Colors.grey[300],
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        color: Colors.grey[300],
      ),
    );
  }
}
