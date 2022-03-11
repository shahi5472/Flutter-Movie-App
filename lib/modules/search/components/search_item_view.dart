import 'package:flutter/material.dart';
import 'package:flutter_movie_app/utils/k_colors.dart';
import 'package:flutter_movie_app/utils/k_images.dart';
import 'package:flutter_movie_app/widgets/custom_image_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchItemView extends StatelessWidget {
  const SearchItemView({
    Key? key,
    required this.image,
    required this.title,
    this.caption,
  }) : super(key: key);

  final String image;
  final String title;
  final String? caption;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CustomImageView(
              height: 100,
              width: 130,
              image: image,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                const SizedBox(width: 20),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      caption ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: sliverColor,
                      ),
                    ),
                  ],
                ),),
                SvgPicture.asset(Kimage.horizontalDotIcon),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
