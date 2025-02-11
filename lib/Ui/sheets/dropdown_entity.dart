import 'package:equatable/equatable.dart';

class DropDownEntity<T> extends Equatable {
  final int _id;
  final String _title;
  final String? _image;
  final T? _key;
  final int _color;

  @override
  List<Object> get props => [_id, _title];

  const DropDownEntity({
    required int id,
    required String title,
    int color = 0xffffff,
    String? image,
    T? key,
  })  : _id = id,
        _title = title,
        _color = color,
        _key = key,
        _image = image;

  int get color => _color;

  String? get image => _image;

  T? get key => _key;

  String get title => _title;

  int get id => _id;
}
