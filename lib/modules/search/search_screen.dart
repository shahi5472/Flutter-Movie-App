import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/controllers/search_controller.dart';
import 'package:flutter_movie_app/data/movie_db_response_model.dart';
import 'package:flutter_movie_app/modules/search/components/search_item_view.dart';
import 'package:flutter_movie_app/router_name.dart';
import 'package:flutter_movie_app/utils/k_colors.dart';
import 'package:flutter_movie_app/utils/rest_api.dart';
import 'package:flutter_movie_app/widgets/custom_search_field.dart';
import 'package:flutter_movie_app/widgets/error_view.dart';
import 'package:flutter_movie_app/widgets/loading.dart';
import 'package:flutter_movie_app/widgets/shimmer_dashboard_loading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchEditController = TextEditingController();

  ScrollController scrollController = ScrollController();

  late SearchController _controller;

  Timer? _dbouncer;

  void search() {
    if (searchEditController.text.isEmpty) return;
    _controller.searchingData(searchEditController.text);
  }

  @override
  void initState() {
    super.initState();
    _controller = Provider.of<SearchController>(context, listen: false);

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (searchEditController.text.isEmpty) return;
        if (_controller.currentPage <= _controller.totalAvailablePage) {
          _controller.currentPage += 1;
          _controller.searchingData(searchEditController.text);
        }
      }
    });
  }

  @override
  void dispose() {
    _dbouncer!.cancel();
    _controller.clearSearch();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchController>(
      builder: (context, data, child) {
        return Scaffold(
          appBar: _appBar(),
          body: _body(data),
        );
      },
    );
  }

  AppBar _appBar() {
    return AppBar(
      leadingWidth: 0.0,
      toolbarHeight: kToolbarHeight + 20,
      title: CustomSearchField(
        controller: searchEditController,
        onFieldSubmitted: (value) {
          _controller.clearSearch();
          Navigator.pushNamed(context, Routes.searchResult, arguments: {
            'query': value,
          });
        },
        onChanged: (String s) {
          if (_dbouncer?.isActive ?? false) _dbouncer?.cancel();
          _dbouncer = Timer(const Duration(seconds: 1), () {
            _controller.clearSearch();
            _controller.searching();
            search();
          });
        },
        onCloseTap: () {
          _controller.clearSearch();
          searchEditController.clear();
          _controller.clearSearch();
        },
      ),
    );
  }

  Padding _body(data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Text(
            'Top Results',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 1,
            color: Colors.black12,
          ),
          const SizedBox(height: 20),
          data.isLoading
              ? const Expanded(
                  child: ShimmerDashboardLoading(
                    width: double.infinity,
                    height: 180,
                  ),
                )
              : data.errorMessage != null
                  ? ErrorView(
                      message: data.errorMessage!, onPressed: () => search())
                  : data.searchMovieLists.isEmpty
                      ? const SizedBox()
                      : _view(data)
        ],
      ),
    );
  }

  Expanded _view(data) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        controller: scrollController,
        itemCount: data.searchMovieLists.length + 1,
        itemBuilder: (context, index) {
          if (index == data.searchMovieLists.length) {
            return const Loading();
          }
          Result _result = data.searchMovieLists[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.watchDetails,
                  arguments: {'id': _result.id, 'data': _result.toJson()});
            },
            child: SearchItemView(
              image: RestApi.getImage(_result.posterPath!),
              title: _result.title!,
              caption: _result.releaseDate,
            ),
          );
        },
      ),
    );
  }
}
