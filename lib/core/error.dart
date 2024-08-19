import 'dart:convert';

class NetworkException implements Exception {
  String error;
  final dynamic data;  // هذا الحقل سيحمل البيانات المرسلة من السيرفر

  NetworkException({this.error = "Something Went Wrong", this.data});

  // Factory method لتحليل الخطأ وإنشاء الاستثناء
  factory NetworkException.haundler(dynamic e) {
    String msg = "Something Went Wrong";
    dynamic responseData;

    try {
      // محاولة تحليل البيانات المستلمة من السيرفر
      responseData = json.decode(e.response.data);
      msg = responseData['error_des'] ?? msg;
    } catch (e) {
      // إذا حدث خطأ أثناء التحليل، سيتم استخدام الرسالة الافتراضية
      responseData = null;
    }

    // تمرير الرسالة والبيانات إلى الاستثناء
    return NetworkException(error: msg.toString(), data: responseData);
  }
}

class ErrorCode {
  static const int somethingWentWrong = 1;
  static const int thanksYou = 2;
  static const int theCompanyAlreadyExists = 3;
}
