// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_content_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProductContentState extends ProductContentState {
  @override
  final String? error;
  @override
  final bool success;
  @override
  final BuiltList<CommentModel> comments;
  @override
  final Paginator paginator;
  @override
  final bool isLoading;

  factory _$ProductContentState(
          [void Function(ProductContentStateBuilder)? updates]) =>
      (new ProductContentStateBuilder()..update(updates))._build();

  _$ProductContentState._(
      {this.error,
      required this.success,
      required this.comments,
      required this.paginator,
      required this.isLoading})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'ProductContentState', 'success');
    BuiltValueNullFieldError.checkNotNull(
        comments, r'ProductContentState', 'comments');
    BuiltValueNullFieldError.checkNotNull(
        paginator, r'ProductContentState', 'paginator');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'ProductContentState', 'isLoading');
  }

  @override
  ProductContentState rebuild(
          void Function(ProductContentStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductContentStateBuilder toBuilder() =>
      new ProductContentStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductContentState &&
        error == other.error &&
        success == other.success &&
        comments == other.comments &&
        paginator == other.paginator &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, comments.hashCode);
    _$hash = $jc(_$hash, paginator.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductContentState')
          ..add('error', error)
          ..add('success', success)
          ..add('comments', comments)
          ..add('paginator', paginator)
          ..add('isLoading', isLoading))
        .toString();
  }
}

class ProductContentStateBuilder
    implements Builder<ProductContentState, ProductContentStateBuilder> {
  _$ProductContentState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<CommentModel>? _comments;
  ListBuilder<CommentModel> get comments =>
      _$this._comments ??= new ListBuilder<CommentModel>();
  set comments(ListBuilder<CommentModel>? comments) =>
      _$this._comments = comments;

  PaginatorBuilder? _paginator;
  PaginatorBuilder get paginator =>
      _$this._paginator ??= new PaginatorBuilder();
  set paginator(PaginatorBuilder? paginator) => _$this._paginator = paginator;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  ProductContentStateBuilder();

  ProductContentStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _success = $v.success;
      _comments = $v.comments.toBuilder();
      _paginator = $v.paginator.toBuilder();
      _isLoading = $v.isLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductContentState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductContentState;
  }

  @override
  void update(void Function(ProductContentStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductContentState build() => _build();

  _$ProductContentState _build() {
    _$ProductContentState _$result;
    try {
      _$result = _$v ??
          new _$ProductContentState._(
            error: error,
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'ProductContentState', 'success'),
            comments: comments.build(),
            paginator: paginator.build(),
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'ProductContentState', 'isLoading'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'comments';
        comments.build();
        _$failedField = 'paginator';
        paginator.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProductContentState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
