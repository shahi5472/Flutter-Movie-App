import 'package:flutter_movie_app/utils/k_strings.dart';

class RestApi {
  RestApi._();

  static RestApi get instance => RestApi._();

  static const _baseUrl = 'https://api.themoviedb.org/3/movie';
  static const _imageBaseUrl = 'https://image.tmdb.org/t/p/original';

  static getImage(String image) => _imageBaseUrl + image;

  static upcomingMovie(int page) => '$_baseUrl/upcoming?api_key=${KString.apiKey}&page=$page';
  static topRatedMovie(int page) => '$_baseUrl/top_rated?api_key=${KString.apiKey}&page=$page';
}
