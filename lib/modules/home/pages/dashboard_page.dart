import 'package:flutter/material.dart';
import 'package:flutter_movie_app/controllers/dashboard_controller.dart';
import 'package:flutter_movie_app/data/upcoming/upcoming_response_model.dart';
import 'package:flutter_movie_app/modules/home/components/watch_image_view_item.dart';
import 'package:flutter_movie_app/router_name.dart';
import 'package:flutter_movie_app/utils/k_images.dart';
import 'package:flutter_movie_app/utils/k_strings.dart';
import 'package:flutter_movie_app/utils/rest_api.dart';
import 'package:flutter_movie_app/widgets/error_view.dart';
import 'package:flutter_movie_app/widgets/loading.dart';
import 'package:flutter_movie_app/widgets/shimmer_dashboard_loading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  ScrollController scrollController = ScrollController();

  late DashboardController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Provider.of<DashboardController>(context, listen: false);

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (_controller.currentPage <= _controller.totalAvailablePage) {
          _controller.currentPage += 1;
          _controller.loadingData();
        }
      }
    });

    if (_controller.currentPage == 1) {
      _controller.loadingData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
      builder: (context, data, child) {
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
          body: data.isLoading
              ? const ShimmerDashboardLoading(
                  width: double.infinity,
                  height: 180,
                )
              : data.errorMessage != null
                  ? ErrorView(
                      message: data.errorMessage!,
                      onPressed: () => data.loadingData())
                  : ListView.builder(
                      shrinkWrap: true,
                      controller: scrollController,
                      itemCount: data.upcomingMovieLists.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == data.upcomingMovieLists.length) {
                          return const Loading();
                        }
                        Result _result = data.upcomingMovieLists[index];
                        return WatchImageViewItem(
                          onTap: () => _onTap(context),
                          image: RestApi.getImage(_result.posterPath!),
                          text: _result.title!,
                        );
                      },
                    ),
        );
      },
    );
  }

  void _onTap(context) {
    Navigator.pushNamed(context, Routes.watchDetails);
  }
}
