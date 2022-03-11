import 'package:flutter/material.dart';
import 'package:flutter_movie_app/utils/k_colors.dart';
import 'package:flutter_movie_app/widgets/custom_image_view.dart';

class WatchImageViewItem extends StatelessWidget {
  const WatchImageViewItem({
    Key? key,
    required this.onTap,
    required this.image,
    required this.text,
  }) : super(key: key);

  final VoidCallback onTap;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 20,
          right: 20,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              CustomImageView(
                image: image,
                height: 180,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        const Color(0xff000000).withOpacity(1.0),
                        const Color(0xff000000).withOpacity(0.0),
                      ],
                      stops: const [
                        0.0,
                        0.9,
                      ],
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                    top: 27,
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
