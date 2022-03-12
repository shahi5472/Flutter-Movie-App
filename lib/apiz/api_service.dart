import 'dart:convert';
import 'dart:io';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter_movie_app/data/api_response_model.dart';
import 'package:flutter_movie_app/data/image_response_model.dart';
import 'package:flutter_movie_app/data/movie_db_response_model.dart';
import 'package:flutter_movie_app/data/movie_details_response_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService._();

  static ApiService get instance => ApiService._();

  Future<ApiResponseModel> getMovie(String url, {String? cacheKey}) async {
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        MovieDBResponseModel result =
            movieDBResponseModelFromJson(response.body);

        if (cacheKey != null) {
          _updateCache(response.body, cacheKey);
        }

        return ApiResponseModel(error: false, list: result);
      } else {
        return ApiResponseModel(
          error: true,
          message: jsonDecode(response.body)['status_message'],
        );
      }
    } on SocketException catch (e) {
      if (cacheKey != null) {
        final isExist = await APICacheManager().isAPICacheKeyExist(cacheKey);
        if (isExist) {
          var cashData = await APICacheManager().getCacheData(cacheKey);
          MovieDBResponseModel cacheResult =
              movieDBResponseModelFromJson(cashData.syncData);
          return ApiResponseModel(error: false, list: cacheResult);
        }
        return ApiResponseModel(
          error: true,
          message: 'Socket Exception ${e.message}',
        );
      }
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

  Future<void> _updateCache(String body, String key) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: key,
      syncData: body,
    );

    await APICacheManager().addCacheData(cacheDBModel);
  }
}
