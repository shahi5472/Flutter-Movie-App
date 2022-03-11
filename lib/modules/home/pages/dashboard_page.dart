import 'package:flutter/material.dart';
import 'package:flutter_movie_app/modules/home/components/watch_image_view_item.dart';
import 'package:flutter_movie_app/router_name.dart';
import 'package:flutter_movie_app/utils/k_images.dart';
import 'package:flutter_movie_app/utils/k_strings.dart';
import 'package:flutter_movie_app/widgets/shimmer_dashboard_loading.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10)).then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

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
              onTap: () {
                Navigator.pushNamed(context, Routes.search);
              },
              child: SvgPicture.asset(Kimage.searchIcon),
            ),
          ),
        ],
      ),
      body: isLoading
          ? const ShimmerDashboardLoading(
              width: double.infinity,
              height: 180,
            )
          : ListView(
              children: [
                WatchImageViewItem(
                  onTap: () => _onTap(context),
                  image: 'assets/images/one.png',
                  text: 'Free Guy',
                ),
                WatchImageViewItem(
                  onTap: () => _onTap(context),
                  image: 'assets/images/two.png',
                  text: "The King's Man",
                ),
                WatchImageViewItem(
                  onTap: () => _onTap(context),
                  image: 'assets/images/three.png',
                  text: 'Jojo Rabbit',
                ),
                WatchImageViewItem(
                  onTap: () => _onTap(context),
                  image: 'assets/images/one.png',
                  text: 'Free Guy',
                ),
                WatchImageViewItem(
                  onTap: () => _onTap(context),
                  image: 'assets/images/two.png',
                  text: "The King's Man",
                ),
                WatchImageViewItem(
                  onTap: () => _onTap(context),
                  image: 'assets/images/three.png',
                  text: 'Jojo Rabbit',
                ),
              ],
            ),
    );
  }

  void _onTap(context) {
    Navigator.pushNamed(context, Routes.watchDetails);
  }
}
