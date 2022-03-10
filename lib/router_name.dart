import 'package:flutter/material.dart';
import 'package:flutter_movie_app/modules/home/home_screen.dart';

class Routes {
  static const String home = '/';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
  };
}
