import 'package:flutter/material.dart';
import 'package:flutter_movie_app/controllers/search_controller.dart';
import 'package:flutter_movie_app/data/movie_db_response_model.dart';
import 'package:flutter_movie_app/modules/search/components/search_item_view.dart';
import 'package:flutter_movie_app/router_name.dart';
import 'package:flutter_movie_app/utils/k_colors.dart';
import 'package:flutter_movie_app/utils/rest_api.dart';
import 'package:flutter_movie_app/widgets/error_view.dart';
import 'package:flutter_movie_app/widgets/loading.dart';
import 'package:flutter_movie_app/widgets/shimmer_dashboard_loading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  late dynamic arguments = ModalRoute.of(context)!.settings.arguments;

  ScrollController scrollController = ScrollController();

  late SearchController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Provider.of<SearchController>(context, listen: false);

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (_controller.currentPage <= _controller.totalAvailablePage) {
          _controller.currentPage += 1;
          _controller.searchingData(arguments['query']);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _controller.searchingData(arguments['query']);
    return Consumer<SearchController>(
      builder: (context, data, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leadingWidth: 0.0,
            title: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios, color: textColor),
                ),
                Text(
                  '${data.searchMovieLists.length} Results Found',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                            message: data.errorMessage!,
                            onPressed: () =>
                                _controller.searchingData(arguments['query']))
                        : data.searchMovieLists.isEmpty
                            ? const SizedBox()
                            : Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  controller: scrollController,
                                  itemCount: data.searchMovieLists.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index == data.searchMovieLists.length) {
                                      return const Loading();
                                    }
                                    Result _result =
                                        data.searchMovieLists[index];
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, Routes.watchDetails);
                                      },
                                      child: SearchItemView(
                                        image: RestApi.getImage(
                                            _result.posterPath!),
                                        title: _result.title!,
                                        caption: _result.releaseDate,
                                      ),
                                    );
                                  },
                                ),
                              )
              ],
            ),
          ),
        );
      },
    );
  }
}
