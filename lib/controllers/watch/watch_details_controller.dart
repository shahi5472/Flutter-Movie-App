import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/apiz/api_service.dart';
import 'package:flutter_movie_app/data/api_response_model.dart';
import 'package:flutter_movie_app/data/image_response_model.dart';
import 'package:flutter_movie_app/data/movie_details_response_model.dart';
import 'package:flutter_movie_app/utils/rest_api.dart';

class WatchDetailsController extends ChangeNotifier {
  bool isDetailsLoading = true;
  String? errorMessage;

  MovieDetailsResponseModel model = MovieDetailsResponseModel();
  List<Backdrops> backdrops = [];

  Future<void> getMovieDetails(int movieId) async {
    _getImageList(movieId);
    ApiResponseModel result = await ApiService.instance
        .getMovieDetails(RestApi.detailsMovie(movieId));

    if (result.error && result.message != null) {
      errorMessage = result.message;
    }

    if (!result.error && result.message == null) {
      model = result.list;
    }

    isDetailsLoading = false;
    notifyListeners();
  }

  Future<void> _getImageList(int movieId) async {
    ApiResponseModel result =
        await ApiService.instance.getImageList(RestApi.getImageList(movieId));

    if (result.error && result.message != null) {
      errorMessage = result.message;
    }

    if (!result.error && result.message == null) {
      backdrops.clear();
      ImageResponseModel imageResponseModel = result.list;
      backdrops.addAll(imageResponseModel.backdrops!);
    }

    notifyListeners();
  }

  void clear() {
    isDetailsLoading = true;
    errorMessage = null;
    model = MovieDetailsResponseModel();
    backdrops = [];
  }
}
