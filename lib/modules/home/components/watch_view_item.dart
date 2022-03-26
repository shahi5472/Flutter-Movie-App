import 'package:flutter/material.dart';
import 'package:flutter_movie_app/utils/k_colors.dart';
import 'package:flutter_movie_app/widgets/custom_image_view.dart';
import 'package:google_fonts/google_fonts.dart';

class WatchViewItem extends StatelessWidget {
  const WatchViewItem({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Stack(
        children: [
          Hero(
            tag: text,
            child: CustomImageView(image: image, height: 100),
          ),
          Container(color: Colors.black12.withOpacity(0.3)),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Text(
              text,
              maxLines: 1,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
