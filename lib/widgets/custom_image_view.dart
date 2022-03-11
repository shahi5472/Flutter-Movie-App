import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomImageView extends StatelessWidget {
  const CustomImageView({
    Key? key,
    required this.image,
    required this.height,
    this.width = double.infinity,
  }) : super(key: key);

  final String image;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      width: width,
      height: height,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, _, error) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[500]!,
          highlightColor: Colors.grey[300]!,
          period: const Duration(seconds: 1),
          child: Container(color: Colors.white),
        );
      },
      errorWidget: (context, _, error) {
        return Image.asset(
          'assets/images/one.png',
          width: width,
          height: height,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
