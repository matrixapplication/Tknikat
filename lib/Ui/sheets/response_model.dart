class ResponseModel<T> {
  final num? _code;
  final bool _isSuccess;
  final String? _message;
  T? data;

  ResponseModel(
      this._isSuccess,
      this._message, {
        this.data,
        num? code,
      })  :
        _code = code;

  num? get code => _code;

  String? get message => _message;


  bool get isSuccess => _isSuccess;
// dynamic get data => data;
}