import 'package:flutter/material.dart';
import 'package:flutter_movie_app/utils/k_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSeatAppBar extends StatelessWidget {
  const CustomSeatAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_back_ios,
          color: textColor,
        ),
      ),
      toolbarHeight: 80,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'The King’s Man',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'In theaters december 22, 2021',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: lightBlueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
