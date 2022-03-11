import 'package:flutter/material.dart';
import 'package:flutter_movie_app/modules/home/components/watch_view_item.dart';
import 'package:flutter_movie_app/router_name.dart';
import 'package:flutter_movie_app/widgets/custom_search_field.dart';
import 'package:flutter_movie_app/widgets/shimmer_dashboard_loading.dart';

class WatchPage extends StatefulWidget {
  const WatchPage({Key? key}) : super(key: key);

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 20,
        title: const CustomSearchField(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? 4
                    : 2,
            mainAxisExtent: 100,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.watchDetails);
              },
              child: const WatchViewItem(),
            );
          },
        ),
      ),
    );
  }

  _loader() {
    return const ShimmerDashboardLoading(
      width: double.infinity,
      height: 100,
      crossAxisCount: 2,
      itemCount: 20,
    );
  }
}
