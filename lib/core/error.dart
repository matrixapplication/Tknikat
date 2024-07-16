import 'dart:convert';

class NetworkException implements Exception {
  String error;

  NetworkException({this.error = "Something Went Wrong"});

  factory NetworkException.haundler(dynamic e) {
    String msg = "Something Went Wrong";
    try {
      msg = json.decode(e.response.data)['error_des'] ?? msg;
    } catch (e) {}
    return NetworkException(error: msg.toString());
  }
}

class ErrorCode {
  static const int somethingWentWrong = 1;
  static const int thanksYou = 2;
  static const int theCompanyAlreadyExists = 3;
}
