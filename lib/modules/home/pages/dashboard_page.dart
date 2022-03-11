import 'package:flutter/material.dart';
import 'package:flutter_movie_app/modules/home/components/watch_image_view_item.dart';
import 'package:flutter_movie_app/utils/k_strings.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset('assets/icons/search.svg'),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          WatchImageViewItem(
            onTap: () {},
            image: 'assets/images/one.png',
            text: 'Free Guy',
          ),
          WatchImageViewItem(
            onTap: () {},
            image: 'assets/images/two.png',
            text: "The King's Man",
          ),
          WatchImageViewItem(
            onTap: () {},
            image: 'assets/images/three.png',
            text: 'Jojo Rabbit',
          ),
          WatchImageViewItem(
            onTap: () {},
            image: 'assets/images/one.png',
            text: 'Free Guy',
          ),
          WatchImageViewItem(
            onTap: () {},
            image: 'assets/images/two.png',
            text: "The King's Man",
          ),
          WatchImageViewItem(
            onTap: () {},
            image: 'assets/images/three.png',
            text: 'Jojo Rabbit',
          ),
        ],
      ),
    );
  }
}
