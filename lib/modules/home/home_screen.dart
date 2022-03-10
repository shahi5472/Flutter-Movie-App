import 'package:flutter/material.dart';
import 'package:flutter_movie_app/modules/home/pages/dashboard_page.dart';
import 'package:flutter_movie_app/modules/home/pages/watch_page.dart';
import 'package:flutter_movie_app/utils/k_strings.dart';
import 'package:flutter_movie_app/widgets/custom_bottom_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<Widget> bodyWidgets =const [
    DashboardPage(),
    WatchPage(),
    DashboardPage(),
    WatchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          KString.watch,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset('assets/icons/search.svg'),
            ),
          ),
        ],
      ),
      body: bodyWidgets[_currentIndex],
      bottomNavigationBar: CustomBottomBar(
        height: 72,
        currentIndex: _currentIndex,
        onItemSelected: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
