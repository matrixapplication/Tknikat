// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contactus_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ContactUs extends ContactUs {
  @override
  final String name;
  @override
  final String mail;
  @override
  final String title;
  @override
  final String message;

  factory _$ContactUs([void Function(ContactUsBuilder)? updates]) =>
      (new ContactUsBuilder()..update(updates))._build();

  _$ContactUs._(
      {required this.name,
      required this.mail,
      required this.title,
      required this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ContactUs', 'name');
    BuiltValueNullFieldError.checkNotNull(mail, r'ContactUs', 'mail');
    BuiltValueNullFieldError.checkNotNull(title, r'ContactUs', 'title');
    BuiltValueNullFieldError.checkNotNull(message, r'ContactUs', 'message');
  }

  @override
  ContactUs rebuild(void Function(ContactUsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactUsBuilder toBuilder() => new ContactUsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactUs &&
        name == other.name &&
        mail == other.mail &&
        title == other.title &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, mail.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContactUs')
          ..add('name', name)
          ..add('mail', mail)
          ..add('title', title)
          ..add('message', message))
        .toString();
  }
}

class ContactUsBuilder implements Builder<ContactUs, ContactUsBuilder> {
  _$ContactUs? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _mail;
  String? get mail => _$this._mail;
  set mail(String? mail) => _$this._mail = mail;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ContactUsBuilder();

  ContactUsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _mail = $v.mail;
      _title = $v.title;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactUs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContactUs;
  }

  @override
  void update(void Function(ContactUsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ContactUs build() => _build();

  _$ContactUs _build() {
    final _$result = _$v ??
        new _$ContactUs._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ContactUs', 'name'),
            mail: BuiltValueNullFieldError.checkNotNull(
                mail, r'ContactUs', 'mail'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'ContactUs', 'title'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ContactUs', 'message'));
    replace(_$result);
    return _$result;
  }
}

class _$Clear extends Clear {
  factory _$Clear([void Function(ClearBuilder)? updates]) =>
      (new ClearBuilder()..update(updates))._build();

  _$Clear._() : super._();

  @override
  Clear rebuild(void Function(ClearBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClearBuilder toBuilder() => new ClearBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Clear;
  }

  @override
  int get hashCode {
    return 102524199;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'Clear').toString();
  }
}

class ClearBuilder implements Builder<Clear, ClearBuilder> {
  _$Clear? _$v;

  ClearBuilder();

  @override
  void replace(Clear other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Clear;
  }

  @override
  void update(void Function(ClearBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Clear build() => _build();

  _$Clear _build() {
    final _$result = _$v ?? new _$Clear._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
