import 'package:flutter/material.dart';
import 'package:flutter_movie_app/modules/seat/components/custom_seat_appbar.dart';
import 'package:flutter_movie_app/router_name.dart';
import 'package:flutter_movie_app/utils/k_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SeatSelectScreen extends StatefulWidget {
  const SeatSelectScreen({Key? key}) : super(key: key);

  @override
  State<SeatSelectScreen> createState() => _SeatSelectScreenState();
}

class _SeatSelectScreenState extends State<SeatSelectScreen> {
  int _selectedIndex = 0;
  int _seatSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  const CustomSeatAppBar(),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 94),
                          Text(
                            'Date',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: textColor,
                            ),
                          ),
                          const SizedBox(height: 14),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                10,
                                (index) => FittedBox(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selectedIndex = index;
                                      });
                                    },
                                    child: DateViewItem(
                                      text: '${5 + index} Mar',
                                      isSelected: _selectedIndex == index,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                5,
                                (index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      _seatSelectedIndex = index;
                                    });
                                  },
                                  child: SeatViewItem(
                                    isSelected: _seatSelectedIndex == index,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 26, left: 26, right: 26),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.seatDetails);
                },
                child: Text(
                  'Select Seats',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeatViewItem extends StatelessWidget {
  const SeatViewItem({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '12:30 ',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: textColor,
                  ),
                ),
                TextSpan(
                  text: ' Cinetech + hall 1',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: captionTextColor,
                  ),
                ),
              ],
            ),
          ),
          FittedBox(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color:
                      isSelected ? lightBlueColor : textColor.withOpacity(0.1),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 52,
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/seat_view.png',
                ),
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'From ',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: captionTextColor,
                  ),
                ),
                TextSpan(
                  text: ' 50\$',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: textColor,
                  ),
                ),
                TextSpan(
                  text: ' or ',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: captionTextColor,
                  ),
                ),
                TextSpan(
                  text: ' 2500 bonus',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DateViewItem extends StatelessWidget {
  const DateViewItem({
    Key? key,
    required this.isSelected,
    required this.text,
  }) : super(key: key);

  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 7,
        bottom: 7,
        right: 7,
      ),
      decoration: BoxDecoration(
        color: isSelected ? lightBlueColor : sliverColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: lightBlueColor.withOpacity(0.2),
                  blurRadius: 21,
                ),
              ]
            : null,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: isSelected ? whiteColor : textColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
