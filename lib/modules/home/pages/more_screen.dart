import 'package:flutter/material.dart';
import 'package:flutter_movie_app/utils/k_colors.dart';
import 'package:flutter_movie_app/utils/k_images.dart';
import 'package:flutter_movie_app/utils/k_strings.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0.0,
        title: const Text(
          KString.watch,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
      body: Center(
        child: SvgPicture.asset(
          Kimage.moreIcon,
          color: primaryColor,
        ),
      ),
    );
  }
}
