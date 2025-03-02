// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ShareStatus _$unApproved = const ShareStatus._('unapproved');
const ShareStatus _$approved = const ShareStatus._('approved');
const ShareStatus _$pending = const ShareStatus._('pending');

ShareStatus _$valueOf(String name) {
  switch (name) {
    case 'unapproved':
      return _$unApproved;
    case 'approved':
      return _$approved;
    case 'pending':
      return _$pending;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ShareStatus> _$values =
    new BuiltSet<ShareStatus>(const <ShareStatus>[
  _$unApproved,
  _$approved,
  _$pending,
]);

Serializer<ShareStatus> _$shareStatusSerializer = new _$ShareStatusSerializer();

class _$ShareStatusSerializer implements PrimitiveSerializer<ShareStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'unapproved': 0,
    'approved': 1,
    'pending': 2,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    0: 'unapproved',
    1: 'approved',
    2: 'pending',
  };

  @override
  final Iterable<Type> types = const <Type>[ShareStatus];
  @override
  final String wireName = 'ShareStatus';

  @override
  Object serialize(Serializers serializers, ShareStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ShareStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ShareStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ShareModel extends ShareModel {
  @override
  final int id;
  @override
  final ShareStatus status;
  @override
  final int? deniedOption;
  @override
  final int views;
  @override
  final int? reviewsCount;
  @override
  final String userName;
  @override
  final String? description;
  @override
  final String image;
  @override
  final UserModel user;
  @override
  final String? createdAt;
  @override
  final EventModel? event;

  factory _$ShareModel([void Function(ShareModelBuilder)? updates]) =>
      (new ShareModelBuilder()..update(updates))._build();

  _$ShareModel._(
      {required this.id,
      required this.status,
      this.deniedOption,
      required this.views,
      this.reviewsCount,
      required this.userName,
      this.description,
      required this.image,
      required this.user,
      this.createdAt,
      this.event})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ShareModel', 'id');
    BuiltValueNullFieldError.checkNotNull(status, r'ShareModel', 'status');
    BuiltValueNullFieldError.checkNotNull(views, r'ShareModel', 'views');
    BuiltValueNullFieldError.checkNotNull(userName, r'ShareModel', 'userName');
    BuiltValueNullFieldError.checkNotNull(image, r'ShareModel', 'image');
    BuiltValueNullFieldError.checkNotNull(user, r'ShareModel', 'user');
  }

  @override
  ShareModel rebuild(void Function(ShareModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShareModelBuilder toBuilder() => new ShareModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShareModel &&
        id == other.id &&
        status == other.status &&
        deniedOption == other.deniedOption &&
        views == other.views &&
        reviewsCount == other.reviewsCount &&
        userName == other.userName &&
        description == other.description &&
        image == other.image &&
        user == other.user &&
        createdAt == other.createdAt &&
        event == other.event;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, deniedOption.hashCode);
    _$hash = $jc(_$hash, views.hashCode);
    _$hash = $jc(_$hash, reviewsCount.hashCode);
    _$hash = $jc(_$hash, userName.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, event.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShareModel')
          ..add('id', id)
          ..add('status', status)
          ..add('deniedOption', deniedOption)
          ..add('views', views)
          ..add('reviewsCount', reviewsCount)
          ..add('userName', userName)
          ..add('description', description)
          ..add('image', image)
          ..add('user', user)
          ..add('createdAt', createdAt)
          ..add('event', event))
        .toString();
  }
}

class ShareModelBuilder implements Builder<ShareModel, ShareModelBuilder> {
  _$ShareModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  ShareStatus? _status;
  ShareStatus? get status => _$this._status;
  set status(ShareStatus? status) => _$this._status = status;

  int? _deniedOption;
  int? get deniedOption => _$this._deniedOption;
  set deniedOption(int? deniedOption) => _$this._deniedOption = deniedOption;

  int? _views;
  int? get views => _$this._views;
  set views(int? views) => _$this._views = views;

  int? _reviewsCount;
  int? get reviewsCount => _$this._reviewsCount;
  set reviewsCount(int? reviewsCount) => _$this._reviewsCount = reviewsCount;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  UserModelBuilder? _user;
  UserModelBuilder get user => _$this._user ??= new UserModelBuilder();
  set user(UserModelBuilder? user) => _$this._user = user;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  EventModelBuilder? _event;
  EventModelBuilder get event => _$this._event ??= new EventModelBuilder();
  set event(EventModelBuilder? event) => _$this._event = event;

  ShareModelBuilder();

  ShareModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _status = $v.status;
      _deniedOption = $v.deniedOption;
      _views = $v.views;
      _reviewsCount = $v.reviewsCount;
      _userName = $v.userName;
      _description = $v.description;
      _image = $v.image;
      _user = $v.user.toBuilder();
      _createdAt = $v.createdAt;
      _event = $v.event?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShareModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShareModel;
  }

  @override
  void update(void Function(ShareModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShareModel build() => _build();

  _$ShareModel _build() {
    _$ShareModel _$result;
    try {
      _$result = _$v ??
          new _$ShareModel._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'ShareModel', 'id'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'ShareModel', 'status'),
              deniedOption: deniedOption,
              views: BuiltValueNullFieldError.checkNotNull(
                  views, r'ShareModel', 'views'),
              reviewsCount: reviewsCount,
              userName: BuiltValueNullFieldError.checkNotNull(
                  userName, r'ShareModel', 'userName'),
              description: description,
              image: BuiltValueNullFieldError.checkNotNull(
                  image, r'ShareModel', 'image'),
              user: user.build(),
              createdAt: createdAt,
              event: _event?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();

        _$failedField = 'event';
        _event?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ShareModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
