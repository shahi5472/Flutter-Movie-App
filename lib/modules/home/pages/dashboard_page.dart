import 'package:flutter/material.dart';
import 'package:flutter_movie_app/modules/home/components/watch_image_view_item.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
}
