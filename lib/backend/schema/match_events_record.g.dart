// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_events_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MatchEventsRecord> _$matchEventsRecordSerializer =
    new _$MatchEventsRecordSerializer();

class _$MatchEventsRecordSerializer
    implements StructuredSerializer<MatchEventsRecord> {
  @override
  final Iterable<Type> types = const [MatchEventsRecord, _$MatchEventsRecord];
  @override
  final String wireName = 'MatchEventsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MatchEventsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.actionID;
    if (value != null) {
      result
        ..add('actionID')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.actionableFencer;
    if (value != null) {
      result
        ..add('actionableFencer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.periodOfAction;
    if (value != null) {
      result
        ..add('periodOfAction')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.scoreLeft;
    if (value != null) {
      result
        ..add('scoreLeft')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.scoreRight;
    if (value != null) {
      result
        ..add('scoreRight')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.timeOfAction;
    if (value != null) {
      result
        ..add('timeOfAction')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  MatchEventsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MatchEventsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'actionID':
          result.actionID = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'actionableFencer':
          result.actionableFencer = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'periodOfAction':
          result.periodOfAction = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'scoreLeft':
          result.scoreLeft = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'scoreRight':
          result.scoreRight = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'timeOfAction':
          result.timeOfAction = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$MatchEventsRecord extends MatchEventsRecord {
  @override
  final int? actionID;
  @override
  final DocumentReference<Object?>? actionableFencer;
  @override
  final int? periodOfAction;
  @override
  final int? scoreLeft;
  @override
  final int? scoreRight;
  @override
  final int? timeOfAction;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MatchEventsRecord(
          [void Function(MatchEventsRecordBuilder)? updates]) =>
      (new MatchEventsRecordBuilder()..update(updates))._build();

  _$MatchEventsRecord._(
      {this.actionID,
      this.actionableFencer,
      this.periodOfAction,
      this.scoreLeft,
      this.scoreRight,
      this.timeOfAction,
      this.ffRef})
      : super._();

  @override
  MatchEventsRecord rebuild(void Function(MatchEventsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MatchEventsRecordBuilder toBuilder() =>
      new MatchEventsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MatchEventsRecord &&
        actionID == other.actionID &&
        actionableFencer == other.actionableFencer &&
        periodOfAction == other.periodOfAction &&
        scoreLeft == other.scoreLeft &&
        scoreRight == other.scoreRight &&
        timeOfAction == other.timeOfAction &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc(0, actionID.hashCode),
                            actionableFencer.hashCode),
                        periodOfAction.hashCode),
                    scoreLeft.hashCode),
                scoreRight.hashCode),
            timeOfAction.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MatchEventsRecord')
          ..add('actionID', actionID)
          ..add('actionableFencer', actionableFencer)
          ..add('periodOfAction', periodOfAction)
          ..add('scoreLeft', scoreLeft)
          ..add('scoreRight', scoreRight)
          ..add('timeOfAction', timeOfAction)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MatchEventsRecordBuilder
    implements Builder<MatchEventsRecord, MatchEventsRecordBuilder> {
  _$MatchEventsRecord? _$v;

  int? _actionID;
  int? get actionID => _$this._actionID;
  set actionID(int? actionID) => _$this._actionID = actionID;

  DocumentReference<Object?>? _actionableFencer;
  DocumentReference<Object?>? get actionableFencer => _$this._actionableFencer;
  set actionableFencer(DocumentReference<Object?>? actionableFencer) =>
      _$this._actionableFencer = actionableFencer;

  int? _periodOfAction;
  int? get periodOfAction => _$this._periodOfAction;
  set periodOfAction(int? periodOfAction) =>
      _$this._periodOfAction = periodOfAction;

  int? _scoreLeft;
  int? get scoreLeft => _$this._scoreLeft;
  set scoreLeft(int? scoreLeft) => _$this._scoreLeft = scoreLeft;

  int? _scoreRight;
  int? get scoreRight => _$this._scoreRight;
  set scoreRight(int? scoreRight) => _$this._scoreRight = scoreRight;

  int? _timeOfAction;
  int? get timeOfAction => _$this._timeOfAction;
  set timeOfAction(int? timeOfAction) => _$this._timeOfAction = timeOfAction;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MatchEventsRecordBuilder() {
    MatchEventsRecord._initializeBuilder(this);
  }

  MatchEventsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _actionID = $v.actionID;
      _actionableFencer = $v.actionableFencer;
      _periodOfAction = $v.periodOfAction;
      _scoreLeft = $v.scoreLeft;
      _scoreRight = $v.scoreRight;
      _timeOfAction = $v.timeOfAction;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MatchEventsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MatchEventsRecord;
  }

  @override
  void update(void Function(MatchEventsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MatchEventsRecord build() => _build();

  _$MatchEventsRecord _build() {
    final _$result = _$v ??
        new _$MatchEventsRecord._(
            actionID: actionID,
            actionableFencer: actionableFencer,
            periodOfAction: periodOfAction,
            scoreLeft: scoreLeft,
            scoreRight: scoreRight,
            timeOfAction: timeOfAction,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
