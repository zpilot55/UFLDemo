import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'match_stats_struct.g.dart';

abstract class MatchStatsStruct
    implements Built<MatchStatsStruct, MatchStatsStructBuilder> {
  static Serializer<MatchStatsStruct> get serializer =>
      _$matchStatsStructSerializer;

  @BuiltValueField(wireName: 'Points_L')
  BuiltList<int>? get pointsL;

  @BuiltValueField(wireName: 'Points_R')
  BuiltList<int>? get pointsR;

  @BuiltValueField(wireName: 'YellowCards_L')
  BuiltList<int>? get yellowCardsL;

  @BuiltValueField(wireName: 'YellowCards_R')
  BuiltList<int>? get yellowCardsR;

  @BuiltValueField(wireName: 'RedCards_L')
  BuiltList<int>? get redCardsL;

  @BuiltValueField(wireName: 'RedCards_R')
  BuiltList<int>? get redCardsR;

  @BuiltValueField(wireName: 'Simultaneous')
  BuiltList<int>? get simultaneous;

  @BuiltValueField(wireName: 'Halts_Ref')
  BuiltList<int>? get haltsRef;

  @BuiltValueField(wireName: 'Halts_L')
  BuiltList<int>? get haltsL;

  @BuiltValueField(wireName: 'Halts_R')
  BuiltList<int>? get haltsR;

  @BuiltValueField(wireName: 'SimpleAttackHits_L')
  BuiltList<int>? get simpleAttackHitsL;

  @BuiltValueField(wireName: 'SimpleAttackHits_R')
  BuiltList<int>? get simpleAttackHitsR;

  @BuiltValueField(wireName: 'SimpleAttackOffTar_L')
  BuiltList<int>? get simpleAttackOffTarL;

  @BuiltValueField(wireName: 'SimpleAttackOffTar_R')
  BuiltList<int>? get simpleAttackOffTarR;

  @BuiltValueField(wireName: 'CompoundHits_L')
  BuiltList<int>? get compoundHitsL;

  @BuiltValueField(wireName: 'CompoundHits_R')
  BuiltList<int>? get compoundHitsR;

  @BuiltValueField(wireName: 'CompoundOffTar_L')
  BuiltList<int>? get compoundOffTarL;

  @BuiltValueField(wireName: 'CompoundOffTar_R')
  BuiltList<int>? get compoundOffTarR;

  @BuiltValueField(wireName: 'ParryRiposteHits_L')
  BuiltList<int>? get parryRiposteHitsL;

  @BuiltValueField(wireName: 'ParryRiposteHits_R')
  BuiltList<int>? get parryRiposteHitsR;

  @BuiltValueField(wireName: 'ParryRiposteOffTar_L')
  BuiltList<int>? get parryRiposteOffTarL;

  @BuiltValueField(wireName: 'ParryRiposteOffTar_R')
  BuiltList<int>? get parryRiposteOffTarR;

  @BuiltValueField(wireName: 'RemiseHits_L')
  BuiltList<int>? get remiseHitsL;

  @BuiltValueField(wireName: 'RemiseHits_R')
  BuiltList<int>? get remiseHitsR;

  @BuiltValueField(wireName: 'RemiseOffTar_L')
  BuiltList<int>? get remiseOffTarL;

  @BuiltValueField(wireName: 'RemiseOffTar_R')
  BuiltList<int>? get remiseOffTarR;

  @BuiltValueField(wireName: 'CounterattackHits_L')
  BuiltList<int>? get counterattackHitsL;

  @BuiltValueField(wireName: 'CounterattackHits_R')
  BuiltList<int>? get counterattackHitsR;

  @BuiltValueField(wireName: 'CounterattackOffTar_L')
  BuiltList<int>? get counterattackOffTarL;

  @BuiltValueField(wireName: 'CounterattackOffTar_R')
  BuiltList<int>? get counterattackOffTarR;

  @BuiltValueField(wireName: 'PointInLineHits_L')
  BuiltList<int>? get pointInLineHitsL;

  @BuiltValueField(wireName: 'PointInLineHits_R')
  BuiltList<int>? get pointInLineHitsR;

  @BuiltValueField(wireName: 'PointInLineOffTar_L')
  BuiltList<int>? get pointInLineOffTarL;

  @BuiltValueField(wireName: 'PointInLineOffTar_R')
  BuiltList<int>? get pointInLineOffTarR;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(MatchStatsStructBuilder builder) => builder
    ..pointsL = ListBuilder()
    ..pointsR = ListBuilder()
    ..yellowCardsL = ListBuilder()
    ..yellowCardsR = ListBuilder()
    ..redCardsL = ListBuilder()
    ..redCardsR = ListBuilder()
    ..simultaneous = ListBuilder()
    ..haltsRef = ListBuilder()
    ..haltsL = ListBuilder()
    ..haltsR = ListBuilder()
    ..simpleAttackHitsL = ListBuilder()
    ..simpleAttackHitsR = ListBuilder()
    ..simpleAttackOffTarL = ListBuilder()
    ..simpleAttackOffTarR = ListBuilder()
    ..compoundHitsL = ListBuilder()
    ..compoundHitsR = ListBuilder()
    ..compoundOffTarL = ListBuilder()
    ..compoundOffTarR = ListBuilder()
    ..parryRiposteHitsL = ListBuilder()
    ..parryRiposteHitsR = ListBuilder()
    ..parryRiposteOffTarL = ListBuilder()
    ..parryRiposteOffTarR = ListBuilder()
    ..remiseHitsL = ListBuilder()
    ..remiseHitsR = ListBuilder()
    ..remiseOffTarL = ListBuilder()
    ..remiseOffTarR = ListBuilder()
    ..counterattackHitsL = ListBuilder()
    ..counterattackHitsR = ListBuilder()
    ..counterattackOffTarL = ListBuilder()
    ..counterattackOffTarR = ListBuilder()
    ..pointInLineHitsL = ListBuilder()
    ..pointInLineHitsR = ListBuilder()
    ..pointInLineOffTarL = ListBuilder()
    ..pointInLineOffTarR = ListBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  MatchStatsStruct._();
  factory MatchStatsStruct([void Function(MatchStatsStructBuilder) updates]) =
      _$MatchStatsStruct;
}

MatchStatsStruct createMatchStatsStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MatchStatsStruct(
      (m) => m
        ..pointsL = null
        ..pointsR = null
        ..yellowCardsL = null
        ..yellowCardsR = null
        ..redCardsL = null
        ..redCardsR = null
        ..simultaneous = null
        ..haltsRef = null
        ..haltsL = null
        ..haltsR = null
        ..simpleAttackHitsL = null
        ..simpleAttackHitsR = null
        ..simpleAttackOffTarL = null
        ..simpleAttackOffTarR = null
        ..compoundHitsL = null
        ..compoundHitsR = null
        ..compoundOffTarL = null
        ..compoundOffTarR = null
        ..parryRiposteHitsL = null
        ..parryRiposteHitsR = null
        ..parryRiposteOffTarL = null
        ..parryRiposteOffTarR = null
        ..remiseHitsL = null
        ..remiseHitsR = null
        ..remiseOffTarL = null
        ..remiseOffTarR = null
        ..counterattackHitsL = null
        ..counterattackHitsR = null
        ..counterattackOffTarL = null
        ..counterattackOffTarR = null
        ..pointInLineHitsL = null
        ..pointInLineHitsR = null
        ..pointInLineOffTarL = null
        ..pointInLineOffTarR = null
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

MatchStatsStruct? updateMatchStatsStruct(
  MatchStatsStruct? matchStats, {
  bool clearUnsetFields = true,
}) =>
    matchStats != null
        ? (matchStats.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addMatchStatsStructData(
  Map<String, dynamic> firestoreData,
  MatchStatsStruct? matchStats,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (matchStats == null) {
    return;
  }
  if (matchStats.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && matchStats.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final matchStatsData = getMatchStatsFirestoreData(matchStats, forFieldValue);
  final nestedData = matchStatsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = matchStats.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getMatchStatsFirestoreData(
  MatchStatsStruct? matchStats, [
  bool forFieldValue = false,
]) {
  if (matchStats == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(MatchStatsStruct.serializer, matchStats);

  // Add any Firestore field values
  matchStats.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMatchStatsListFirestoreData(
  List<MatchStatsStruct>? matchStatss,
) =>
    matchStatss?.map((m) => getMatchStatsFirestoreData(m, true)).toList() ?? [];
