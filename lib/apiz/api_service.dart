import 'dart:convert';
import 'dart:io';

import 'package:flutter_movie_app/data/api_response_model.dart';
import 'package:flutter_movie_app/data/image_response_model.dart';
import 'package:flutter_movie_app/data/movie_db_response_model.dart';
import 'package:flutter_movie_app/data/movie_details_response_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService._();

  static ApiService get instance => ApiService._();

  Future<ApiResponseModel> getMovie(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        MovieDBResponseModel result =
            movieDBResponseModelFromJson(response.body);

        return ApiResponseModel(error: false, list: result);
      } else {
        return ApiResponseModel(
          error: true,
          message: jsonDecode(response.body)['status_message'],
        );
      }
    } on SocketException catch (e) {
      return ApiResponseModel(
        error: true,
        message: 'Socket Exception ${e.message}',
      );
    } catch (e) {
      return ApiResponseModel(error: true, message: 'Exception $e');
    }
  }

  Future<ApiResponseModel> getMovieDetails(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        MovieDetailsResponseModel result =
            movieDetailsModelFromJson(response.body);

        return ApiResponseModel(error: false, list: result);
      } else {
        return ApiResponseModel(
          error: true,
          message: jsonDecode(response.body)['status_message'],
        );
      }
    } on SocketException catch (e) {
      return ApiResponseModel(
        error: true,
        message: 'Socket Exception ${e.message}',
      );
    } catch (e) {
      return ApiResponseModel(error: true, message: 'Exception $e');
    }
  }

  Future<ApiResponseModel> getImageList(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        ImageResponseModel result = imageModelFromJson(response.body);

        return ApiResponseModel(error: false, list: result);
      } else {
        return ApiResponseModel(
          error: true,
          message: jsonDecode(response.body)['status_message'],
        );
      }
    } on SocketException catch (e) {
      return ApiResponseModel(
        error: true,
        message: 'Socket Exception ${e.message}',
      );
    } catch (e) {
      return ApiResponseModel(error: true, message: 'Exception $e');
    }
  }
}
