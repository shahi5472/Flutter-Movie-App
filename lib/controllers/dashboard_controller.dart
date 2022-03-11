import 'package:flutter/material.dart';
import 'package:flutter_movie_app/apiz/api_service.dart';
import 'package:flutter_movie_app/data/api_response_model.dart';
import 'package:flutter_movie_app/data/upcoming/upcoming_response_model.dart';

class DashboardController extends ChangeNotifier {
  int currentPage = 1;
  int totalAvailablePage = 1;
  bool isLoading = true;
  String? errorMessage;

  List<Result> upcomingMovieLists = [];

  Future<void> loadingData() async {
    ApiResponseModel result =
        await ApiService.instance.getUpcomingMovie(currentPage);

    if (result.error) {
      errorMessage = result.message;
    }

    if (!result.error && result.message == null) {
      UpcomingResponseModel _model = result.list;
      totalAvailablePage = _model.totalPages!;
      if (_model.results != null) {
        upcomingMovieLists.addAll(_model.results!);
      }
    }

    isLoading = false;
    notifyListeners();
  }
}
