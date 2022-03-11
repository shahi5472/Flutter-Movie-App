import 'package:flutter/material.dart';
import 'package:flutter_movie_app/utils/k_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class WatchViewItem extends StatelessWidget {
  const WatchViewItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/one.png',
            height: 100,
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black12.withOpacity(0.3)),
          Positioned(
            bottom: 20,
            left: 10,
            child: Text(
              'Comedies',
              textAlign: TextAlign.start,
              maxLines: 1,
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
