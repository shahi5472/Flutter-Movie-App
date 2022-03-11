import 'dart:convert';
import 'dart:io';

import 'package:flutter_movie_app/data/api_response_model.dart';
import 'package:flutter_movie_app/data/upcoming/upcoming_response_model.dart';
import 'package:flutter_movie_app/utils/rest_api.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService._();

  static ApiService get instance => ApiService._();

  Future<ApiResponseModel> getUpcomingMovie(int page) async {
    try {
      http.Response response = await http.get(
        Uri.parse(RestApi.upcomingMovie(page)),
      );

      if (response.statusCode == 200) {
        UpcomingResponseModel result = upcomingResponseModelFromJson(response.body);

        return ApiResponseModel(error: false, list: result);
      } else {
        return ApiResponseModel(error: true, message: jsonDecode(response.body)['status_message']);
      }
    } on SocketException catch (e) {
      return ApiResponseModel(
          error: true, message: 'Socket Exception ${e.message}');
    } catch (e) {
      return ApiResponseModel(error: true, message: 'Exception $e');
    }
  }
}
