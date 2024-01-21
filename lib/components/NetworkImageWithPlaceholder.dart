import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NetworkImageWithSkeleton extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;

  const NetworkImageWithSkeleton({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageProvider = CachedNetworkImageProvider(imageUrl);

    return Image(
      image: imageProvider,
      width: width,
      height: height,
      fit: BoxFit.fill,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        } else {
          return Container(
            width: width,
            height: height,
            color: Colors.grey[300],
            child: child,
          );
        }
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Container(
            width: width,
            height: height,
            color: Colors.grey[300],
          );
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          color: Colors.grey[300],
        );
      },
    );
  }
}
