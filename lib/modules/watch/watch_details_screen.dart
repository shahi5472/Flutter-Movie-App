import 'package:flutter/material.dart';
import 'package:flutter_movie_app/utils/k_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class WatchDetailsScreen extends StatefulWidget {
  const WatchDetailsScreen({Key? key}) : super(key: key);

  @override
  State<WatchDetailsScreen> createState() => _WatchDetailsScreenState();
}

class _WatchDetailsScreenState extends State<WatchDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: whiteColor,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            title: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios, color: whiteColor),
                ),
                Text(
                  'Watch',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: whiteColor,
                  ),
                ),
              ],
            ),
            expandedHeight: _size.height * 0.6,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/three.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          const Color(0xff000000).withOpacity(0.9),
                          const Color(0xff000000).withOpacity(0.0),
                        ],
                        stops: const [
                          0.0,
                          0.9,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 34,
                    left: 66,
                    right: 66,
                    child: Column(
                      children: [
                        Image.asset('assets/images/king_man_logo.png'),
                        const SizedBox(height: 6),
                        Text(
                          'In theaters december 22, 2021',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: whiteColor,
                          ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Get Tickets',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: whiteColor,
                            ),
                          ),
                        ),
                        const WatchTrailerButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 27),
                  Text(
                    'Genres',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: textColor,
                    ),
                  ),
                  Wrap(
                    spacing: 5,
                    children: [
                      _buildChip('Action', pasteColor),
                      _buildChip('Thriller', pinkDeepColor),
                      _buildChip('Science', blueVioletColor),
                      _buildChip('Fiction', darkYellowColor),
                    ],
                  ),
                  const SizedBox(height: 22),
                  const Divider(
                    thickness: 1,
                    color: Colors.black12,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Overview',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "As a collection of history's worst tyrants and criminal masterminds gather to plot a war to wipe out millions, one man must race against time to stop them. Discover the origins of the very first independent intelligence agency in The King's Man. The Comic Book “The Secret Service” by Mark Millar and Dave Gibbons.",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: captionTextColor,
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String text, Color color) {
    return Chip(
      label: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: whiteColor,
        ),
      ),
      backgroundColor: color,
    );
  }
}

class WatchTrailerButton extends StatelessWidget {
  const WatchTrailerButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: lightBlueColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 66,
      ),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.play_arrow,
            color: whiteColor,
          ),
          const SizedBox(width: 8),
          Text(
            'Watch Trailer',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
