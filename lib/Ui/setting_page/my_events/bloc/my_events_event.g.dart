// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_events_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitMyEvents extends InitMyEvents {
  factory _$InitMyEvents([void Function(InitMyEventsBuilder)? updates]) =>
      (new InitMyEventsBuilder()..update(updates))._build();

  _$InitMyEvents._() : super._();

  @override
  InitMyEvents rebuild(void Function(InitMyEventsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitMyEventsBuilder toBuilder() => new InitMyEventsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitMyEvents;
  }

  @override
  int get hashCode {
    return 77436694;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'InitMyEvents').toString();
  }
}

class InitMyEventsBuilder
    implements Builder<InitMyEvents, InitMyEventsBuilder> {
  _$InitMyEvents? _$v;

  InitMyEventsBuilder();

  @override
  void replace(InitMyEvents other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitMyEvents;
  }

  @override
  void update(void Function(InitMyEventsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitMyEvents build() => _build();

  _$InitMyEvents _build() {
    final _$result = _$v ?? new _$InitMyEvents._();
    replace(_$result);
    return _$result;
  }
}

class _$RemoveEvent extends RemoveEvent {
  @override
  final EventModel event;

  factory _$RemoveEvent([void Function(RemoveEventBuilder)? updates]) =>
      (new RemoveEventBuilder()..update(updates))._build();

  _$RemoveEvent._({required this.event}) : super._() {
    BuiltValueNullFieldError.checkNotNull(event, r'RemoveEvent', 'event');
  }

  @override
  RemoveEvent rebuild(void Function(RemoveEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoveEventBuilder toBuilder() => new RemoveEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoveEvent && event == other.event;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, event.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RemoveEvent')..add('event', event))
        .toString();
  }
}

class RemoveEventBuilder implements Builder<RemoveEvent, RemoveEventBuilder> {
  _$RemoveEvent? _$v;

  EventModelBuilder? _event;
  EventModelBuilder get event => _$this._event ??= new EventModelBuilder();
  set event(EventModelBuilder? event) => _$this._event = event;

  RemoveEventBuilder();

  RemoveEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _event = $v.event.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoveEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RemoveEvent;
  }

  @override
  void update(void Function(RemoveEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RemoveEvent build() => _build();

  _$RemoveEvent _build() {
    _$RemoveEvent _$result;
    try {
      _$result = _$v ?? new _$RemoveEvent._(event: event.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'event';
        event.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RemoveEvent', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$EditEvent extends EditEvent {
  @override
  final EditEventParam param;

  factory _$EditEvent([void Function(EditEventBuilder)? updates]) =>
      (new EditEventBuilder()..update(updates))._build();

  _$EditEvent._({required this.param}) : super._() {
    BuiltValueNullFieldError.checkNotNull(param, r'EditEvent', 'param');
  }

  @override
  EditEvent rebuild(void Function(EditEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EditEventBuilder toBuilder() => new EditEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EditEvent && param == other.param;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, param.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EditEvent')..add('param', param))
        .toString();
  }
}

class EditEventBuilder implements Builder<EditEvent, EditEventBuilder> {
  _$EditEvent? _$v;

  EditEventParam? _param;
  EditEventParam? get param => _$this._param;
  set param(EditEventParam? param) => _$this._param = param;

  EditEventBuilder();

  EditEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _param = $v.param;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EditEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EditEvent;
  }

  @override
  void update(void Function(EditEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EditEvent build() => _build();

  _$EditEvent _build() {
    final _$result = _$v ??
        new _$EditEvent._(
            param: BuiltValueNullFieldError.checkNotNull(
                param, r'EditEvent', 'param'));
    replace(_$result);
    return _$result;
  }
}

class _$ClearState extends ClearState {
  factory _$ClearState([void Function(ClearStateBuilder)? updates]) =>
      (new ClearStateBuilder()..update(updates))._build();

  _$ClearState._() : super._();

  @override
  ClearState rebuild(void Function(ClearStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClearStateBuilder toBuilder() => new ClearStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClearState;
  }

  @override
  int get hashCode {
    return 338996177;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ClearState').toString();
  }
}

class ClearStateBuilder implements Builder<ClearState, ClearStateBuilder> {
  _$ClearState? _$v;

  ClearStateBuilder();

  @override
  void replace(ClearState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClearState;
  }

  @override
  void update(void Function(ClearStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClearState build() => _build();

  _$ClearState _build() {
    final _$result = _$v ?? new _$ClearState._();
    replace(_$result);
    return _$result;
  }
}

class _$GetMyEvents extends GetMyEvents {
  factory _$GetMyEvents([void Function(GetMyEventsBuilder)? updates]) =>
      (new GetMyEventsBuilder()..update(updates))._build();

  _$GetMyEvents._() : super._();

  @override
  GetMyEvents rebuild(void Function(GetMyEventsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetMyEventsBuilder toBuilder() => new GetMyEventsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetMyEvents;
  }

  @override
  int get hashCode {
    return 844004189;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetMyEvents').toString();
  }
}

class GetMyEventsBuilder implements Builder<GetMyEvents, GetMyEventsBuilder> {
  _$GetMyEvents? _$v;

  GetMyEventsBuilder();

  @override
  void replace(GetMyEvents other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetMyEvents;
  }

  @override
  void update(void Function(GetMyEventsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetMyEvents build() => _build();

  _$GetMyEvents _build() {
    final _$result = _$v ?? new _$GetMyEvents._();
    replace(_$result);
    return _$result;
  }
}

class _$GetNextMyEvents extends GetNextMyEvents {
  factory _$GetNextMyEvents([void Function(GetNextMyEventsBuilder)? updates]) =>
      (new GetNextMyEventsBuilder()..update(updates))._build();

  _$GetNextMyEvents._() : super._();

  @override
  GetNextMyEvents rebuild(void Function(GetNextMyEventsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetNextMyEventsBuilder toBuilder() =>
      new GetNextMyEventsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetNextMyEvents;
  }

  @override
  int get hashCode {
    return 62313070;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetNextMyEvents').toString();
  }
}

class GetNextMyEventsBuilder
    implements Builder<GetNextMyEvents, GetNextMyEventsBuilder> {
  _$GetNextMyEvents? _$v;

  GetNextMyEventsBuilder();

  @override
  void replace(GetNextMyEvents other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetNextMyEvents;
  }

  @override
  void update(void Function(GetNextMyEventsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetNextMyEvents build() => _build();

  _$GetNextMyEvents _build() {
    final _$result = _$v ?? new _$GetNextMyEvents._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
