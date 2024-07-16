// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginator.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Paginator> _$paginatorSerializer = new _$PaginatorSerializer();

class _$PaginatorSerializer implements StructuredSerializer<Paginator> {
  @override
  final Iterable<Type> types = const [Paginator, _$Paginator];
  @override
  final String wireName = 'Paginator';

  @override
  Iterable<Object?> serialize(Serializers serializers, Paginator object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.totalCount;
    if (value != null) {
      result
        ..add('total_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.limit;
    if (value != null) {
      result
        ..add('limit')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalPage;
    if (value != null) {
      result
        ..add('total_page')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.currentPage;
    if (value != null) {
      result
        ..add('current_page')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Paginator deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PaginatorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'total_count':
          result.totalCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'limit':
          result.limit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'total_page':
          result.totalPage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'current_page':
          result.currentPage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$Paginator extends Paginator {
  @override
  final int? totalCount;
  @override
  final int? limit;
  @override
  final int? totalPage;
  @override
  final int? currentPage;

  factory _$Paginator([void Function(PaginatorBuilder)? updates]) =>
      (new PaginatorBuilder()..update(updates))._build();

  _$Paginator._({this.totalCount, this.limit, this.totalPage, this.currentPage})
      : super._();

  @override
  Paginator rebuild(void Function(PaginatorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginatorBuilder toBuilder() => new PaginatorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Paginator &&
        totalCount == other.totalCount &&
        limit == other.limit &&
        totalPage == other.totalPage &&
        currentPage == other.currentPage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, totalCount.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jc(_$hash, totalPage.hashCode);
    _$hash = $jc(_$hash, currentPage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Paginator')
          ..add('totalCount', totalCount)
          ..add('limit', limit)
          ..add('totalPage', totalPage)
          ..add('currentPage', currentPage))
        .toString();
  }
}

class PaginatorBuilder implements Builder<Paginator, PaginatorBuilder> {
  _$Paginator? _$v;

  int? _totalCount;
  int? get totalCount => _$this._totalCount;
  set totalCount(int? totalCount) => _$this._totalCount = totalCount;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  int? _totalPage;
  int? get totalPage => _$this._totalPage;
  set totalPage(int? totalPage) => _$this._totalPage = totalPage;

  int? _currentPage;
  int? get currentPage => _$this._currentPage;
  set currentPage(int? currentPage) => _$this._currentPage = currentPage;

  PaginatorBuilder();

  PaginatorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _totalCount = $v.totalCount;
      _limit = $v.limit;
      _totalPage = $v.totalPage;
      _currentPage = $v.currentPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Paginator other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Paginator;
  }

  @override
  void update(void Function(PaginatorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Paginator build() => _build();

  _$Paginator _build() {
    final _$result = _$v ??
        new _$Paginator._(
            totalCount: totalCount,
            limit: limit,
            totalPage: totalPage,
            currentPage: currentPage);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
