// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_stats_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PeriodStatsStruct> _$periodStatsStructSerializer =
    new _$PeriodStatsStructSerializer();

class _$PeriodStatsStructSerializer
    implements StructuredSerializer<PeriodStatsStruct> {
  @override
  final Iterable<Type> types = const [PeriodStatsStruct, _$PeriodStatsStruct];
  @override
  final String wireName = 'PeriodStatsStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, PeriodStatsStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.pointsL;
    if (value != null) {
      result
        ..add('PointsL')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pointsR;
    if (value != null) {
      result
        ..add('PointsR')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.yellowCardsL;
    if (value != null) {
      result
        ..add('YellowCardsL')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.yellowCardsR;
    if (value != null) {
      result
        ..add('YellowCardsR')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.redCardsL;
    if (value != null) {
      result
        ..add('RedCardsL')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.redCardsR;
    if (value != null) {
      result
        ..add('RedCardsR')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.simultaneous;
    if (value != null) {
      result
        ..add('Simultaneous')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.haltsRef;
    if (value != null) {
      result
        ..add('HaltsRef')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.haltsL;
    if (value != null) {
      result
        ..add('HaltsL')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.haltsR;
    if (value != null) {
      result
        ..add('HaltsR')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.simpleAttackHitsL;
    if (value != null) {
      result
        ..add('SimpleAttackHitsL')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.simpleAttackHitsR;
    if (value != null) {
      result
        ..add('SimpleAttackHitsR')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.simpleAttackOffTarL;
    if (value != null) {
      result
        ..add('SimpleAttackOffTarL')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.simpleAttackOffTarR;
    if (value != null) {
      result
        ..add('SimpleAttackOffTarR')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.compoundAttackHitsL;
    if (value != null) {
      result
        ..add('CompoundAttackHitsL')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.compoundAttackHitsR;
    if (value != null) {
      result
        ..add('CompoundAttackHitsR')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.compoundAttackOffTarL;
    if (value != null) {
      result
        ..add('CompoundAttackOffTarL')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.compoundAttackOffTarR;
    if (value != null) {
      result
        ..add('CompoundAttackOffTarR')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.parryRiposteHitsL;
    if (value != null) {
      result
        ..add('ParryRiposteHitsL')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.parryRiposteHitsR;
    if (value != null) {
      result
        ..add('ParryRiposteHitsR')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.parryRiposteOffTargetL;
    if (value != null) {
      result
        ..add('ParryRiposteOffTargetL')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.parryRiposteOffTargetR;
    if (value != null) {
      result
        ..add('ParryRiposteOffTargetR')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.remiseHitsL;
    if (value != null) {
      result
        ..add('RemiseHitsL')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.remiseHitsR;
    if (value != null) {
      result
        ..add('RemiseHitsR')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.remiseOffTarL;
    if (value != null) {
      result
        ..add('RemiseOffTarL')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.remiseOffTarR;
    if (value != null) {
      result
        ..add('RemiseOffTarR')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.counterattackHitsL;
    if (value != null) {
      result
        ..add('CounterattackHitsL')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.counterattackHitsR;
    if (value != null) {
      result
        ..add('CounterattackHitsR')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.counterattackOffTarL;
    if (value != null) {
      result
        ..add('CounterattackOffTarL')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.counterattackOffTarR;
    if (value != null) {
      result
        ..add('CounterattackOffTarR')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pointInLineHitsL;
    if (value != null) {
      result
        ..add('PointInLineHitsL')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pointInLineHitsR;
    if (value != null) {
      result
        ..add('PointInLineHitsR')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pointInLineOffTarL;
    if (value != null) {
      result
        ..add('PointInLineOffTarL')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pointInLineOffTarR;
    if (value != null) {
      result
        ..add('PointInLineOffTarR')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  PeriodStatsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PeriodStatsStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'PointsL':
          result.pointsL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'PointsR':
          result.pointsR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'YellowCardsL':
          result.yellowCardsL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'YellowCardsR':
          result.yellowCardsR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'RedCardsL':
          result.redCardsL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'RedCardsR':
          result.redCardsR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'Simultaneous':
          result.simultaneous = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'HaltsRef':
          result.haltsRef = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'HaltsL':
          result.haltsL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'HaltsR':
          result.haltsR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'SimpleAttackHitsL':
          result.simpleAttackHitsL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'SimpleAttackHitsR':
          result.simpleAttackHitsR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'SimpleAttackOffTarL':
          result.simpleAttackOffTarL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'SimpleAttackOffTarR':
          result.simpleAttackOffTarR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'CompoundAttackHitsL':
          result.compoundAttackHitsL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'CompoundAttackHitsR':
          result.compoundAttackHitsR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'CompoundAttackOffTarL':
          result.compoundAttackOffTarL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'CompoundAttackOffTarR':
          result.compoundAttackOffTarR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'ParryRiposteHitsL':
          result.parryRiposteHitsL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'ParryRiposteHitsR':
          result.parryRiposteHitsR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'ParryRiposteOffTargetL':
          result.parryRiposteOffTargetL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'ParryRiposteOffTargetR':
          result.parryRiposteOffTargetR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'RemiseHitsL':
          result.remiseHitsL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'RemiseHitsR':
          result.remiseHitsR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'RemiseOffTarL':
          result.remiseOffTarL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'RemiseOffTarR':
          result.remiseOffTarR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'CounterattackHitsL':
          result.counterattackHitsL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'CounterattackHitsR':
          result.counterattackHitsR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'CounterattackOffTarL':
          result.counterattackOffTarL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'CounterattackOffTarR':
          result.counterattackOffTarR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'PointInLineHitsL':
          result.pointInLineHitsL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'PointInLineHitsR':
          result.pointInLineHitsR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'PointInLineOffTarL':
          result.pointInLineOffTarL = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'PointInLineOffTarR':
          result.pointInLineOffTarR = serializers.deserialize(value,
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

class _$PeriodStatsStruct extends PeriodStatsStruct {
  @override
  final int? pointsL;
  @override
  final int? pointsR;
  @override
  final int? yellowCardsL;
  @override
  final int? yellowCardsR;
  @override
  final int? redCardsL;
  @override
  final int? redCardsR;
  @override
  final int? simultaneous;
  @override
  final int? haltsRef;
  @override
  final int? haltsL;
  @override
  final int? haltsR;
  @override
  final int? simpleAttackHitsL;
  @override
  final int? simpleAttackHitsR;
  @override
  final int? simpleAttackOffTarL;
  @override
  final int? simpleAttackOffTarR;
  @override
  final int? compoundAttackHitsL;
  @override
  final int? compoundAttackHitsR;
  @override
  final int? compoundAttackOffTarL;
  @override
  final int? compoundAttackOffTarR;
  @override
  final int? parryRiposteHitsL;
  @override
  final int? parryRiposteHitsR;
  @override
  final int? parryRiposteOffTargetL;
  @override
  final int? parryRiposteOffTargetR;
  @override
  final int? remiseHitsL;
  @override
  final int? remiseHitsR;
  @override
  final int? remiseOffTarL;
  @override
  final int? remiseOffTarR;
  @override
  final int? counterattackHitsL;
  @override
  final int? counterattackHitsR;
  @override
  final int? counterattackOffTarL;
  @override
  final int? counterattackOffTarR;
  @override
  final int? pointInLineHitsL;
  @override
  final int? pointInLineHitsR;
  @override
  final int? pointInLineOffTarL;
  @override
  final int? pointInLineOffTarR;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$PeriodStatsStruct(
          [void Function(PeriodStatsStructBuilder)? updates]) =>
      (new PeriodStatsStructBuilder()..update(updates))._build();

  _$PeriodStatsStruct._(
      {this.pointsL,
      this.pointsR,
      this.yellowCardsL,
      this.yellowCardsR,
      this.redCardsL,
      this.redCardsR,
      this.simultaneous,
      this.haltsRef,
      this.haltsL,
      this.haltsR,
      this.simpleAttackHitsL,
      this.simpleAttackHitsR,
      this.simpleAttackOffTarL,
      this.simpleAttackOffTarR,
      this.compoundAttackHitsL,
      this.compoundAttackHitsR,
      this.compoundAttackOffTarL,
      this.compoundAttackOffTarR,
      this.parryRiposteHitsL,
      this.parryRiposteHitsR,
      this.parryRiposteOffTargetL,
      this.parryRiposteOffTargetR,
      this.remiseHitsL,
      this.remiseHitsR,
      this.remiseOffTarL,
      this.remiseOffTarR,
      this.counterattackHitsL,
      this.counterattackHitsR,
      this.counterattackOffTarL,
      this.counterattackOffTarR,
      this.pointInLineHitsL,
      this.pointInLineHitsR,
      this.pointInLineOffTarL,
      this.pointInLineOffTarR,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'PeriodStatsStruct', 'firestoreUtilData');
  }

  @override
  PeriodStatsStruct rebuild(void Function(PeriodStatsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PeriodStatsStructBuilder toBuilder() =>
      new PeriodStatsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PeriodStatsStruct &&
        pointsL == other.pointsL &&
        pointsR == other.pointsR &&
        yellowCardsL == other.yellowCardsL &&
        yellowCardsR == other.yellowCardsR &&
        redCardsL == other.redCardsL &&
        redCardsR == other.redCardsR &&
        simultaneous == other.simultaneous &&
        haltsRef == other.haltsRef &&
        haltsL == other.haltsL &&
        haltsR == other.haltsR &&
        simpleAttackHitsL == other.simpleAttackHitsL &&
        simpleAttackHitsR == other.simpleAttackHitsR &&
        simpleAttackOffTarL == other.simpleAttackOffTarL &&
        simpleAttackOffTarR == other.simpleAttackOffTarR &&
        compoundAttackHitsL == other.compoundAttackHitsL &&
        compoundAttackHitsR == other.compoundAttackHitsR &&
        compoundAttackOffTarL == other.compoundAttackOffTarL &&
        compoundAttackOffTarR == other.compoundAttackOffTarR &&
        parryRiposteHitsL == other.parryRiposteHitsL &&
        parryRiposteHitsR == other.parryRiposteHitsR &&
        parryRiposteOffTargetL == other.parryRiposteOffTargetL &&
        parryRiposteOffTargetR == other.parryRiposteOffTargetR &&
        remiseHitsL == other.remiseHitsL &&
        remiseHitsR == other.remiseHitsR &&
        remiseOffTarL == other.remiseOffTarL &&
        remiseOffTarR == other.remiseOffTarR &&
        counterattackHitsL == other.counterattackHitsL &&
        counterattackHitsR == other.counterattackHitsR &&
        counterattackOffTarL == other.counterattackOffTarL &&
        counterattackOffTarR == other.counterattackOffTarR &&
        pointInLineHitsL == other.pointInLineHitsL &&
        pointInLineHitsR == other.pointInLineHitsR &&
        pointInLineOffTarL == other.pointInLineOffTarL &&
        pointInLineOffTarR == other.pointInLineOffTarR &&
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
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, pointsL.hashCode), pointsR.hashCode), yellowCardsL.hashCode), yellowCardsR.hashCode), redCardsL.hashCode), redCardsR.hashCode), simultaneous.hashCode), haltsRef.hashCode), haltsL.hashCode), haltsR.hashCode), simpleAttackHitsL.hashCode), simpleAttackHitsR.hashCode), simpleAttackOffTarL.hashCode), simpleAttackOffTarR.hashCode), compoundAttackHitsL.hashCode), compoundAttackHitsR.hashCode),
                                                                                compoundAttackOffTarL.hashCode),
                                                                            compoundAttackOffTarR.hashCode),
                                                                        parryRiposteHitsL.hashCode),
                                                                    parryRiposteHitsR.hashCode),
                                                                parryRiposteOffTargetL.hashCode),
                                                            parryRiposteOffTargetR.hashCode),
                                                        remiseHitsL.hashCode),
                                                    remiseHitsR.hashCode),
                                                remiseOffTarL.hashCode),
                                            remiseOffTarR.hashCode),
                                        counterattackHitsL.hashCode),
                                    counterattackHitsR.hashCode),
                                counterattackOffTarL.hashCode),
                            counterattackOffTarR.hashCode),
                        pointInLineHitsL.hashCode),
                    pointInLineHitsR.hashCode),
                pointInLineOffTarL.hashCode),
            pointInLineOffTarR.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PeriodStatsStruct')
          ..add('pointsL', pointsL)
          ..add('pointsR', pointsR)
          ..add('yellowCardsL', yellowCardsL)
          ..add('yellowCardsR', yellowCardsR)
          ..add('redCardsL', redCardsL)
          ..add('redCardsR', redCardsR)
          ..add('simultaneous', simultaneous)
          ..add('haltsRef', haltsRef)
          ..add('haltsL', haltsL)
          ..add('haltsR', haltsR)
          ..add('simpleAttackHitsL', simpleAttackHitsL)
          ..add('simpleAttackHitsR', simpleAttackHitsR)
          ..add('simpleAttackOffTarL', simpleAttackOffTarL)
          ..add('simpleAttackOffTarR', simpleAttackOffTarR)
          ..add('compoundAttackHitsL', compoundAttackHitsL)
          ..add('compoundAttackHitsR', compoundAttackHitsR)
          ..add('compoundAttackOffTarL', compoundAttackOffTarL)
          ..add('compoundAttackOffTarR', compoundAttackOffTarR)
          ..add('parryRiposteHitsL', parryRiposteHitsL)
          ..add('parryRiposteHitsR', parryRiposteHitsR)
          ..add('parryRiposteOffTargetL', parryRiposteOffTargetL)
          ..add('parryRiposteOffTargetR', parryRiposteOffTargetR)
          ..add('remiseHitsL', remiseHitsL)
          ..add('remiseHitsR', remiseHitsR)
          ..add('remiseOffTarL', remiseOffTarL)
          ..add('remiseOffTarR', remiseOffTarR)
          ..add('counterattackHitsL', counterattackHitsL)
          ..add('counterattackHitsR', counterattackHitsR)
          ..add('counterattackOffTarL', counterattackOffTarL)
          ..add('counterattackOffTarR', counterattackOffTarR)
          ..add('pointInLineHitsL', pointInLineHitsL)
          ..add('pointInLineHitsR', pointInLineHitsR)
          ..add('pointInLineOffTarL', pointInLineOffTarL)
          ..add('pointInLineOffTarR', pointInLineOffTarR)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class PeriodStatsStructBuilder
    implements Builder<PeriodStatsStruct, PeriodStatsStructBuilder> {
  _$PeriodStatsStruct? _$v;

  int? _pointsL;
  int? get pointsL => _$this._pointsL;
  set pointsL(int? pointsL) => _$this._pointsL = pointsL;

  int? _pointsR;
  int? get pointsR => _$this._pointsR;
  set pointsR(int? pointsR) => _$this._pointsR = pointsR;

  int? _yellowCardsL;
  int? get yellowCardsL => _$this._yellowCardsL;
  set yellowCardsL(int? yellowCardsL) => _$this._yellowCardsL = yellowCardsL;

  int? _yellowCardsR;
  int? get yellowCardsR => _$this._yellowCardsR;
  set yellowCardsR(int? yellowCardsR) => _$this._yellowCardsR = yellowCardsR;

  int? _redCardsL;
  int? get redCardsL => _$this._redCardsL;
  set redCardsL(int? redCardsL) => _$this._redCardsL = redCardsL;

  int? _redCardsR;
  int? get redCardsR => _$this._redCardsR;
  set redCardsR(int? redCardsR) => _$this._redCardsR = redCardsR;

  int? _simultaneous;
  int? get simultaneous => _$this._simultaneous;
  set simultaneous(int? simultaneous) => _$this._simultaneous = simultaneous;

  int? _haltsRef;
  int? get haltsRef => _$this._haltsRef;
  set haltsRef(int? haltsRef) => _$this._haltsRef = haltsRef;

  int? _haltsL;
  int? get haltsL => _$this._haltsL;
  set haltsL(int? haltsL) => _$this._haltsL = haltsL;

  int? _haltsR;
  int? get haltsR => _$this._haltsR;
  set haltsR(int? haltsR) => _$this._haltsR = haltsR;

  int? _simpleAttackHitsL;
  int? get simpleAttackHitsL => _$this._simpleAttackHitsL;
  set simpleAttackHitsL(int? simpleAttackHitsL) =>
      _$this._simpleAttackHitsL = simpleAttackHitsL;

  int? _simpleAttackHitsR;
  int? get simpleAttackHitsR => _$this._simpleAttackHitsR;
  set simpleAttackHitsR(int? simpleAttackHitsR) =>
      _$this._simpleAttackHitsR = simpleAttackHitsR;

  int? _simpleAttackOffTarL;
  int? get simpleAttackOffTarL => _$this._simpleAttackOffTarL;
  set simpleAttackOffTarL(int? simpleAttackOffTarL) =>
      _$this._simpleAttackOffTarL = simpleAttackOffTarL;

  int? _simpleAttackOffTarR;
  int? get simpleAttackOffTarR => _$this._simpleAttackOffTarR;
  set simpleAttackOffTarR(int? simpleAttackOffTarR) =>
      _$this._simpleAttackOffTarR = simpleAttackOffTarR;

  int? _compoundAttackHitsL;
  int? get compoundAttackHitsL => _$this._compoundAttackHitsL;
  set compoundAttackHitsL(int? compoundAttackHitsL) =>
      _$this._compoundAttackHitsL = compoundAttackHitsL;

  int? _compoundAttackHitsR;
  int? get compoundAttackHitsR => _$this._compoundAttackHitsR;
  set compoundAttackHitsR(int? compoundAttackHitsR) =>
      _$this._compoundAttackHitsR = compoundAttackHitsR;

  int? _compoundAttackOffTarL;
  int? get compoundAttackOffTarL => _$this._compoundAttackOffTarL;
  set compoundAttackOffTarL(int? compoundAttackOffTarL) =>
      _$this._compoundAttackOffTarL = compoundAttackOffTarL;

  int? _compoundAttackOffTarR;
  int? get compoundAttackOffTarR => _$this._compoundAttackOffTarR;
  set compoundAttackOffTarR(int? compoundAttackOffTarR) =>
      _$this._compoundAttackOffTarR = compoundAttackOffTarR;

  int? _parryRiposteHitsL;
  int? get parryRiposteHitsL => _$this._parryRiposteHitsL;
  set parryRiposteHitsL(int? parryRiposteHitsL) =>
      _$this._parryRiposteHitsL = parryRiposteHitsL;

  int? _parryRiposteHitsR;
  int? get parryRiposteHitsR => _$this._parryRiposteHitsR;
  set parryRiposteHitsR(int? parryRiposteHitsR) =>
      _$this._parryRiposteHitsR = parryRiposteHitsR;

  int? _parryRiposteOffTargetL;
  int? get parryRiposteOffTargetL => _$this._parryRiposteOffTargetL;
  set parryRiposteOffTargetL(int? parryRiposteOffTargetL) =>
      _$this._parryRiposteOffTargetL = parryRiposteOffTargetL;

  int? _parryRiposteOffTargetR;
  int? get parryRiposteOffTargetR => _$this._parryRiposteOffTargetR;
  set parryRiposteOffTargetR(int? parryRiposteOffTargetR) =>
      _$this._parryRiposteOffTargetR = parryRiposteOffTargetR;

  int? _remiseHitsL;
  int? get remiseHitsL => _$this._remiseHitsL;
  set remiseHitsL(int? remiseHitsL) => _$this._remiseHitsL = remiseHitsL;

  int? _remiseHitsR;
  int? get remiseHitsR => _$this._remiseHitsR;
  set remiseHitsR(int? remiseHitsR) => _$this._remiseHitsR = remiseHitsR;

  int? _remiseOffTarL;
  int? get remiseOffTarL => _$this._remiseOffTarL;
  set remiseOffTarL(int? remiseOffTarL) =>
      _$this._remiseOffTarL = remiseOffTarL;

  int? _remiseOffTarR;
  int? get remiseOffTarR => _$this._remiseOffTarR;
  set remiseOffTarR(int? remiseOffTarR) =>
      _$this._remiseOffTarR = remiseOffTarR;

  int? _counterattackHitsL;
  int? get counterattackHitsL => _$this._counterattackHitsL;
  set counterattackHitsL(int? counterattackHitsL) =>
      _$this._counterattackHitsL = counterattackHitsL;

  int? _counterattackHitsR;
  int? get counterattackHitsR => _$this._counterattackHitsR;
  set counterattackHitsR(int? counterattackHitsR) =>
      _$this._counterattackHitsR = counterattackHitsR;

  int? _counterattackOffTarL;
  int? get counterattackOffTarL => _$this._counterattackOffTarL;
  set counterattackOffTarL(int? counterattackOffTarL) =>
      _$this._counterattackOffTarL = counterattackOffTarL;

  int? _counterattackOffTarR;
  int? get counterattackOffTarR => _$this._counterattackOffTarR;
  set counterattackOffTarR(int? counterattackOffTarR) =>
      _$this._counterattackOffTarR = counterattackOffTarR;

  int? _pointInLineHitsL;
  int? get pointInLineHitsL => _$this._pointInLineHitsL;
  set pointInLineHitsL(int? pointInLineHitsL) =>
      _$this._pointInLineHitsL = pointInLineHitsL;

  int? _pointInLineHitsR;
  int? get pointInLineHitsR => _$this._pointInLineHitsR;
  set pointInLineHitsR(int? pointInLineHitsR) =>
      _$this._pointInLineHitsR = pointInLineHitsR;

  int? _pointInLineOffTarL;
  int? get pointInLineOffTarL => _$this._pointInLineOffTarL;
  set pointInLineOffTarL(int? pointInLineOffTarL) =>
      _$this._pointInLineOffTarL = pointInLineOffTarL;

  int? _pointInLineOffTarR;
  int? get pointInLineOffTarR => _$this._pointInLineOffTarR;
  set pointInLineOffTarR(int? pointInLineOffTarR) =>
      _$this._pointInLineOffTarR = pointInLineOffTarR;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  PeriodStatsStructBuilder() {
    PeriodStatsStruct._initializeBuilder(this);
  }

  PeriodStatsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pointsL = $v.pointsL;
      _pointsR = $v.pointsR;
      _yellowCardsL = $v.yellowCardsL;
      _yellowCardsR = $v.yellowCardsR;
      _redCardsL = $v.redCardsL;
      _redCardsR = $v.redCardsR;
      _simultaneous = $v.simultaneous;
      _haltsRef = $v.haltsRef;
      _haltsL = $v.haltsL;
      _haltsR = $v.haltsR;
      _simpleAttackHitsL = $v.simpleAttackHitsL;
      _simpleAttackHitsR = $v.simpleAttackHitsR;
      _simpleAttackOffTarL = $v.simpleAttackOffTarL;
      _simpleAttackOffTarR = $v.simpleAttackOffTarR;
      _compoundAttackHitsL = $v.compoundAttackHitsL;
      _compoundAttackHitsR = $v.compoundAttackHitsR;
      _compoundAttackOffTarL = $v.compoundAttackOffTarL;
      _compoundAttackOffTarR = $v.compoundAttackOffTarR;
      _parryRiposteHitsL = $v.parryRiposteHitsL;
      _parryRiposteHitsR = $v.parryRiposteHitsR;
      _parryRiposteOffTargetL = $v.parryRiposteOffTargetL;
      _parryRiposteOffTargetR = $v.parryRiposteOffTargetR;
      _remiseHitsL = $v.remiseHitsL;
      _remiseHitsR = $v.remiseHitsR;
      _remiseOffTarL = $v.remiseOffTarL;
      _remiseOffTarR = $v.remiseOffTarR;
      _counterattackHitsL = $v.counterattackHitsL;
      _counterattackHitsR = $v.counterattackHitsR;
      _counterattackOffTarL = $v.counterattackOffTarL;
      _counterattackOffTarR = $v.counterattackOffTarR;
      _pointInLineHitsL = $v.pointInLineHitsL;
      _pointInLineHitsR = $v.pointInLineHitsR;
      _pointInLineOffTarL = $v.pointInLineOffTarL;
      _pointInLineOffTarR = $v.pointInLineOffTarR;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PeriodStatsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PeriodStatsStruct;
  }

  @override
  void update(void Function(PeriodStatsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PeriodStatsStruct build() => _build();

  _$PeriodStatsStruct _build() {
    final _$result = _$v ??
        new _$PeriodStatsStruct._(
            pointsL: pointsL,
            pointsR: pointsR,
            yellowCardsL: yellowCardsL,
            yellowCardsR: yellowCardsR,
            redCardsL: redCardsL,
            redCardsR: redCardsR,
            simultaneous: simultaneous,
            haltsRef: haltsRef,
            haltsL: haltsL,
            haltsR: haltsR,
            simpleAttackHitsL: simpleAttackHitsL,
            simpleAttackHitsR: simpleAttackHitsR,
            simpleAttackOffTarL: simpleAttackOffTarL,
            simpleAttackOffTarR: simpleAttackOffTarR,
            compoundAttackHitsL: compoundAttackHitsL,
            compoundAttackHitsR: compoundAttackHitsR,
            compoundAttackOffTarL: compoundAttackOffTarL,
            compoundAttackOffTarR: compoundAttackOffTarR,
            parryRiposteHitsL: parryRiposteHitsL,
            parryRiposteHitsR: parryRiposteHitsR,
            parryRiposteOffTargetL: parryRiposteOffTargetL,
            parryRiposteOffTargetR: parryRiposteOffTargetR,
            remiseHitsL: remiseHitsL,
            remiseHitsR: remiseHitsR,
            remiseOffTarL: remiseOffTarL,
            remiseOffTarR: remiseOffTarR,
            counterattackHitsL: counterattackHitsL,
            counterattackHitsR: counterattackHitsR,
            counterattackOffTarL: counterattackOffTarL,
            counterattackOffTarR: counterattackOffTarR,
            pointInLineHitsL: pointInLineHitsL,
            pointInLineHitsR: pointInLineHitsR,
            pointInLineOffTarL: pointInLineOffTarL,
            pointInLineOffTarR: pointInLineOffTarR,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'PeriodStatsStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
