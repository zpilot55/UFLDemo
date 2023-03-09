// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rankings_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RankingsRecord> _$rankingsRecordSerializer =
    new _$RankingsRecordSerializer();

class _$RankingsRecordSerializer
    implements StructuredSerializer<RankingsRecord> {
  @override
  final Iterable<Type> types = const [RankingsRecord, _$RankingsRecord];
  @override
  final String wireName = 'RankingsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RankingsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'fencerRankings',
      serializers.serialize(object.fencerRankings,
          specifiedType: const FullType(RankingStructStruct)),
    ];
    Object? value;
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
  RankingsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RankingsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'fencerRankings':
          result.fencerRankings.replace(serializers.deserialize(value,
                  specifiedType: const FullType(RankingStructStruct))!
              as RankingStructStruct);
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

class _$RankingsRecord extends RankingsRecord {
  @override
  final RankingStructStruct fencerRankings;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RankingsRecord([void Function(RankingsRecordBuilder)? updates]) =>
      (new RankingsRecordBuilder()..update(updates))._build();

  _$RankingsRecord._({required this.fencerRankings, this.ffRef}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        fencerRankings, r'RankingsRecord', 'fencerRankings');
  }

  @override
  RankingsRecord rebuild(void Function(RankingsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RankingsRecordBuilder toBuilder() =>
      new RankingsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RankingsRecord &&
        fencerRankings == other.fencerRankings &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, fencerRankings.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RankingsRecord')
          ..add('fencerRankings', fencerRankings)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RankingsRecordBuilder
    implements Builder<RankingsRecord, RankingsRecordBuilder> {
  _$RankingsRecord? _$v;

  RankingStructStructBuilder? _fencerRankings;
  RankingStructStructBuilder get fencerRankings =>
      _$this._fencerRankings ??= new RankingStructStructBuilder();
  set fencerRankings(RankingStructStructBuilder? fencerRankings) =>
      _$this._fencerRankings = fencerRankings;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RankingsRecordBuilder() {
    RankingsRecord._initializeBuilder(this);
  }

  RankingsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fencerRankings = $v.fencerRankings.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RankingsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RankingsRecord;
  }

  @override
  void update(void Function(RankingsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RankingsRecord build() => _build();

  _$RankingsRecord _build() {
    _$RankingsRecord _$result;
    try {
      _$result = _$v ??
          new _$RankingsRecord._(
              fencerRankings: fencerRankings.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'fencerRankings';
        fencerRankings.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RankingsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
