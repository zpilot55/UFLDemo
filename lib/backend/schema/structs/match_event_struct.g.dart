// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_event_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MatchEventStruct> _$matchEventStructSerializer =
    new _$MatchEventStructSerializer();

class _$MatchEventStructSerializer
    implements StructuredSerializer<MatchEventStruct> {
  @override
  final Iterable<Type> types = const [MatchEventStruct, _$MatchEventStruct];
  @override
  final String wireName = 'MatchEventStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, MatchEventStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.actionableFencer;
    if (value != null) {
      result
        ..add('actionableFencer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
    value = object.periodOfAction;
    if (value != null) {
      result
        ..add('periodOfAction')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.actionID;
    if (value != null) {
      result
        ..add('actionID')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  MatchEventStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MatchEventStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'actionableFencer':
          result.actionableFencer = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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
        case 'periodOfAction':
          result.periodOfAction = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'actionID':
          result.actionID = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$MatchEventStruct extends MatchEventStruct {
  @override
  final DocumentReference<Object?>? actionableFencer;
  @override
  final int? scoreLeft;
  @override
  final int? scoreRight;
  @override
  final int? timeOfAction;
  @override
  final int? periodOfAction;
  @override
  final int? actionID;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$MatchEventStruct(
          [void Function(MatchEventStructBuilder)? updates]) =>
      (new MatchEventStructBuilder()..update(updates))._build();

  _$MatchEventStruct._(
      {this.actionableFencer,
      this.scoreLeft,
      this.scoreRight,
      this.timeOfAction,
      this.periodOfAction,
      this.actionID,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'MatchEventStruct', 'firestoreUtilData');
  }

  @override
  MatchEventStruct rebuild(void Function(MatchEventStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MatchEventStructBuilder toBuilder() =>
      new MatchEventStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MatchEventStruct &&
        actionableFencer == other.actionableFencer &&
        scoreLeft == other.scoreLeft &&
        scoreRight == other.scoreRight &&
        timeOfAction == other.timeOfAction &&
        periodOfAction == other.periodOfAction &&
        actionID == other.actionID &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc(0, actionableFencer.hashCode),
                            scoreLeft.hashCode),
                        scoreRight.hashCode),
                    timeOfAction.hashCode),
                periodOfAction.hashCode),
            actionID.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MatchEventStruct')
          ..add('actionableFencer', actionableFencer)
          ..add('scoreLeft', scoreLeft)
          ..add('scoreRight', scoreRight)
          ..add('timeOfAction', timeOfAction)
          ..add('periodOfAction', periodOfAction)
          ..add('actionID', actionID)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class MatchEventStructBuilder
    implements Builder<MatchEventStruct, MatchEventStructBuilder> {
  _$MatchEventStruct? _$v;

  DocumentReference<Object?>? _actionableFencer;
  DocumentReference<Object?>? get actionableFencer => _$this._actionableFencer;
  set actionableFencer(DocumentReference<Object?>? actionableFencer) =>
      _$this._actionableFencer = actionableFencer;

  int? _scoreLeft;
  int? get scoreLeft => _$this._scoreLeft;
  set scoreLeft(int? scoreLeft) => _$this._scoreLeft = scoreLeft;

  int? _scoreRight;
  int? get scoreRight => _$this._scoreRight;
  set scoreRight(int? scoreRight) => _$this._scoreRight = scoreRight;

  int? _timeOfAction;
  int? get timeOfAction => _$this._timeOfAction;
  set timeOfAction(int? timeOfAction) => _$this._timeOfAction = timeOfAction;

  int? _periodOfAction;
  int? get periodOfAction => _$this._periodOfAction;
  set periodOfAction(int? periodOfAction) =>
      _$this._periodOfAction = periodOfAction;

  int? _actionID;
  int? get actionID => _$this._actionID;
  set actionID(int? actionID) => _$this._actionID = actionID;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  MatchEventStructBuilder() {
    MatchEventStruct._initializeBuilder(this);
  }

  MatchEventStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _actionableFencer = $v.actionableFencer;
      _scoreLeft = $v.scoreLeft;
      _scoreRight = $v.scoreRight;
      _timeOfAction = $v.timeOfAction;
      _periodOfAction = $v.periodOfAction;
      _actionID = $v.actionID;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MatchEventStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MatchEventStruct;
  }

  @override
  void update(void Function(MatchEventStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MatchEventStruct build() => _build();

  _$MatchEventStruct _build() {
    final _$result = _$v ??
        new _$MatchEventStruct._(
            actionableFencer: actionableFencer,
            scoreLeft: scoreLeft,
            scoreRight: scoreRight,
            timeOfAction: timeOfAction,
            periodOfAction: periodOfAction,
            actionID: actionID,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'MatchEventStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
