// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Notification extends Notification {
  @override
  final int? id;
  @override
  final int? userId;
  @override
  final String? title;
  @override
  final String? message;
  @override
  final String? createdAt;
  @override
  final String? image;
  @override
  final String? userName;
  @override
  final NotificationData? data;
  @override
  final int? read;

  factory _$Notification([void Function(NotificationBuilder)? updates]) =>
      (new NotificationBuilder()..update(updates))._build();

  _$Notification._(
      {this.id,
      this.userId,
      this.title,
      this.message,
      this.createdAt,
      this.image,
      this.userName,
      this.data,
      this.read})
      : super._();

  @override
  Notification rebuild(void Function(NotificationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationBuilder toBuilder() => new NotificationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Notification &&
        id == other.id &&
        userId == other.userId &&
        title == other.title &&
        message == other.message &&
        createdAt == other.createdAt &&
        image == other.image &&
        userName == other.userName &&
        data == other.data &&
        read == other.read;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, userName.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, read.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Notification')
          ..add('id', id)
          ..add('userId', userId)
          ..add('title', title)
          ..add('message', message)
          ..add('createdAt', createdAt)
          ..add('image', image)
          ..add('userName', userName)
          ..add('data', data)
          ..add('read', read))
        .toString();
  }
}

class NotificationBuilder
    implements Builder<Notification, NotificationBuilder> {
  _$Notification? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  NotificationDataBuilder? _data;
  NotificationDataBuilder get data =>
      _$this._data ??= new NotificationDataBuilder();
  set data(NotificationDataBuilder? data) => _$this._data = data;

  int? _read;
  int? get read => _$this._read;
  set read(int? read) => _$this._read = read;

  NotificationBuilder();

  NotificationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _title = $v.title;
      _message = $v.message;
      _createdAt = $v.createdAt;
      _image = $v.image;
      _userName = $v.userName;
      _data = $v.data?.toBuilder();
      _read = $v.read;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Notification other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Notification;
  }

  @override
  void update(void Function(NotificationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Notification build() => _build();

  _$Notification _build() {
    _$Notification _$result;
    try {
      _$result = _$v ??
          new _$Notification._(
              id: id,
              userId: userId,
              title: title,
              message: message,
              createdAt: createdAt,
              image: image,
              userName: userName,
              data: _data?.build(),
              read: read);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Notification', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
