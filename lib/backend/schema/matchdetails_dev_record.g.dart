// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchdetails_dev_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MatchdetailsDevRecord> _$matchdetailsDevRecordSerializer =
    new _$MatchdetailsDevRecordSerializer();

class _$MatchdetailsDevRecordSerializer
    implements StructuredSerializer<MatchdetailsDevRecord> {
  @override
  final Iterable<Type> types = const [
    MatchdetailsDevRecord,
    _$MatchdetailsDevRecord
  ];
  @override
  final String wireName = 'MatchdetailsDevRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, MatchdetailsDevRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'OverallStats',
      serializers.serialize(object.overallStats,
          specifiedType: const FullType(PeriodStatsStruct)),
    ];
    Object? value;
    value = object.matchEvents;
    if (value != null) {
      result
        ..add('MatchEvents')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(MatchEventStruct)])));
    }
    value = object.periodStats;
    if (value != null) {
      result
        ..add('PeriodStats')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(PeriodStatsStruct)])));
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
  MatchdetailsDevRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MatchdetailsDevRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'MatchEvents':
          result.matchEvents.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MatchEventStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'OverallStats':
          result.overallStats.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PeriodStatsStruct))!
              as PeriodStatsStruct);
          break;
        case 'PeriodStats':
          result.periodStats.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PeriodStatsStruct)]))!
              as BuiltList<Object?>);
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

class _$MatchdetailsDevRecord extends MatchdetailsDevRecord {
  @override
  final BuiltList<MatchEventStruct>? matchEvents;
  @override
  final PeriodStatsStruct overallStats;
  @override
  final BuiltList<PeriodStatsStruct>? periodStats;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MatchdetailsDevRecord(
          [void Function(MatchdetailsDevRecordBuilder)? updates]) =>
      (new MatchdetailsDevRecordBuilder()..update(updates))._build();

  _$MatchdetailsDevRecord._(
      {this.matchEvents,
      required this.overallStats,
      this.periodStats,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        overallStats, r'MatchdetailsDevRecord', 'overallStats');
  }

  @override
  MatchdetailsDevRecord rebuild(
          void Function(MatchdetailsDevRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MatchdetailsDevRecordBuilder toBuilder() =>
      new MatchdetailsDevRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MatchdetailsDevRecord &&
        matchEvents == other.matchEvents &&
        overallStats == other.overallStats &&
        periodStats == other.periodStats &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, matchEvents.hashCode), overallStats.hashCode),
            periodStats.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MatchdetailsDevRecord')
          ..add('matchEvents', matchEvents)
          ..add('overallStats', overallStats)
          ..add('periodStats', periodStats)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MatchdetailsDevRecordBuilder
    implements Builder<MatchdetailsDevRecord, MatchdetailsDevRecordBuilder> {
  _$MatchdetailsDevRecord? _$v;

  ListBuilder<MatchEventStruct>? _matchEvents;
  ListBuilder<MatchEventStruct> get matchEvents =>
      _$this._matchEvents ??= new ListBuilder<MatchEventStruct>();
  set matchEvents(ListBuilder<MatchEventStruct>? matchEvents) =>
      _$this._matchEvents = matchEvents;

  PeriodStatsStructBuilder? _overallStats;
  PeriodStatsStructBuilder get overallStats =>
      _$this._overallStats ??= new PeriodStatsStructBuilder();
  set overallStats(PeriodStatsStructBuilder? overallStats) =>
      _$this._overallStats = overallStats;

  ListBuilder<PeriodStatsStruct>? _periodStats;
  ListBuilder<PeriodStatsStruct> get periodStats =>
      _$this._periodStats ??= new ListBuilder<PeriodStatsStruct>();
  set periodStats(ListBuilder<PeriodStatsStruct>? periodStats) =>
      _$this._periodStats = periodStats;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MatchdetailsDevRecordBuilder() {
    MatchdetailsDevRecord._initializeBuilder(this);
  }

  MatchdetailsDevRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _matchEvents = $v.matchEvents?.toBuilder();
      _overallStats = $v.overallStats.toBuilder();
      _periodStats = $v.periodStats?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MatchdetailsDevRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MatchdetailsDevRecord;
  }

  @override
  void update(void Function(MatchdetailsDevRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MatchdetailsDevRecord build() => _build();

  _$MatchdetailsDevRecord _build() {
    _$MatchdetailsDevRecord _$result;
    try {
      _$result = _$v ??
          new _$MatchdetailsDevRecord._(
              matchEvents: _matchEvents?.build(),
              overallStats: overallStats.build(),
              periodStats: _periodStats?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'matchEvents';
        _matchEvents?.build();
        _$failedField = 'overallStats';
        overallStats.build();
        _$failedField = 'periodStats';
        _periodStats?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MatchdetailsDevRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
