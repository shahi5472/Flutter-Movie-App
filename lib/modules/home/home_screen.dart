import 'package:flutter/material.dart';
import 'package:flutter_movie_app/modules/home/pages/dashboard_page.dart';
import 'package:flutter_movie_app/modules/home/pages/watch_page.dart';
import 'package:flutter_movie_app/modules/search/search_screen.dart';
import 'package:flutter_movie_app/widgets/custom_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<Widget> bodyWidgets = const [
    SearchScreen(),
    DashboardPage(),
    DashboardPage(),
    WatchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
