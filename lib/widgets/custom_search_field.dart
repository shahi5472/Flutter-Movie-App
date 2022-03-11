import 'package:flutter/material.dart';
import 'package:flutter_movie_app/utils/k_colors.dart';
import 'package:flutter_movie_app/utils/k_images.dart';
import 'package:flutter_movie_app/utils/k_strings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      style: GoogleFonts.poppins(
        color: textColor,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              Kimage.closeIcon2,
              color: textColor,
              height: 15,
              width: 15,
            ),
          ),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(16),
          child: SvgPicture.asset(
            Kimage.searchIcon,
            color: textColor,
            height: 15,
            width: 15,
          ),
        ),
        hintText: KString.searchHint,
      ),
    );
  }
}
