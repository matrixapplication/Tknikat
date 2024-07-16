// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const EventStatus _$approved = const EventStatus._('approved');
const EventStatus _$unApproved = const EventStatus._('unApproved');
const EventStatus _$pending = const EventStatus._('pending');

EventStatus _$valueOf(String name) {
  switch (name) {
    case 'approved':
      return _$approved;
    case 'unApproved':
      return _$unApproved;
    case 'pending':
      return _$pending;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<EventStatus> _$values =
    new BuiltSet<EventStatus>(const <EventStatus>[
  _$approved,
  _$unApproved,
  _$pending,
]);

Serializer<EventStatus> _$eventStatusSerializer = new _$EventStatusSerializer();

class _$EventStatusSerializer implements PrimitiveSerializer<EventStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'approved': 1,
    'unApproved': 2,
    'pending': 3,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    1: 'approved',
    2: 'unApproved',
    3: 'pending',
  };

  @override
  final Iterable<Type> types = const <Type>[EventStatus];
  @override
  final String wireName = 'EventStatus';

  @override
  Object serialize(Serializers serializers, EventStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  EventStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      EventStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$EventModel extends EventModel {
  @override
  final int? id;
  @override
  final EventStatus? status;
  @override
  final int? shareCount;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? image;
  @override
  final String? endDate;
  @override
  final int? activationsCount;
  @override
  final int? userShare;
  @override
  final String? startDate;
  @override
  final bool? started;
  @override
  final bool? expired;
  @override
  final UserModel? creator;

  factory _$EventModel([void Function(EventModelBuilder)? updates]) =>
      (new EventModelBuilder()..update(updates))._build();

  _$EventModel._(
      {this.id,
      this.status,
      this.shareCount,
      this.name,
      this.description,
      this.image,
      this.endDate,
      this.activationsCount,
      this.userShare,
      this.startDate,
      this.started,
      this.expired,
      this.creator})
      : super._();

  @override
  EventModel rebuild(void Function(EventModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventModelBuilder toBuilder() => new EventModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventModel &&
        id == other.id &&
        status == other.status &&
        shareCount == other.shareCount &&
        name == other.name &&
        description == other.description &&
        image == other.image &&
        endDate == other.endDate &&
        activationsCount == other.activationsCount &&
        userShare == other.userShare &&
        startDate == other.startDate &&
        started == other.started &&
        expired == other.expired &&
        creator == other.creator;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, shareCount.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, endDate.hashCode);
    _$hash = $jc(_$hash, activationsCount.hashCode);
    _$hash = $jc(_$hash, userShare.hashCode);
    _$hash = $jc(_$hash, startDate.hashCode);
    _$hash = $jc(_$hash, started.hashCode);
    _$hash = $jc(_$hash, expired.hashCode);
    _$hash = $jc(_$hash, creator.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventModel')
          ..add('id', id)
          ..add('status', status)
          ..add('shareCount', shareCount)
          ..add('name', name)
          ..add('description', description)
          ..add('image', image)
          ..add('endDate', endDate)
          ..add('activationsCount', activationsCount)
          ..add('userShare', userShare)
          ..add('startDate', startDate)
          ..add('started', started)
          ..add('expired', expired)
          ..add('creator', creator))
        .toString();
  }
}

class EventModelBuilder implements Builder<EventModel, EventModelBuilder> {
  _$EventModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  EventStatus? _status;
  EventStatus? get status => _$this._status;
  set status(EventStatus? status) => _$this._status = status;

  int? _shareCount;
  int? get shareCount => _$this._shareCount;
  set shareCount(int? shareCount) => _$this._shareCount = shareCount;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _endDate;
  String? get endDate => _$this._endDate;
  set endDate(String? endDate) => _$this._endDate = endDate;

  int? _activationsCount;
  int? get activationsCount => _$this._activationsCount;
  set activationsCount(int? activationsCount) =>
      _$this._activationsCount = activationsCount;

  int? _userShare;
  int? get userShare => _$this._userShare;
  set userShare(int? userShare) => _$this._userShare = userShare;

  String? _startDate;
  String? get startDate => _$this._startDate;
  set startDate(String? startDate) => _$this._startDate = startDate;

  bool? _started;
  bool? get started => _$this._started;
  set started(bool? started) => _$this._started = started;

  bool? _expired;
  bool? get expired => _$this._expired;
  set expired(bool? expired) => _$this._expired = expired;

  UserModelBuilder? _creator;
  UserModelBuilder get creator => _$this._creator ??= new UserModelBuilder();
  set creator(UserModelBuilder? creator) => _$this._creator = creator;

  EventModelBuilder();

  EventModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _status = $v.status;
      _shareCount = $v.shareCount;
      _name = $v.name;
      _description = $v.description;
      _image = $v.image;
      _endDate = $v.endDate;
      _activationsCount = $v.activationsCount;
      _userShare = $v.userShare;
      _startDate = $v.startDate;
      _started = $v.started;
      _expired = $v.expired;
      _creator = $v.creator?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventModel;
  }

  @override
  void update(void Function(EventModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventModel build() => _build();

  _$EventModel _build() {
    _$EventModel _$result;
    try {
      _$result = _$v ??
          new _$EventModel._(
              id: id,
              status: status,
              shareCount: shareCount,
              name: name,
              description: description,
              image: image,
              endDate: endDate,
              activationsCount: activationsCount,
              userShare: userShare,
              startDate: startDate,
              started: started,
              expired: expired,
              creator: _creator?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'creator';
        _creator?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EventModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
