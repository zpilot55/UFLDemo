// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_stats_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MatchStatsStruct> _$matchStatsStructSerializer =
    new _$MatchStatsStructSerializer();

class _$MatchStatsStructSerializer
    implements StructuredSerializer<MatchStatsStruct> {
  @override
  final Iterable<Type> types = const [MatchStatsStruct, _$MatchStatsStruct];
  @override
  final String wireName = 'MatchStatsStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, MatchStatsStruct object,
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
        ..add('Points_L')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.pointsR;
    if (value != null) {
      result
        ..add('Points_R')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.yellowCardsL;
    if (value != null) {
      result
        ..add('YellowCards_L')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.yellowCardsR;
    if (value != null) {
      result
        ..add('YellowCards_R')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.redCardsL;
    if (value != null) {
      result
        ..add('RedCards_L')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.redCardsR;
    if (value != null) {
      result
        ..add('RedCards_R')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.simultaneous;
    if (value != null) {
      result
        ..add('Simultaneous')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.haltsRef;
    if (value != null) {
      result
        ..add('Halts_Ref')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.haltsL;
    if (value != null) {
      result
        ..add('Halts_L')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.haltsR;
    if (value != null) {
      result
        ..add('Halts_R')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.simpleAttackHitsL;
    if (value != null) {
      result
        ..add('SimpleAttackHits_L')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.simpleAttackHitsR;
    if (value != null) {
      result
        ..add('SimpleAttackHits_R')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.simpleAttackOffTarL;
    if (value != null) {
      result
        ..add('SimpleAttackOffTar_L')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.simpleAttackOffTarR;
    if (value != null) {
      result
        ..add('SimpleAttackOffTar_R')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.compoundHitsL;
    if (value != null) {
      result
        ..add('CompoundHits_L')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.compoundHitsR;
    if (value != null) {
      result
        ..add('CompoundHits_R')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.compoundOffTarL;
    if (value != null) {
      result
        ..add('CompoundOffTar_L')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.compoundOffTarR;
    if (value != null) {
      result
        ..add('CompoundOffTar_R')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.parryRiposteHitsL;
    if (value != null) {
      result
        ..add('ParryRiposteHits_L')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.parryRiposteHitsR;
    if (value != null) {
      result
        ..add('ParryRiposteHits_R')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.parryRiposteOffTarL;
    if (value != null) {
      result
        ..add('ParryRiposteOffTar_L')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.parryRiposteOffTarR;
    if (value != null) {
      result
        ..add('ParryRiposteOffTar_R')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.remiseHitsL;
    if (value != null) {
      result
        ..add('RemiseHits_L')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.remiseHitsR;
    if (value != null) {
      result
        ..add('RemiseHits_R')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.remiseOffTarL;
    if (value != null) {
      result
        ..add('RemiseOffTar_L')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.remiseOffTarR;
    if (value != null) {
      result
        ..add('RemiseOffTar_R')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.counterattackHitsL;
    if (value != null) {
      result
        ..add('CounterattackHits_L')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.counterattackHitsR;
    if (value != null) {
      result
        ..add('CounterattackHits_R')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.counterattackOffTarL;
    if (value != null) {
      result
        ..add('CounterattackOffTar_L')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.counterattackOffTarR;
    if (value != null) {
      result
        ..add('CounterattackOffTar_R')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.pointInLineHitsL;
    if (value != null) {
      result
        ..add('PointInLineHits_L')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.pointInLineHitsR;
    if (value != null) {
      result
        ..add('PointInLineHits_R')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.pointInLineOffTarL;
    if (value != null) {
      result
        ..add('PointInLineOffTar_L')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.pointInLineOffTarR;
    if (value != null) {
      result
        ..add('PointInLineOffTar_R')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.testValue;
    if (value != null) {
      result
        ..add('testValue')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  MatchStatsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MatchStatsStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Points_L':
          result.pointsL.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'Points_R':
          result.pointsR.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'YellowCards_L':
          result.yellowCardsL.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'YellowCards_R':
          result.yellowCardsR.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'RedCards_L':
          result.redCardsL.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'RedCards_R':
          result.redCardsR.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'Simultaneous':
          result.simultaneous.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'Halts_Ref':
          result.haltsRef.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'Halts_L':
          result.haltsL.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'Halts_R':
          result.haltsR.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'SimpleAttackHits_L':
          result.simpleAttackHitsL.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'SimpleAttackHits_R':
          result.simpleAttackHitsR.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'SimpleAttackOffTar_L':
          result.simpleAttackOffTarL.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'SimpleAttackOffTar_R':
          result.simpleAttackOffTarR.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'CompoundHits_L':
          result.compoundHitsL.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'CompoundHits_R':
          result.compoundHitsR.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'CompoundOffTar_L':
          result.compoundOffTarL.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'CompoundOffTar_R':
          result.compoundOffTarR.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'ParryRiposteHits_L':
          result.parryRiposteHitsL.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'ParryRiposteHits_R':
          result.parryRiposteHitsR.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'ParryRiposteOffTar_L':
          result.parryRiposteOffTarL.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'ParryRiposteOffTar_R':
          result.parryRiposteOffTarR.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'RemiseHits_L':
          result.remiseHitsL.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'RemiseHits_R':
          result.remiseHitsR.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'RemiseOffTar_L':
          result.remiseOffTarL.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'RemiseOffTar_R':
          result.remiseOffTarR.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'CounterattackHits_L':
          result.counterattackHitsL.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'CounterattackHits_R':
          result.counterattackHitsR.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'CounterattackOffTar_L':
          result.counterattackOffTarL.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'CounterattackOffTar_R':
          result.counterattackOffTarR.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'PointInLineHits_L':
          result.pointInLineHitsL.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'PointInLineHits_R':
          result.pointInLineHitsR.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'PointInLineOffTar_L':
          result.pointInLineOffTarL.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'PointInLineOffTar_R':
          result.pointInLineOffTarR.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'testValue':
          result.testValue = serializers.deserialize(value,
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

class _$MatchStatsStruct extends MatchStatsStruct {
  @override
  final BuiltList<int>? pointsL;
  @override
  final BuiltList<int>? pointsR;
  @override
  final BuiltList<int>? yellowCardsL;
  @override
  final BuiltList<int>? yellowCardsR;
  @override
  final BuiltList<int>? redCardsL;
  @override
  final BuiltList<int>? redCardsR;
  @override
  final BuiltList<int>? simultaneous;
  @override
  final BuiltList<int>? haltsRef;
  @override
  final BuiltList<int>? haltsL;
  @override
  final BuiltList<int>? haltsR;
  @override
  final BuiltList<int>? simpleAttackHitsL;
  @override
  final BuiltList<int>? simpleAttackHitsR;
  @override
  final BuiltList<int>? simpleAttackOffTarL;
  @override
  final BuiltList<int>? simpleAttackOffTarR;
  @override
  final BuiltList<int>? compoundHitsL;
  @override
  final BuiltList<int>? compoundHitsR;
  @override
  final BuiltList<int>? compoundOffTarL;
  @override
  final BuiltList<int>? compoundOffTarR;
  @override
  final BuiltList<int>? parryRiposteHitsL;
  @override
  final BuiltList<int>? parryRiposteHitsR;
  @override
  final BuiltList<int>? parryRiposteOffTarL;
  @override
  final BuiltList<int>? parryRiposteOffTarR;
  @override
  final BuiltList<int>? remiseHitsL;
  @override
  final BuiltList<int>? remiseHitsR;
  @override
  final BuiltList<int>? remiseOffTarL;
  @override
  final BuiltList<int>? remiseOffTarR;
  @override
  final BuiltList<int>? counterattackHitsL;
  @override
  final BuiltList<int>? counterattackHitsR;
  @override
  final BuiltList<int>? counterattackOffTarL;
  @override
  final BuiltList<int>? counterattackOffTarR;
  @override
  final BuiltList<int>? pointInLineHitsL;
  @override
  final BuiltList<int>? pointInLineHitsR;
  @override
  final BuiltList<int>? pointInLineOffTarL;
  @override
  final BuiltList<int>? pointInLineOffTarR;
  @override
  final int? testValue;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$MatchStatsStruct(
          [void Function(MatchStatsStructBuilder)? updates]) =>
      (new MatchStatsStructBuilder()..update(updates))._build();

  _$MatchStatsStruct._(
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
      this.compoundHitsL,
      this.compoundHitsR,
      this.compoundOffTarL,
      this.compoundOffTarR,
      this.parryRiposteHitsL,
      this.parryRiposteHitsR,
      this.parryRiposteOffTarL,
      this.parryRiposteOffTarR,
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
      this.testValue,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'MatchStatsStruct', 'firestoreUtilData');
  }

  @override
  MatchStatsStruct rebuild(void Function(MatchStatsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MatchStatsStructBuilder toBuilder() =>
      new MatchStatsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MatchStatsStruct &&
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
        compoundHitsL == other.compoundHitsL &&
        compoundHitsR == other.compoundHitsR &&
        compoundOffTarL == other.compoundOffTarL &&
        compoundOffTarR == other.compoundOffTarR &&
        parryRiposteHitsL == other.parryRiposteHitsL &&
        parryRiposteHitsR == other.parryRiposteHitsR &&
        parryRiposteOffTarL == other.parryRiposteOffTarL &&
        parryRiposteOffTarR == other.parryRiposteOffTarR &&
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
        testValue == other.testValue &&
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
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, pointsL.hashCode), pointsR.hashCode), yellowCardsL.hashCode), yellowCardsR.hashCode), redCardsL.hashCode), redCardsR.hashCode), simultaneous.hashCode), haltsRef.hashCode), haltsL.hashCode), haltsR.hashCode), simpleAttackHitsL.hashCode), simpleAttackHitsR.hashCode), simpleAttackOffTarL.hashCode), simpleAttackOffTarR.hashCode), compoundHitsL.hashCode), compoundHitsR.hashCode), compoundOffTarL.hashCode),
                                                                                compoundOffTarR.hashCode),
                                                                            parryRiposteHitsL.hashCode),
                                                                        parryRiposteHitsR.hashCode),
                                                                    parryRiposteOffTarL.hashCode),
                                                                parryRiposteOffTarR.hashCode),
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
            testValue.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MatchStatsStruct')
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
          ..add('compoundHitsL', compoundHitsL)
          ..add('compoundHitsR', compoundHitsR)
          ..add('compoundOffTarL', compoundOffTarL)
          ..add('compoundOffTarR', compoundOffTarR)
          ..add('parryRiposteHitsL', parryRiposteHitsL)
          ..add('parryRiposteHitsR', parryRiposteHitsR)
          ..add('parryRiposteOffTarL', parryRiposteOffTarL)
          ..add('parryRiposteOffTarR', parryRiposteOffTarR)
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
          ..add('testValue', testValue)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class MatchStatsStructBuilder
    implements Builder<MatchStatsStruct, MatchStatsStructBuilder> {
  _$MatchStatsStruct? _$v;

  ListBuilder<int>? _pointsL;
  ListBuilder<int> get pointsL => _$this._pointsL ??= new ListBuilder<int>();
  set pointsL(ListBuilder<int>? pointsL) => _$this._pointsL = pointsL;

  ListBuilder<int>? _pointsR;
  ListBuilder<int> get pointsR => _$this._pointsR ??= new ListBuilder<int>();
  set pointsR(ListBuilder<int>? pointsR) => _$this._pointsR = pointsR;

  ListBuilder<int>? _yellowCardsL;
  ListBuilder<int> get yellowCardsL =>
      _$this._yellowCardsL ??= new ListBuilder<int>();
  set yellowCardsL(ListBuilder<int>? yellowCardsL) =>
      _$this._yellowCardsL = yellowCardsL;

  ListBuilder<int>? _yellowCardsR;
  ListBuilder<int> get yellowCardsR =>
      _$this._yellowCardsR ??= new ListBuilder<int>();
  set yellowCardsR(ListBuilder<int>? yellowCardsR) =>
      _$this._yellowCardsR = yellowCardsR;

  ListBuilder<int>? _redCardsL;
  ListBuilder<int> get redCardsL =>
      _$this._redCardsL ??= new ListBuilder<int>();
  set redCardsL(ListBuilder<int>? redCardsL) => _$this._redCardsL = redCardsL;

  ListBuilder<int>? _redCardsR;
  ListBuilder<int> get redCardsR =>
      _$this._redCardsR ??= new ListBuilder<int>();
  set redCardsR(ListBuilder<int>? redCardsR) => _$this._redCardsR = redCardsR;

  ListBuilder<int>? _simultaneous;
  ListBuilder<int> get simultaneous =>
      _$this._simultaneous ??= new ListBuilder<int>();
  set simultaneous(ListBuilder<int>? simultaneous) =>
      _$this._simultaneous = simultaneous;

  ListBuilder<int>? _haltsRef;
  ListBuilder<int> get haltsRef => _$this._haltsRef ??= new ListBuilder<int>();
  set haltsRef(ListBuilder<int>? haltsRef) => _$this._haltsRef = haltsRef;

  ListBuilder<int>? _haltsL;
  ListBuilder<int> get haltsL => _$this._haltsL ??= new ListBuilder<int>();
  set haltsL(ListBuilder<int>? haltsL) => _$this._haltsL = haltsL;

  ListBuilder<int>? _haltsR;
  ListBuilder<int> get haltsR => _$this._haltsR ??= new ListBuilder<int>();
  set haltsR(ListBuilder<int>? haltsR) => _$this._haltsR = haltsR;

  ListBuilder<int>? _simpleAttackHitsL;
  ListBuilder<int> get simpleAttackHitsL =>
      _$this._simpleAttackHitsL ??= new ListBuilder<int>();
  set simpleAttackHitsL(ListBuilder<int>? simpleAttackHitsL) =>
      _$this._simpleAttackHitsL = simpleAttackHitsL;

  ListBuilder<int>? _simpleAttackHitsR;
  ListBuilder<int> get simpleAttackHitsR =>
      _$this._simpleAttackHitsR ??= new ListBuilder<int>();
  set simpleAttackHitsR(ListBuilder<int>? simpleAttackHitsR) =>
      _$this._simpleAttackHitsR = simpleAttackHitsR;

  ListBuilder<int>? _simpleAttackOffTarL;
  ListBuilder<int> get simpleAttackOffTarL =>
      _$this._simpleAttackOffTarL ??= new ListBuilder<int>();
  set simpleAttackOffTarL(ListBuilder<int>? simpleAttackOffTarL) =>
      _$this._simpleAttackOffTarL = simpleAttackOffTarL;

  ListBuilder<int>? _simpleAttackOffTarR;
  ListBuilder<int> get simpleAttackOffTarR =>
      _$this._simpleAttackOffTarR ??= new ListBuilder<int>();
  set simpleAttackOffTarR(ListBuilder<int>? simpleAttackOffTarR) =>
      _$this._simpleAttackOffTarR = simpleAttackOffTarR;

  ListBuilder<int>? _compoundHitsL;
  ListBuilder<int> get compoundHitsL =>
      _$this._compoundHitsL ??= new ListBuilder<int>();
  set compoundHitsL(ListBuilder<int>? compoundHitsL) =>
      _$this._compoundHitsL = compoundHitsL;

  ListBuilder<int>? _compoundHitsR;
  ListBuilder<int> get compoundHitsR =>
      _$this._compoundHitsR ??= new ListBuilder<int>();
  set compoundHitsR(ListBuilder<int>? compoundHitsR) =>
      _$this._compoundHitsR = compoundHitsR;

  ListBuilder<int>? _compoundOffTarL;
  ListBuilder<int> get compoundOffTarL =>
      _$this._compoundOffTarL ??= new ListBuilder<int>();
  set compoundOffTarL(ListBuilder<int>? compoundOffTarL) =>
      _$this._compoundOffTarL = compoundOffTarL;

  ListBuilder<int>? _compoundOffTarR;
  ListBuilder<int> get compoundOffTarR =>
      _$this._compoundOffTarR ??= new ListBuilder<int>();
  set compoundOffTarR(ListBuilder<int>? compoundOffTarR) =>
      _$this._compoundOffTarR = compoundOffTarR;

  ListBuilder<int>? _parryRiposteHitsL;
  ListBuilder<int> get parryRiposteHitsL =>
      _$this._parryRiposteHitsL ??= new ListBuilder<int>();
  set parryRiposteHitsL(ListBuilder<int>? parryRiposteHitsL) =>
      _$this._parryRiposteHitsL = parryRiposteHitsL;

  ListBuilder<int>? _parryRiposteHitsR;
  ListBuilder<int> get parryRiposteHitsR =>
      _$this._parryRiposteHitsR ??= new ListBuilder<int>();
  set parryRiposteHitsR(ListBuilder<int>? parryRiposteHitsR) =>
      _$this._parryRiposteHitsR = parryRiposteHitsR;

  ListBuilder<int>? _parryRiposteOffTarL;
  ListBuilder<int> get parryRiposteOffTarL =>
      _$this._parryRiposteOffTarL ??= new ListBuilder<int>();
  set parryRiposteOffTarL(ListBuilder<int>? parryRiposteOffTarL) =>
      _$this._parryRiposteOffTarL = parryRiposteOffTarL;

  ListBuilder<int>? _parryRiposteOffTarR;
  ListBuilder<int> get parryRiposteOffTarR =>
      _$this._parryRiposteOffTarR ??= new ListBuilder<int>();
  set parryRiposteOffTarR(ListBuilder<int>? parryRiposteOffTarR) =>
      _$this._parryRiposteOffTarR = parryRiposteOffTarR;

  ListBuilder<int>? _remiseHitsL;
  ListBuilder<int> get remiseHitsL =>
      _$this._remiseHitsL ??= new ListBuilder<int>();
  set remiseHitsL(ListBuilder<int>? remiseHitsL) =>
      _$this._remiseHitsL = remiseHitsL;

  ListBuilder<int>? _remiseHitsR;
  ListBuilder<int> get remiseHitsR =>
      _$this._remiseHitsR ??= new ListBuilder<int>();
  set remiseHitsR(ListBuilder<int>? remiseHitsR) =>
      _$this._remiseHitsR = remiseHitsR;

  ListBuilder<int>? _remiseOffTarL;
  ListBuilder<int> get remiseOffTarL =>
      _$this._remiseOffTarL ??= new ListBuilder<int>();
  set remiseOffTarL(ListBuilder<int>? remiseOffTarL) =>
      _$this._remiseOffTarL = remiseOffTarL;

  ListBuilder<int>? _remiseOffTarR;
  ListBuilder<int> get remiseOffTarR =>
      _$this._remiseOffTarR ??= new ListBuilder<int>();
  set remiseOffTarR(ListBuilder<int>? remiseOffTarR) =>
      _$this._remiseOffTarR = remiseOffTarR;

  ListBuilder<int>? _counterattackHitsL;
  ListBuilder<int> get counterattackHitsL =>
      _$this._counterattackHitsL ??= new ListBuilder<int>();
  set counterattackHitsL(ListBuilder<int>? counterattackHitsL) =>
      _$this._counterattackHitsL = counterattackHitsL;

  ListBuilder<int>? _counterattackHitsR;
  ListBuilder<int> get counterattackHitsR =>
      _$this._counterattackHitsR ??= new ListBuilder<int>();
  set counterattackHitsR(ListBuilder<int>? counterattackHitsR) =>
      _$this._counterattackHitsR = counterattackHitsR;

  ListBuilder<int>? _counterattackOffTarL;
  ListBuilder<int> get counterattackOffTarL =>
      _$this._counterattackOffTarL ??= new ListBuilder<int>();
  set counterattackOffTarL(ListBuilder<int>? counterattackOffTarL) =>
      _$this._counterattackOffTarL = counterattackOffTarL;

  ListBuilder<int>? _counterattackOffTarR;
  ListBuilder<int> get counterattackOffTarR =>
      _$this._counterattackOffTarR ??= new ListBuilder<int>();
  set counterattackOffTarR(ListBuilder<int>? counterattackOffTarR) =>
      _$this._counterattackOffTarR = counterattackOffTarR;

  ListBuilder<int>? _pointInLineHitsL;
  ListBuilder<int> get pointInLineHitsL =>
      _$this._pointInLineHitsL ??= new ListBuilder<int>();
  set pointInLineHitsL(ListBuilder<int>? pointInLineHitsL) =>
      _$this._pointInLineHitsL = pointInLineHitsL;

  ListBuilder<int>? _pointInLineHitsR;
  ListBuilder<int> get pointInLineHitsR =>
      _$this._pointInLineHitsR ??= new ListBuilder<int>();
  set pointInLineHitsR(ListBuilder<int>? pointInLineHitsR) =>
      _$this._pointInLineHitsR = pointInLineHitsR;

  ListBuilder<int>? _pointInLineOffTarL;
  ListBuilder<int> get pointInLineOffTarL =>
      _$this._pointInLineOffTarL ??= new ListBuilder<int>();
  set pointInLineOffTarL(ListBuilder<int>? pointInLineOffTarL) =>
      _$this._pointInLineOffTarL = pointInLineOffTarL;

  ListBuilder<int>? _pointInLineOffTarR;
  ListBuilder<int> get pointInLineOffTarR =>
      _$this._pointInLineOffTarR ??= new ListBuilder<int>();
  set pointInLineOffTarR(ListBuilder<int>? pointInLineOffTarR) =>
      _$this._pointInLineOffTarR = pointInLineOffTarR;

  int? _testValue;
  int? get testValue => _$this._testValue;
  set testValue(int? testValue) => _$this._testValue = testValue;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  MatchStatsStructBuilder() {
    MatchStatsStruct._initializeBuilder(this);
  }

  MatchStatsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pointsL = $v.pointsL?.toBuilder();
      _pointsR = $v.pointsR?.toBuilder();
      _yellowCardsL = $v.yellowCardsL?.toBuilder();
      _yellowCardsR = $v.yellowCardsR?.toBuilder();
      _redCardsL = $v.redCardsL?.toBuilder();
      _redCardsR = $v.redCardsR?.toBuilder();
      _simultaneous = $v.simultaneous?.toBuilder();
      _haltsRef = $v.haltsRef?.toBuilder();
      _haltsL = $v.haltsL?.toBuilder();
      _haltsR = $v.haltsR?.toBuilder();
      _simpleAttackHitsL = $v.simpleAttackHitsL?.toBuilder();
      _simpleAttackHitsR = $v.simpleAttackHitsR?.toBuilder();
      _simpleAttackOffTarL = $v.simpleAttackOffTarL?.toBuilder();
      _simpleAttackOffTarR = $v.simpleAttackOffTarR?.toBuilder();
      _compoundHitsL = $v.compoundHitsL?.toBuilder();
      _compoundHitsR = $v.compoundHitsR?.toBuilder();
      _compoundOffTarL = $v.compoundOffTarL?.toBuilder();
      _compoundOffTarR = $v.compoundOffTarR?.toBuilder();
      _parryRiposteHitsL = $v.parryRiposteHitsL?.toBuilder();
      _parryRiposteHitsR = $v.parryRiposteHitsR?.toBuilder();
      _parryRiposteOffTarL = $v.parryRiposteOffTarL?.toBuilder();
      _parryRiposteOffTarR = $v.parryRiposteOffTarR?.toBuilder();
      _remiseHitsL = $v.remiseHitsL?.toBuilder();
      _remiseHitsR = $v.remiseHitsR?.toBuilder();
      _remiseOffTarL = $v.remiseOffTarL?.toBuilder();
      _remiseOffTarR = $v.remiseOffTarR?.toBuilder();
      _counterattackHitsL = $v.counterattackHitsL?.toBuilder();
      _counterattackHitsR = $v.counterattackHitsR?.toBuilder();
      _counterattackOffTarL = $v.counterattackOffTarL?.toBuilder();
      _counterattackOffTarR = $v.counterattackOffTarR?.toBuilder();
      _pointInLineHitsL = $v.pointInLineHitsL?.toBuilder();
      _pointInLineHitsR = $v.pointInLineHitsR?.toBuilder();
      _pointInLineOffTarL = $v.pointInLineOffTarL?.toBuilder();
      _pointInLineOffTarR = $v.pointInLineOffTarR?.toBuilder();
      _testValue = $v.testValue;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MatchStatsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MatchStatsStruct;
  }

  @override
  void update(void Function(MatchStatsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MatchStatsStruct build() => _build();

  _$MatchStatsStruct _build() {
    _$MatchStatsStruct _$result;
    try {
      _$result = _$v ??
          new _$MatchStatsStruct._(
              pointsL: _pointsL?.build(),
              pointsR: _pointsR?.build(),
              yellowCardsL: _yellowCardsL?.build(),
              yellowCardsR: _yellowCardsR?.build(),
              redCardsL: _redCardsL?.build(),
              redCardsR: _redCardsR?.build(),
              simultaneous: _simultaneous?.build(),
              haltsRef: _haltsRef?.build(),
              haltsL: _haltsL?.build(),
              haltsR: _haltsR?.build(),
              simpleAttackHitsL: _simpleAttackHitsL?.build(),
              simpleAttackHitsR: _simpleAttackHitsR?.build(),
              simpleAttackOffTarL: _simpleAttackOffTarL?.build(),
              simpleAttackOffTarR: _simpleAttackOffTarR?.build(),
              compoundHitsL: _compoundHitsL?.build(),
              compoundHitsR: _compoundHitsR?.build(),
              compoundOffTarL: _compoundOffTarL?.build(),
              compoundOffTarR: _compoundOffTarR?.build(),
              parryRiposteHitsL: _parryRiposteHitsL?.build(),
              parryRiposteHitsR: _parryRiposteHitsR?.build(),
              parryRiposteOffTarL: _parryRiposteOffTarL?.build(),
              parryRiposteOffTarR: _parryRiposteOffTarR?.build(),
              remiseHitsL: _remiseHitsL?.build(),
              remiseHitsR: _remiseHitsR?.build(),
              remiseOffTarL: _remiseOffTarL?.build(),
              remiseOffTarR: _remiseOffTarR?.build(),
              counterattackHitsL: _counterattackHitsL?.build(),
              counterattackHitsR: _counterattackHitsR?.build(),
              counterattackOffTarL: _counterattackOffTarL?.build(),
              counterattackOffTarR: _counterattackOffTarR?.build(),
              pointInLineHitsL: _pointInLineHitsL?.build(),
              pointInLineHitsR: _pointInLineHitsR?.build(),
              pointInLineOffTarL: _pointInLineOffTarL?.build(),
              pointInLineOffTarR: _pointInLineOffTarR?.build(),
              testValue: testValue,
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData, r'MatchStatsStruct', 'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pointsL';
        _pointsL?.build();
        _$failedField = 'pointsR';
        _pointsR?.build();
        _$failedField = 'yellowCardsL';
        _yellowCardsL?.build();
        _$failedField = 'yellowCardsR';
        _yellowCardsR?.build();
        _$failedField = 'redCardsL';
        _redCardsL?.build();
        _$failedField = 'redCardsR';
        _redCardsR?.build();
        _$failedField = 'simultaneous';
        _simultaneous?.build();
        _$failedField = 'haltsRef';
        _haltsRef?.build();
        _$failedField = 'haltsL';
        _haltsL?.build();
        _$failedField = 'haltsR';
        _haltsR?.build();
        _$failedField = 'simpleAttackHitsL';
        _simpleAttackHitsL?.build();
        _$failedField = 'simpleAttackHitsR';
        _simpleAttackHitsR?.build();
        _$failedField = 'simpleAttackOffTarL';
        _simpleAttackOffTarL?.build();
        _$failedField = 'simpleAttackOffTarR';
        _simpleAttackOffTarR?.build();
        _$failedField = 'compoundHitsL';
        _compoundHitsL?.build();
        _$failedField = 'compoundHitsR';
        _compoundHitsR?.build();
        _$failedField = 'compoundOffTarL';
        _compoundOffTarL?.build();
        _$failedField = 'compoundOffTarR';
        _compoundOffTarR?.build();
        _$failedField = 'parryRiposteHitsL';
        _parryRiposteHitsL?.build();
        _$failedField = 'parryRiposteHitsR';
        _parryRiposteHitsR?.build();
        _$failedField = 'parryRiposteOffTarL';
        _parryRiposteOffTarL?.build();
        _$failedField = 'parryRiposteOffTarR';
        _parryRiposteOffTarR?.build();
        _$failedField = 'remiseHitsL';
        _remiseHitsL?.build();
        _$failedField = 'remiseHitsR';
        _remiseHitsR?.build();
        _$failedField = 'remiseOffTarL';
        _remiseOffTarL?.build();
        _$failedField = 'remiseOffTarR';
        _remiseOffTarR?.build();
        _$failedField = 'counterattackHitsL';
        _counterattackHitsL?.build();
        _$failedField = 'counterattackHitsR';
        _counterattackHitsR?.build();
        _$failedField = 'counterattackOffTarL';
        _counterattackOffTarL?.build();
        _$failedField = 'counterattackOffTarR';
        _counterattackOffTarR?.build();
        _$failedField = 'pointInLineHitsL';
        _pointInLineHitsL?.build();
        _$failedField = 'pointInLineHitsR';
        _pointInLineHitsR?.build();
        _$failedField = 'pointInLineOffTarL';
        _pointInLineOffTarL?.build();
        _$failedField = 'pointInLineOffTarR';
        _pointInLineOffTarR?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MatchStatsStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
