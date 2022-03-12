import 'package:flutter/material.dart';
import 'package:flutter_movie_app/controllers/watch/watch_controller.dart';
import 'package:flutter_movie_app/data/movie_db_response_model.dart';
import 'package:flutter_movie_app/modules/home/components/watch_view_item.dart';
import 'package:flutter_movie_app/router_name.dart';
import 'package:flutter_movie_app/utils/rest_api.dart';
import 'package:flutter_movie_app/widgets/custom_search_field.dart';
import 'package:flutter_movie_app/widgets/error_view.dart';
import 'package:flutter_movie_app/widgets/loading.dart';
import 'package:flutter_movie_app/widgets/shimmer_dashboard_loading.dart';
import 'package:provider/provider.dart';

class WatchPage extends StatefulWidget {
  const WatchPage({Key? key}) : super(key: key);

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  ScrollController scrollController = ScrollController();

  late WatchController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Provider.of<WatchController>(context, listen: false);

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
    return Consumer<WatchController>(
      builder: (context, data, child) {
        return Scaffold(
          appBar: _appBar(),
          body: data.isLoading
              ? const ShimmerDashboardLoading(
                  width: double.infinity,
                  height: 100,
                  crossAxisCount: 2,
                  itemCount: 20,
                )
              : data.errorMessage != null
                  ? ErrorView(
                      message: data.errorMessage!,
                      onPressed: () => data.loadingData())
                  : _view(data),
        );
      },
    );
  }

  _appBar() {
    return AppBar(
      leadingWidth: 0.0,
      toolbarHeight: kToolbarHeight + 20,
      title: const CustomSearchField(),
    );
  }

  _view(data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        controller: scrollController,
        itemCount: data.topRatedMovieLists.length + 1,
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
          if (index == data.topRatedMovieLists.length) {
            return const Loading();
          }
          Result _result = data.topRatedMovieLists[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.watchDetails,
                  arguments: {'id': _result.id, 'data': _result.toJson()});
            },
            child: WatchViewItem(
              image: RestApi.getImage(_result.posterPath!),
              text: _result.title!,
            ),
          );
        },
      ),
    );
  }
}
