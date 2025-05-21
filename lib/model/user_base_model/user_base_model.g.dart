// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_base_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserBaseModel> _$userBaseModelSerializer =
    new _$UserBaseModelSerializer();

class _$UserBaseModelSerializer implements StructuredSerializer<UserBaseModel> {
  @override
  final Iterable<Type> types = const [UserBaseModel, _$UserBaseModel];
  @override
  final String wireName = 'UserBaseModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserBaseModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.token;
    if (value != null) {
      result
        ..add('token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(UserModel)));
    }
    return result;
  }

  @override
  UserBaseModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBaseModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserModel))! as UserModel);
          break;
      }
    }

    return result.build();
  }
}

class _$UserBaseModel extends UserBaseModel {
  @override
  final String? token;
  @override
  final UserModel? user;

  factory _$UserBaseModel([void Function(UserBaseModelBuilder)? updates]) =>
      (new UserBaseModelBuilder()..update(updates))._build();

  _$UserBaseModel._({this.token, this.user}) : super._();

  @override
  UserBaseModel rebuild(void Function(UserBaseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBaseModelBuilder toBuilder() => new UserBaseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserBaseModel && token == other.token && user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserBaseModel')
          ..add('token', token)
          ..add('user', user))
        .toString();
  }
}

class UserBaseModelBuilder
    implements Builder<UserBaseModel, UserBaseModelBuilder> {
  _$UserBaseModel? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  UserModelBuilder? _user;
  UserModelBuilder get user => _$this._user ??= new UserModelBuilder();
  set user(UserModelBuilder? user) => _$this._user = user;

  UserBaseModelBuilder();

  UserBaseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserBaseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserBaseModel;
  }

  @override
  void update(void Function(UserBaseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserBaseModel build() => _build();

  _$UserBaseModel _build() {
    _$UserBaseModel _$result;
    try {
      _$result = _$v ??
          new _$UserBaseModel._(
            token: token,
            user: _user?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserBaseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
