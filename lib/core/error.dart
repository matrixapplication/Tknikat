import 'dart:convert';

class NetworkException implements Exception {
  String error;
  final dynamic data;

  NetworkException({this.error = "Something Went Wrong", this.data});

  factory NetworkException.haundler(dynamic e) {
    String msg = "Something Went Wrong";
    dynamic responseData;

    try {
      responseData = json.decode(e.response.data);
      msg = responseData['error_des'] ?? msg;
    } catch (e) {
      responseData = null;
    }
    return NetworkException(error: msg.toString(), data: responseData);
  }
}

class ErrorCode {
  static const int somethingWentWrong = 1;
  static const int thanksYou = 2;
  static const int theCompanyAlreadyExists = 3;
}
