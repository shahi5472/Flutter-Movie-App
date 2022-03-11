import 'package:flutter/material.dart';
import 'package:flutter_movie_app/controllers/bottom_nav_controller.dart';
import 'package:flutter_movie_app/widgets/custom_bottom_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<BottomNavController>().getBody(),
      bottomNavigationBar: CustomBottomBar(
        height: 72,
        currentIndex: context.watch<BottomNavController>().currentIndex,
        onItemSelected: context.read<BottomNavController>().onItemSelected,
      ),
    );
  }
}
