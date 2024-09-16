// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotificationData> _$notificationDataSerializer =
    new _$NotificationDataSerializer();

class _$NotificationDataSerializer
    implements StructuredSerializer<NotificationData> {
  @override
  final Iterable<Type> types = const [NotificationData, _$NotificationData];
  @override
  final String wireName = 'NotificationData';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotificationData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'model_id',
      serializers.serialize(object.modalId,
          specifiedType: const FullType(String)),
      'model_type',
      serializers.serialize(object.modalType,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.slug;
    if (value != null) {
      result
        ..add('slug')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.denied;
    if (value != null) {
      result
        ..add('denied')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NotificationData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'model_id':
          result.modalId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'model_type':
          result.modalType = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'slug':
          result.slug = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'denied':
          result.denied = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationData extends NotificationData {
  @override
  final String modalId;
  @override
  final String modalType;
  @override
  final String? slug;
  @override
  final String? denied;
  @override
  final String? comment;

  factory _$NotificationData(
          [void Function(NotificationDataBuilder)? updates]) =>
      (new NotificationDataBuilder()..update(updates))._build();

  _$NotificationData._(
      {required this.modalId,
      required this.modalType,
      this.slug,
      this.denied,
      this.comment})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        modalId, r'NotificationData', 'modalId');
    BuiltValueNullFieldError.checkNotNull(
        modalType, r'NotificationData', 'modalType');
  }

  @override
  NotificationData rebuild(void Function(NotificationDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationDataBuilder toBuilder() =>
      new NotificationDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationData &&
        modalId == other.modalId &&
        modalType == other.modalType &&
        slug == other.slug &&
        denied == other.denied &&
        comment == other.comment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, modalId.hashCode);
    _$hash = $jc(_$hash, modalType.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, denied.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationData')
          ..add('modalId', modalId)
          ..add('modalType', modalType)
          ..add('slug', slug)
          ..add('denied', denied)
          ..add('comment', comment))
        .toString();
  }
}

class NotificationDataBuilder
    implements Builder<NotificationData, NotificationDataBuilder> {
  _$NotificationData? _$v;

  String? _modalId;
  String? get modalId => _$this._modalId;
  set modalId(String? modalId) => _$this._modalId = modalId;

  String? _modalType;
  String? get modalType => _$this._modalType;
  set modalType(String? modalType) => _$this._modalType = modalType;

  String? _slug;
  String? get slug => _$this._slug;
  set slug(String? slug) => _$this._slug = slug;

  String? _denied;
  String? get denied => _$this._denied;
  set denied(String? denied) => _$this._denied = denied;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  NotificationDataBuilder();

  NotificationDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _modalId = $v.modalId;
      _modalType = $v.modalType;
      _slug = $v.slug;
      _denied = $v.denied;
      _comment = $v.comment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationData;
  }

  @override
  void update(void Function(NotificationDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationData build() => _build();

  _$NotificationData _build() {
    final _$result = _$v ??
        new _$NotificationData._(
            modalId: BuiltValueNullFieldError.checkNotNull(
                modalId, r'NotificationData', 'modalId'),
            modalType: BuiltValueNullFieldError.checkNotNull(
                modalType, r'NotificationData', 'modalType'),
            slug: slug,
            denied: denied,
            comment: comment);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
