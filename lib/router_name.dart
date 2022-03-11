import 'package:flutter/material.dart';
import 'package:flutter_movie_app/modules/home/home_screen.dart';
import 'package:flutter_movie_app/modules/search/search_result_screen.dart';
import 'package:flutter_movie_app/modules/search/search_screen.dart';
import 'package:flutter_movie_app/modules/seat/seat_details_screen.dart';
import 'package:flutter_movie_app/modules/seat/seat_select_screen.dart';
import 'package:flutter_movie_app/modules/watch/watch_details_screen.dart';

class Routes {
  static const String home = '/';
  static const String search = '/search';
  static const String searchResult = '/search-result';
  static const String watchDetails = '/watch-details';
  static const String selectSeat = '/select-seat';
  static const String seatDetails = '/seat-details';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    search: (context) => const SearchScreen(),
    searchResult: (context) => const SearchResultScreen(),
    watchDetails: (context) => const WatchDetailsScreen(),
    selectSeat: (context) => const SeatSelectScreen(),
    seatDetails: (context) => const SeatDetailsScreen(),
  };
}
