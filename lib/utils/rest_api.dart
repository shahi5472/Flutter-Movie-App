import 'package:flutter_movie_app/utils/k_strings.dart';

class RestApi {
  RestApi._();

  static RestApi get instance => RestApi._();

  static const _baseUrl = 'https://api.themoviedb.org/3';
  static const _imageBaseUrl = 'https://image.tmdb.org/t/p/original';

  static getImage(String image) => _imageBaseUrl + image;

  static upcomingMovie(int page) =>
      '$_baseUrl/movie/upcoming?api_key=${KString.apiKey}&page=$page';

  static topRatedMovie(int page) =>
      '$_baseUrl/movie/top_rated?api_key=${KString.apiKey}&page=$page';

  static searchMovie(String query, int page) =>
      '$_baseUrl/search/movie?api_key=${KString.apiKey}&query=$query&page=$page&include_adult=false';
}
