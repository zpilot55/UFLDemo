// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_statistics_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MatchStatisticsStruct> _$matchStatisticsStructSerializer =
    new _$MatchStatisticsStructSerializer();

class _$MatchStatisticsStructSerializer
    implements StructuredSerializer<MatchStatisticsStruct> {
  @override
  final Iterable<Type> types = const [
    MatchStatisticsStruct,
    _$MatchStatisticsStruct
  ];
  @override
  final String wireName = 'MatchStatisticsStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, MatchStatisticsStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.p1pointsL;
    if (value != null) {
      result
        ..add('p1points_L')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.p1pointsR;
    if (value != null) {
      result
        ..add('p1points_R')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.p2pointsL;
    if (value != null) {
      result
        ..add('p2points_L')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.p2pointsR;
    if (value != null) {
      result
        ..add('p2points_R')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.p3pointsL;
    if (value != null) {
      result
        ..add('p3points_L')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.p3pointsR;
    if (value != null) {
      result
        ..add('p3points_R')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.actionPerL;
    if (value != null) {
      result
        ..add('ActionPer_L')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.actionPerR;
    if (value != null) {
      result
        ..add('ActionPer_R')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.hOTRatioL;
    if (value != null) {
      result
        ..add('HOTRatio_L')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.hOTRatioR;
    if (value != null) {
      result
        ..add('HOTRatio_R')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.rOWRatioL;
    if (value != null) {
      result
        ..add('ROWRatio_L')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.rOWRatioR;
    if (value != null) {
      result
        ..add('ROWRatio_R')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.sIMULPer;
    if (value != null) {
      result
        ..add('SIMULPer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.aggroRatioL;
    if (value != null) {
      result
        ..add('AggroRatio_L')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.aggroRatioR;
    if (value != null) {
      result
        ..add('AggroRatio_R')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.numRedL;
    if (value != null) {
      result
        ..add('numRed_L')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numRedR;
    if (value != null) {
      result
        ..add('numRed_R')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numYellowL;
    if (value != null) {
      result
        ..add('numYellow_L')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numYellowR;
    if (value != null) {
      result
        ..add('numYellow_R')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  MatchStatisticsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MatchStatisticsStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'p1points_L':
          result.p1pointsL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'p1points_R':
          result.p1pointsR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'p2points_L':
          result.p2pointsL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'p2points_R':
          result.p2pointsR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'p3points_L':
          result.p3pointsL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'p3points_R':
          result.p3pointsR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'ActionPer_L':
          result.actionPerL = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'ActionPer_R':
          result.actionPerR = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'HOTRatio_L':
          result.hOTRatioL = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'HOTRatio_R':
          result.hOTRatioR = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'ROWRatio_L':
          result.rOWRatioL = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'ROWRatio_R':
          result.rOWRatioR = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'SIMULPer':
          result.sIMULPer = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'AggroRatio_L':
          result.aggroRatioL = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'AggroRatio_R':
          result.aggroRatioR = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'numRed_L':
          result.numRedL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'numRed_R':
          result.numRedR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'numYellow_L':
          result.numYellowL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'numYellow_R':
          result.numYellowR = serializers.deserialize(value,
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

class _$MatchStatisticsStruct extends MatchStatisticsStruct {
  @override
  final int? p1pointsL;
  @override
  final int? p1pointsR;
  @override
  final int? p2pointsL;
  @override
  final int? p2pointsR;
  @override
  final int? p3pointsL;
  @override
  final int? p3pointsR;
  @override
  final double? actionPerL;
  @override
  final double? actionPerR;
  @override
  final double? hOTRatioL;
  @override
  final double? hOTRatioR;
  @override
  final double? rOWRatioL;
  @override
  final double? rOWRatioR;
  @override
  final double? sIMULPer;
  @override
  final double? aggroRatioL;
  @override
  final double? aggroRatioR;
  @override
  final int? numRedL;
  @override
  final int? numRedR;
  @override
  final int? numYellowL;
  @override
  final int? numYellowR;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$MatchStatisticsStruct(
          [void Function(MatchStatisticsStructBuilder)? updates]) =>
      (new MatchStatisticsStructBuilder()..update(updates))._build();

  _$MatchStatisticsStruct._(
      {this.p1pointsL,
      this.p1pointsR,
      this.p2pointsL,
      this.p2pointsR,
      this.p3pointsL,
      this.p3pointsR,
      this.actionPerL,
      this.actionPerR,
      this.hOTRatioL,
      this.hOTRatioR,
      this.rOWRatioL,
      this.rOWRatioR,
      this.sIMULPer,
      this.aggroRatioL,
      this.aggroRatioR,
      this.numRedL,
      this.numRedR,
      this.numYellowL,
      this.numYellowR,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'MatchStatisticsStruct', 'firestoreUtilData');
  }

  @override
  MatchStatisticsStruct rebuild(
          void Function(MatchStatisticsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MatchStatisticsStructBuilder toBuilder() =>
      new MatchStatisticsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MatchStatisticsStruct &&
        p1pointsL == other.p1pointsL &&
        p1pointsR == other.p1pointsR &&
        p2pointsL == other.p2pointsL &&
        p2pointsR == other.p2pointsR &&
        p3pointsL == other.p3pointsL &&
        p3pointsR == other.p3pointsR &&
        actionPerL == other.actionPerL &&
        actionPerR == other.actionPerR &&
        hOTRatioL == other.hOTRatioL &&
        hOTRatioR == other.hOTRatioR &&
        rOWRatioL == other.rOWRatioL &&
        rOWRatioR == other.rOWRatioR &&
        sIMULPer == other.sIMULPer &&
        aggroRatioL == other.aggroRatioL &&
        aggroRatioR == other.aggroRatioR &&
        numRedL == other.numRedL &&
        numRedR == other.numRedR &&
        numYellowL == other.numYellowL &&
        numYellowR == other.numYellowR &&
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
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc(0, p1pointsL.hashCode),
                                                                                p1pointsR.hashCode),
                                                                            p2pointsL.hashCode),
                                                                        p2pointsR.hashCode),
                                                                    p3pointsL.hashCode),
                                                                p3pointsR.hashCode),
                                                            actionPerL.hashCode),
                                                        actionPerR.hashCode),
                                                    hOTRatioL.hashCode),
                                                hOTRatioR.hashCode),
                                            rOWRatioL.hashCode),
                                        rOWRatioR.hashCode),
                                    sIMULPer.hashCode),
                                aggroRatioL.hashCode),
                            aggroRatioR.hashCode),
                        numRedL.hashCode),
                    numRedR.hashCode),
                numYellowL.hashCode),
            numYellowR.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MatchStatisticsStruct')
          ..add('p1pointsL', p1pointsL)
          ..add('p1pointsR', p1pointsR)
          ..add('p2pointsL', p2pointsL)
          ..add('p2pointsR', p2pointsR)
          ..add('p3pointsL', p3pointsL)
          ..add('p3pointsR', p3pointsR)
          ..add('actionPerL', actionPerL)
          ..add('actionPerR', actionPerR)
          ..add('hOTRatioL', hOTRatioL)
          ..add('hOTRatioR', hOTRatioR)
          ..add('rOWRatioL', rOWRatioL)
          ..add('rOWRatioR', rOWRatioR)
          ..add('sIMULPer', sIMULPer)
          ..add('aggroRatioL', aggroRatioL)
          ..add('aggroRatioR', aggroRatioR)
          ..add('numRedL', numRedL)
          ..add('numRedR', numRedR)
          ..add('numYellowL', numYellowL)
          ..add('numYellowR', numYellowR)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class MatchStatisticsStructBuilder
    implements Builder<MatchStatisticsStruct, MatchStatisticsStructBuilder> {
  _$MatchStatisticsStruct? _$v;

  int? _p1pointsL;
  int? get p1pointsL => _$this._p1pointsL;
  set p1pointsL(int? p1pointsL) => _$this._p1pointsL = p1pointsL;

  int? _p1pointsR;
  int? get p1pointsR => _$this._p1pointsR;
  set p1pointsR(int? p1pointsR) => _$this._p1pointsR = p1pointsR;

  int? _p2pointsL;
  int? get p2pointsL => _$this._p2pointsL;
  set p2pointsL(int? p2pointsL) => _$this._p2pointsL = p2pointsL;

  int? _p2pointsR;
  int? get p2pointsR => _$this._p2pointsR;
  set p2pointsR(int? p2pointsR) => _$this._p2pointsR = p2pointsR;

  int? _p3pointsL;
  int? get p3pointsL => _$this._p3pointsL;
  set p3pointsL(int? p3pointsL) => _$this._p3pointsL = p3pointsL;

  int? _p3pointsR;
  int? get p3pointsR => _$this._p3pointsR;
  set p3pointsR(int? p3pointsR) => _$this._p3pointsR = p3pointsR;

  double? _actionPerL;
  double? get actionPerL => _$this._actionPerL;
  set actionPerL(double? actionPerL) => _$this._actionPerL = actionPerL;

  double? _actionPerR;
  double? get actionPerR => _$this._actionPerR;
  set actionPerR(double? actionPerR) => _$this._actionPerR = actionPerR;

  double? _hOTRatioL;
  double? get hOTRatioL => _$this._hOTRatioL;
  set hOTRatioL(double? hOTRatioL) => _$this._hOTRatioL = hOTRatioL;

  double? _hOTRatioR;
  double? get hOTRatioR => _$this._hOTRatioR;
  set hOTRatioR(double? hOTRatioR) => _$this._hOTRatioR = hOTRatioR;

  double? _rOWRatioL;
  double? get rOWRatioL => _$this._rOWRatioL;
  set rOWRatioL(double? rOWRatioL) => _$this._rOWRatioL = rOWRatioL;

  double? _rOWRatioR;
  double? get rOWRatioR => _$this._rOWRatioR;
  set rOWRatioR(double? rOWRatioR) => _$this._rOWRatioR = rOWRatioR;

  double? _sIMULPer;
  double? get sIMULPer => _$this._sIMULPer;
  set sIMULPer(double? sIMULPer) => _$this._sIMULPer = sIMULPer;

  double? _aggroRatioL;
  double? get aggroRatioL => _$this._aggroRatioL;
  set aggroRatioL(double? aggroRatioL) => _$this._aggroRatioL = aggroRatioL;

  double? _aggroRatioR;
  double? get aggroRatioR => _$this._aggroRatioR;
  set aggroRatioR(double? aggroRatioR) => _$this._aggroRatioR = aggroRatioR;

  int? _numRedL;
  int? get numRedL => _$this._numRedL;
  set numRedL(int? numRedL) => _$this._numRedL = numRedL;

  int? _numRedR;
  int? get numRedR => _$this._numRedR;
  set numRedR(int? numRedR) => _$this._numRedR = numRedR;

  int? _numYellowL;
  int? get numYellowL => _$this._numYellowL;
  set numYellowL(int? numYellowL) => _$this._numYellowL = numYellowL;

  int? _numYellowR;
  int? get numYellowR => _$this._numYellowR;
  set numYellowR(int? numYellowR) => _$this._numYellowR = numYellowR;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  MatchStatisticsStructBuilder() {
    MatchStatisticsStruct._initializeBuilder(this);
  }

  MatchStatisticsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _p1pointsL = $v.p1pointsL;
      _p1pointsR = $v.p1pointsR;
      _p2pointsL = $v.p2pointsL;
      _p2pointsR = $v.p2pointsR;
      _p3pointsL = $v.p3pointsL;
      _p3pointsR = $v.p3pointsR;
      _actionPerL = $v.actionPerL;
      _actionPerR = $v.actionPerR;
      _hOTRatioL = $v.hOTRatioL;
      _hOTRatioR = $v.hOTRatioR;
      _rOWRatioL = $v.rOWRatioL;
      _rOWRatioR = $v.rOWRatioR;
      _sIMULPer = $v.sIMULPer;
      _aggroRatioL = $v.aggroRatioL;
      _aggroRatioR = $v.aggroRatioR;
      _numRedL = $v.numRedL;
      _numRedR = $v.numRedR;
      _numYellowL = $v.numYellowL;
      _numYellowR = $v.numYellowR;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MatchStatisticsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MatchStatisticsStruct;
  }

  @override
  void update(void Function(MatchStatisticsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MatchStatisticsStruct build() => _build();

  _$MatchStatisticsStruct _build() {
    final _$result = _$v ??
        new _$MatchStatisticsStruct._(
            p1pointsL: p1pointsL,
            p1pointsR: p1pointsR,
            p2pointsL: p2pointsL,
            p2pointsR: p2pointsR,
            p3pointsL: p3pointsL,
            p3pointsR: p3pointsR,
            actionPerL: actionPerL,
            actionPerR: actionPerR,
            hOTRatioL: hOTRatioL,
            hOTRatioR: hOTRatioR,
            rOWRatioL: rOWRatioL,
            rOWRatioR: rOWRatioR,
            sIMULPer: sIMULPer,
            aggroRatioL: aggroRatioL,
            aggroRatioR: aggroRatioR,
            numRedL: numRedL,
            numRedR: numRedR,
            numYellowL: numYellowL,
            numYellowR: numYellowR,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'MatchStatisticsStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
