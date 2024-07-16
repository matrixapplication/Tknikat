// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributes.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Attributes> _$attributesSerializer = new _$AttributesSerializer();

class _$AttributesSerializer implements StructuredSerializer<Attributes> {
  @override
  final Iterable<Type> types = const [Attributes, _$Attributes];
  @override
  final String wireName = 'Attributes';

  @override
  Iterable<Object?> serialize(Serializers serializers, Attributes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.min_price;
    if (value != null) {
      result
        ..add('min_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.max_price;
    if (value != null) {
      result
        ..add('max_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sizes;
    if (value != null) {
      result
        ..add('sizes')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.colors;
    if (value != null) {
      result
        ..add('colors')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.categoryModel;
    if (value != null) {
      result
        ..add('categories')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(CategoryModel)])));
    }
    return result;
  }

  @override
  Attributes deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AttributesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'min_price':
          result.min_price = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'max_price':
          result.max_price = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sizes':
          result.sizes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'colors':
          result.colors.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'categories':
          result.categoryModel.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CategoryModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Attributes extends Attributes {
  @override
  final String? min_price;
  @override
  final String? max_price;
  @override
  final BuiltList<String>? sizes;
  @override
  final BuiltList<String>? colors;
  @override
  final BuiltList<CategoryModel>? categoryModel;

  factory _$Attributes([void Function(AttributesBuilder)? updates]) =>
      (new AttributesBuilder()..update(updates))._build();

  _$Attributes._(
      {this.min_price,
      this.max_price,
      this.sizes,
      this.colors,
      this.categoryModel})
      : super._();

  @override
  Attributes rebuild(void Function(AttributesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AttributesBuilder toBuilder() => new AttributesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Attributes &&
        min_price == other.min_price &&
        max_price == other.max_price &&
        sizes == other.sizes &&
        colors == other.colors &&
        categoryModel == other.categoryModel;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, min_price.hashCode);
    _$hash = $jc(_$hash, max_price.hashCode);
    _$hash = $jc(_$hash, sizes.hashCode);
    _$hash = $jc(_$hash, colors.hashCode);
    _$hash = $jc(_$hash, categoryModel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Attributes')
          ..add('min_price', min_price)
          ..add('max_price', max_price)
          ..add('sizes', sizes)
          ..add('colors', colors)
          ..add('categoryModel', categoryModel))
        .toString();
  }
}

class AttributesBuilder implements Builder<Attributes, AttributesBuilder> {
  _$Attributes? _$v;

  String? _min_price;
  String? get min_price => _$this._min_price;
  set min_price(String? min_price) => _$this._min_price = min_price;

  String? _max_price;
  String? get max_price => _$this._max_price;
  set max_price(String? max_price) => _$this._max_price = max_price;

  ListBuilder<String>? _sizes;
  ListBuilder<String> get sizes => _$this._sizes ??= new ListBuilder<String>();
  set sizes(ListBuilder<String>? sizes) => _$this._sizes = sizes;

  ListBuilder<String>? _colors;
  ListBuilder<String> get colors =>
      _$this._colors ??= new ListBuilder<String>();
  set colors(ListBuilder<String>? colors) => _$this._colors = colors;

  ListBuilder<CategoryModel>? _categoryModel;
  ListBuilder<CategoryModel> get categoryModel =>
      _$this._categoryModel ??= new ListBuilder<CategoryModel>();
  set categoryModel(ListBuilder<CategoryModel>? categoryModel) =>
      _$this._categoryModel = categoryModel;

  AttributesBuilder();

  AttributesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _min_price = $v.min_price;
      _max_price = $v.max_price;
      _sizes = $v.sizes?.toBuilder();
      _colors = $v.colors?.toBuilder();
      _categoryModel = $v.categoryModel?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Attributes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Attributes;
  }

  @override
  void update(void Function(AttributesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Attributes build() => _build();

  _$Attributes _build() {
    _$Attributes _$result;
    try {
      _$result = _$v ??
          new _$Attributes._(
              min_price: min_price,
              max_price: max_price,
              sizes: _sizes?.build(),
              colors: _colors?.build(),
              categoryModel: _categoryModel?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sizes';
        _sizes?.build();
        _$failedField = 'colors';
        _colors?.build();
        _$failedField = 'categoryModel';
        _categoryModel?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Attributes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
