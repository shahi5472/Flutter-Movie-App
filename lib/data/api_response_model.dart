class ApiResponseModel {
  bool error;
  String? message;
  dynamic list;

  ApiResponseModel({required this.error, this.message, this.list});
}
