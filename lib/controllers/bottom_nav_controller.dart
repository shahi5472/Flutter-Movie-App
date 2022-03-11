import 'package:flutter/material.dart';
import 'package:flutter_movie_app/modules/home/pages/dashboard_page.dart';
import 'package:flutter_movie_app/modules/home/pages/media_library_screen.dart';
import 'package:flutter_movie_app/modules/home/pages/more_screen.dart';
import 'package:flutter_movie_app/modules/home/pages/watch_page.dart';

class BottomNavController extends ChangeNotifier {
  int currentIndex = 0;

  List<Widget> bodyWidgets = const [
    DashboardPage(),
    WatchPage(),
    MediaLibraryScreen(),
    MoreScreen(),
  ];

  Widget getBody() => bodyWidgets[currentIndex];

  void onItemSelected(value) {
    currentIndex = value;
    notifyListeners();
  }
}
