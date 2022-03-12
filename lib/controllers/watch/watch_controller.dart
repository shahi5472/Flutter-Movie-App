import 'package:flutter/material.dart';
import 'package:flutter_movie_app/apiz/api_service.dart';
import 'package:flutter_movie_app/data/api_response_model.dart';
import 'package:flutter_movie_app/data/movie_db_response_model.dart';
import 'package:flutter_movie_app/utils/k_strings.dart';
import 'package:flutter_movie_app/utils/rest_api.dart';

class WatchController extends ChangeNotifier {
  int currentPage = 1;
  int totalAvailablePage = 1;
  bool isLoading = true;
  String? errorMessage;

  List<Result> topRatedMovieLists = [];

  Future<void> loadingData() async {
    ApiResponseModel result = await ApiService.instance.getMovie(
        RestApi.topRatedMovie(currentPage),
        cacheKey: KString.topRatedMovie);

    if (result.error) {
      errorMessage = result.message;
    }

    if (!result.error && result.message == null) {
      MovieDBResponseModel _model = result.list;
      totalAvailablePage = _model.totalPages!;
      if (_model.results != null) {
        topRatedMovieLists.addAll(_model.results!);
      }
    }

    isLoading = false;
    notifyListeners();
  }
}
