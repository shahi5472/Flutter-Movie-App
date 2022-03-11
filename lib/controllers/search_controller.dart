import 'package:flutter/material.dart';
import 'package:flutter_movie_app/apiz/api_service.dart';
import 'package:flutter_movie_app/data/api_response_model.dart';
import 'package:flutter_movie_app/data/movie_db_response_model.dart';
import 'package:flutter_movie_app/utils/rest_api.dart';

class SearchController extends ChangeNotifier {
  int currentPage = 1;
  int totalAvailablePage = 1;
  bool isLoading = false;
  String? errorMessage;

  List<Result> searchMovieLists = [];

  Future<void> searchingData(String query) async {
    ApiResponseModel result = await ApiService.instance
        .getMovie(RestApi.searchMovie(query, currentPage));

    if (result.error) {
      errorMessage = result.message;
    }

    if (!result.error && result.message == null) {
      MovieDBResponseModel _model = result.list;
      totalAvailablePage = _model.totalPages!;
      if (_model.results != null) {
        searchMovieLists.addAll(_model.results!);
      }
    }

    isLoading = false;
    notifyListeners();
  }

  void searching() {
    if (isLoading) {
      isLoading = false;
    } else {
      isLoading = true;
    }
    notifyListeners();
  }

  void clearSearch() {
    currentPage = 1;
    totalAvailablePage = 1;
    isLoading = false;
    errorMessage = null;
    searchMovieLists.clear();
    notifyListeners();
  }
}
