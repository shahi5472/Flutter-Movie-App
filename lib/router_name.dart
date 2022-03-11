import 'package:flutter/material.dart';
import 'package:flutter_movie_app/modules/seat/seat_details_screen.dart';
import 'package:flutter_movie_app/modules/watch/watch_details_screen.dart';

class Routes {
  static const String home = '/';
  static const String watchDetails = '/watch-details';

  static final Map<String, WidgetBuilder> routes = {
    // home: (context) => const HomeScreen(),
    // home: (context) => const SeatSelectScreen(),
    home: (context) => const SeatDetailsScreen(),
    watchDetails: (context) => const WatchDetailsScreen(),
  };
}
