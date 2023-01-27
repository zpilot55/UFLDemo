// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchstatslog_dev_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MatchstatslogDevRecord> _$matchstatslogDevRecordSerializer =
    new _$MatchstatslogDevRecordSerializer();

class _$MatchstatslogDevRecordSerializer
    implements StructuredSerializer<MatchstatslogDevRecord> {
  @override
  final Iterable<Type> types = const [
    MatchstatslogDevRecord,
    _$MatchstatslogDevRecord
  ];
  @override
  final String wireName = 'MatchstatslogDevRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, MatchstatslogDevRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.matchStats;
    if (value != null) {
      result
        ..add('MatchStats')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(MatchStatSnapshotStruct)])));
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
  MatchstatslogDevRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MatchstatslogDevRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'MatchStats':
          result.matchStats.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(MatchStatSnapshotStruct)
              ]))! as BuiltList<Object?>);
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

class _$MatchstatslogDevRecord extends MatchstatslogDevRecord {
  @override
  final BuiltList<MatchStatSnapshotStruct>? matchStats;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MatchstatslogDevRecord(
          [void Function(MatchstatslogDevRecordBuilder)? updates]) =>
      (new MatchstatslogDevRecordBuilder()..update(updates))._build();

  _$MatchstatslogDevRecord._({this.matchStats, this.ffRef}) : super._();

  @override
  MatchstatslogDevRecord rebuild(
          void Function(MatchstatslogDevRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MatchstatslogDevRecordBuilder toBuilder() =>
      new MatchstatslogDevRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MatchstatslogDevRecord &&
        matchStats == other.matchStats &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, matchStats.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MatchstatslogDevRecord')
          ..add('matchStats', matchStats)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MatchstatslogDevRecordBuilder
    implements Builder<MatchstatslogDevRecord, MatchstatslogDevRecordBuilder> {
  _$MatchstatslogDevRecord? _$v;

  ListBuilder<MatchStatSnapshotStruct>? _matchStats;
  ListBuilder<MatchStatSnapshotStruct> get matchStats =>
      _$this._matchStats ??= new ListBuilder<MatchStatSnapshotStruct>();
  set matchStats(ListBuilder<MatchStatSnapshotStruct>? matchStats) =>
      _$this._matchStats = matchStats;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MatchstatslogDevRecordBuilder() {
    MatchstatslogDevRecord._initializeBuilder(this);
  }

  MatchstatslogDevRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _matchStats = $v.matchStats?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MatchstatslogDevRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MatchstatslogDevRecord;
  }

  @override
  void update(void Function(MatchstatslogDevRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MatchstatslogDevRecord build() => _build();

  _$MatchstatslogDevRecord _build() {
    _$MatchstatslogDevRecord _$result;
    try {
      _$result = _$v ??
          new _$MatchstatslogDevRecord._(
              matchStats: _matchStats?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'matchStats';
        _matchStats?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MatchstatslogDevRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
