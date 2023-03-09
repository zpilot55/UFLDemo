// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_struct_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RankingStructStruct> _$rankingStructStructSerializer =
    new _$RankingStructStructSerializer();

class _$RankingStructStructSerializer
    implements StructuredSerializer<RankingStructStruct> {
  @override
  final Iterable<Type> types = const [
    RankingStructStruct,
    _$RankingStructStruct
  ];
  @override
  final String wireName = 'RankingStructStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, RankingStructStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.fencer;
    if (value != null) {
      result
        ..add('fencer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.eloFA;
    if (value != null) {
      result
        ..add('elo_FA')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.eloFY;
    if (value != null) {
      result
        ..add('elo_FY')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.eloEA;
    if (value != null) {
      result
        ..add('elo_EA')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.eloEY;
    if (value != null) {
      result
        ..add('elo_EY')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.eloSA;
    if (value != null) {
      result
        ..add('elo_SA')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.eloSY;
    if (value != null) {
      result
        ..add('elo_SY')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.eloNA;
    if (value != null) {
      result
        ..add('elo_NA')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.eloNY;
    if (value != null) {
      result
        ..add('elo_NY')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  RankingStructStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RankingStructStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'fencer':
          result.fencer = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'elo_FA':
          result.eloFA = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'elo_FY':
          result.eloFY = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'elo_EA':
          result.eloEA = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'elo_EY':
          result.eloEY = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'elo_SA':
          result.eloSA = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'elo_SY':
          result.eloSY = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'elo_NA':
          result.eloNA = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'elo_NY':
          result.eloNY = serializers.deserialize(value,
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

class _$RankingStructStruct extends RankingStructStruct {
  @override
  final DocumentReference<Object?>? fencer;
  @override
  final int? eloFA;
  @override
  final int? eloFY;
  @override
  final int? eloEA;
  @override
  final int? eloEY;
  @override
  final int? eloSA;
  @override
  final int? eloSY;
  @override
  final int? eloNA;
  @override
  final int? eloNY;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$RankingStructStruct(
          [void Function(RankingStructStructBuilder)? updates]) =>
      (new RankingStructStructBuilder()..update(updates))._build();

  _$RankingStructStruct._(
      {this.fencer,
      this.eloFA,
      this.eloFY,
      this.eloEA,
      this.eloEY,
      this.eloSA,
      this.eloSY,
      this.eloNA,
      this.eloNY,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'RankingStructStruct', 'firestoreUtilData');
  }

  @override
  RankingStructStruct rebuild(
          void Function(RankingStructStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RankingStructStructBuilder toBuilder() =>
      new RankingStructStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RankingStructStruct &&
        fencer == other.fencer &&
        eloFA == other.eloFA &&
        eloFY == other.eloFY &&
        eloEA == other.eloEA &&
        eloEY == other.eloEY &&
        eloSA == other.eloSA &&
        eloSY == other.eloSY &&
        eloNA == other.eloNA &&
        eloNY == other.eloNY &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, fencer.hashCode),
                                        eloFA.hashCode),
                                    eloFY.hashCode),
                                eloEA.hashCode),
                            eloEY.hashCode),
                        eloSA.hashCode),
                    eloSY.hashCode),
                eloNA.hashCode),
            eloNY.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RankingStructStruct')
          ..add('fencer', fencer)
          ..add('eloFA', eloFA)
          ..add('eloFY', eloFY)
          ..add('eloEA', eloEA)
          ..add('eloEY', eloEY)
          ..add('eloSA', eloSA)
          ..add('eloSY', eloSY)
          ..add('eloNA', eloNA)
          ..add('eloNY', eloNY)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class RankingStructStructBuilder
    implements Builder<RankingStructStruct, RankingStructStructBuilder> {
  _$RankingStructStruct? _$v;

  DocumentReference<Object?>? _fencer;
  DocumentReference<Object?>? get fencer => _$this._fencer;
  set fencer(DocumentReference<Object?>? fencer) => _$this._fencer = fencer;

  int? _eloFA;
  int? get eloFA => _$this._eloFA;
  set eloFA(int? eloFA) => _$this._eloFA = eloFA;

  int? _eloFY;
  int? get eloFY => _$this._eloFY;
  set eloFY(int? eloFY) => _$this._eloFY = eloFY;

  int? _eloEA;
  int? get eloEA => _$this._eloEA;
  set eloEA(int? eloEA) => _$this._eloEA = eloEA;

  int? _eloEY;
  int? get eloEY => _$this._eloEY;
  set eloEY(int? eloEY) => _$this._eloEY = eloEY;

  int? _eloSA;
  int? get eloSA => _$this._eloSA;
  set eloSA(int? eloSA) => _$this._eloSA = eloSA;

  int? _eloSY;
  int? get eloSY => _$this._eloSY;
  set eloSY(int? eloSY) => _$this._eloSY = eloSY;

  int? _eloNA;
  int? get eloNA => _$this._eloNA;
  set eloNA(int? eloNA) => _$this._eloNA = eloNA;

  int? _eloNY;
  int? get eloNY => _$this._eloNY;
  set eloNY(int? eloNY) => _$this._eloNY = eloNY;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  RankingStructStructBuilder() {
    RankingStructStruct._initializeBuilder(this);
  }

  RankingStructStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fencer = $v.fencer;
      _eloFA = $v.eloFA;
      _eloFY = $v.eloFY;
      _eloEA = $v.eloEA;
      _eloEY = $v.eloEY;
      _eloSA = $v.eloSA;
      _eloSY = $v.eloSY;
      _eloNA = $v.eloNA;
      _eloNY = $v.eloNY;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RankingStructStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RankingStructStruct;
  }

  @override
  void update(void Function(RankingStructStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RankingStructStruct build() => _build();

  _$RankingStructStruct _build() {
    final _$result = _$v ??
        new _$RankingStructStruct._(
            fencer: fencer,
            eloFA: eloFA,
            eloFY: eloFY,
            eloEA: eloEA,
            eloEY: eloEY,
            eloSA: eloSA,
            eloSY: eloSY,
            eloNA: eloNA,
            eloNY: eloNY,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'RankingStructStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
