import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'match_stat_snapshot_struct.g.dart';

abstract class MatchStatSnapshotStruct
    implements Built<MatchStatSnapshotStruct, MatchStatSnapshotStructBuilder> {
  static Serializer<MatchStatSnapshotStruct> get serializer =>
      _$matchStatSnapshotStructSerializer;

  @BuiltValueField(wireName: 'PointsL')
  int? get pointsL;

  @BuiltValueField(wireName: 'PointsR')
  int? get pointsR;

  @BuiltValueField(wireName: 'YellowCardsL')
  int? get yellowCardsL;

  @BuiltValueField(wireName: 'YellowCardsR')
  int? get yellowCardsR;

  @BuiltValueField(wireName: 'RedCardsL')
  int? get redCardsL;

  @BuiltValueField(wireName: 'RedCardsR')
  int? get redCardsR;

  @BuiltValueField(wireName: 'Simultaneous')
  int? get simultaneous;

  @BuiltValueField(wireName: 'HaltsRef')
  int? get haltsRef;

  @BuiltValueField(wireName: 'HaltsL')
  int? get haltsL;

  @BuiltValueField(wireName: 'HaltsR')
  int? get haltsR;

  @BuiltValueField(wireName: 'SimpleAttackHitsL')
  int? get simpleAttackHitsL;

  @BuiltValueField(wireName: 'SimpleAttackHitsR')
  int? get simpleAttackHitsR;

  @BuiltValueField(wireName: 'SimpleAttackOffTarL')
  int? get simpleAttackOffTarL;

  @BuiltValueField(wireName: 'SimpleAttackOffTarR')
  int? get simpleAttackOffTarR;

  @BuiltValueField(wireName: 'CompoundAttackHitsL')
  int? get compoundAttackHitsL;

  @BuiltValueField(wireName: 'CompoundAttackHitsR')
  int? get compoundAttackHitsR;

  @BuiltValueField(wireName: 'CompoundAttackOffTarL')
  int? get compoundAttackOffTarL;

  @BuiltValueField(wireName: 'CompoundAttackOffTarR')
  int? get compoundAttackOffTarR;

  @BuiltValueField(wireName: 'ParryRiposteHitsL')
  int? get parryRiposteHitsL;

  @BuiltValueField(wireName: 'ParryRiposteHitsR')
  int? get parryRiposteHitsR;

  @BuiltValueField(wireName: 'ParryRiposteOffTargetL')
  int? get parryRiposteOffTargetL;

  @BuiltValueField(wireName: 'ParryRiposteOffTargetR')
  int? get parryRiposteOffTargetR;

  @BuiltValueField(wireName: 'RemiseHitsL')
  int? get remiseHitsL;

  @BuiltValueField(wireName: 'RemiseHitsR')
  int? get remiseHitsR;

  @BuiltValueField(wireName: 'RemiseOffTarL')
  int? get remiseOffTarL;

  @BuiltValueField(wireName: 'RemiseOffTarR')
  int? get remiseOffTarR;

  @BuiltValueField(wireName: 'CounterattackHitsL')
  int? get counterattackHitsL;

  @BuiltValueField(wireName: 'CounterattackHitsR')
  int? get counterattackHitsR;

  @BuiltValueField(wireName: 'CounterattackOffTarL')
  int? get counterattackOffTarL;

  @BuiltValueField(wireName: 'CounterattackOffTarR')
  int? get counterattackOffTarR;

  @BuiltValueField(wireName: 'PointInLineHitsL')
  int? get pointInLineHitsL;

  @BuiltValueField(wireName: 'PointInLineHitsR')
  int? get pointInLineHitsR;

  @BuiltValueField(wireName: 'PointInLineOffTarL')
  int? get pointInLineOffTarL;

  @BuiltValueField(wireName: 'PointInLineOffTarR')
  int? get pointInLineOffTarR;

  int? get timestamp;

  int? get periodstamp;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(MatchStatSnapshotStructBuilder builder) =>
      builder
        ..pointsL = 0
        ..pointsR = 0
        ..yellowCardsL = 0
        ..yellowCardsR = 0
        ..redCardsL = 0
        ..redCardsR = 0
        ..simultaneous = 0
        ..haltsRef = 0
        ..haltsL = 0
        ..haltsR = 0
        ..simpleAttackHitsL = 0
        ..simpleAttackHitsR = 0
        ..simpleAttackOffTarL = 0
        ..simpleAttackOffTarR = 0
        ..compoundAttackHitsL = 0
        ..compoundAttackHitsR = 0
        ..compoundAttackOffTarL = 0
        ..compoundAttackOffTarR = 0
        ..parryRiposteHitsL = 0
        ..parryRiposteHitsR = 0
        ..parryRiposteOffTargetL = 0
        ..parryRiposteOffTargetR = 0
        ..remiseHitsL = 0
        ..remiseHitsR = 0
        ..remiseOffTarL = 0
        ..remiseOffTarR = 0
        ..counterattackHitsL = 0
        ..counterattackHitsR = 0
        ..counterattackOffTarL = 0
        ..counterattackOffTarR = 0
        ..pointInLineHitsL = 0
        ..pointInLineHitsR = 0
        ..pointInLineOffTarL = 0
        ..pointInLineOffTarR = 0
        ..timestamp = 0
        ..periodstamp = 0
        ..firestoreUtilData = FirestoreUtilData();

  MatchStatSnapshotStruct._();
  factory MatchStatSnapshotStruct(
          [void Function(MatchStatSnapshotStructBuilder) updates]) =
      _$MatchStatSnapshotStruct;
}

MatchStatSnapshotStruct createMatchStatSnapshotStruct({
  int? pointsL,
  int? pointsR,
  int? yellowCardsL,
  int? yellowCardsR,
  int? redCardsL,
  int? redCardsR,
  int? simultaneous,
  int? haltsRef,
  int? haltsL,
  int? haltsR,
  int? simpleAttackHitsL,
  int? simpleAttackHitsR,
  int? simpleAttackOffTarL,
  int? simpleAttackOffTarR,
  int? compoundAttackHitsL,
  int? compoundAttackHitsR,
  int? compoundAttackOffTarL,
  int? compoundAttackOffTarR,
  int? parryRiposteHitsL,
  int? parryRiposteHitsR,
  int? parryRiposteOffTargetL,
  int? parryRiposteOffTargetR,
  int? remiseHitsL,
  int? remiseHitsR,
  int? remiseOffTarL,
  int? remiseOffTarR,
  int? counterattackHitsL,
  int? counterattackHitsR,
  int? counterattackOffTarL,
  int? counterattackOffTarR,
  int? pointInLineHitsL,
  int? pointInLineHitsR,
  int? pointInLineOffTarL,
  int? pointInLineOffTarR,
  int? timestamp,
  int? periodstamp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MatchStatSnapshotStruct(
      (m) => m
        ..pointsL = pointsL
        ..pointsR = pointsR
        ..yellowCardsL = yellowCardsL
        ..yellowCardsR = yellowCardsR
        ..redCardsL = redCardsL
        ..redCardsR = redCardsR
        ..simultaneous = simultaneous
        ..haltsRef = haltsRef
        ..haltsL = haltsL
        ..haltsR = haltsR
        ..simpleAttackHitsL = simpleAttackHitsL
        ..simpleAttackHitsR = simpleAttackHitsR
        ..simpleAttackOffTarL = simpleAttackOffTarL
        ..simpleAttackOffTarR = simpleAttackOffTarR
        ..compoundAttackHitsL = compoundAttackHitsL
        ..compoundAttackHitsR = compoundAttackHitsR
        ..compoundAttackOffTarL = compoundAttackOffTarL
        ..compoundAttackOffTarR = compoundAttackOffTarR
        ..parryRiposteHitsL = parryRiposteHitsL
        ..parryRiposteHitsR = parryRiposteHitsR
        ..parryRiposteOffTargetL = parryRiposteOffTargetL
        ..parryRiposteOffTargetR = parryRiposteOffTargetR
        ..remiseHitsL = remiseHitsL
        ..remiseHitsR = remiseHitsR
        ..remiseOffTarL = remiseOffTarL
        ..remiseOffTarR = remiseOffTarR
        ..counterattackHitsL = counterattackHitsL
        ..counterattackHitsR = counterattackHitsR
        ..counterattackOffTarL = counterattackOffTarL
        ..counterattackOffTarR = counterattackOffTarR
        ..pointInLineHitsL = pointInLineHitsL
        ..pointInLineHitsR = pointInLineHitsR
        ..pointInLineOffTarL = pointInLineOffTarL
        ..pointInLineOffTarR = pointInLineOffTarR
        ..timestamp = timestamp
        ..periodstamp = periodstamp
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

MatchStatSnapshotStruct? updateMatchStatSnapshotStruct(
  MatchStatSnapshotStruct? matchStatSnapshot, {
  bool clearUnsetFields = true,
}) =>
    matchStatSnapshot != null
        ? (matchStatSnapshot.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addMatchStatSnapshotStructData(
  Map<String, dynamic> firestoreData,
  MatchStatSnapshotStruct? matchStatSnapshot,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (matchStatSnapshot == null) {
    return;
  }
  if (matchStatSnapshot.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && matchStatSnapshot.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final matchStatSnapshotData =
      getMatchStatSnapshotFirestoreData(matchStatSnapshot, forFieldValue);
  final nestedData =
      matchStatSnapshotData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = matchStatSnapshot.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getMatchStatSnapshotFirestoreData(
  MatchStatSnapshotStruct? matchStatSnapshot, [
  bool forFieldValue = false,
]) {
  if (matchStatSnapshot == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(
      MatchStatSnapshotStruct.serializer, matchStatSnapshot);

  // Add any Firestore field values
  matchStatSnapshot.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMatchStatSnapshotListFirestoreData(
  List<MatchStatSnapshotStruct>? matchStatSnapshots,
) =>
    matchStatSnapshots
        ?.map((m) => getMatchStatSnapshotFirestoreData(m, true))
        .toList() ??
    [];
