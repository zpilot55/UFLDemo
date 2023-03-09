import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'ranking_struct_struct.g.dart';

abstract class RankingStructStruct
    implements Built<RankingStructStruct, RankingStructStructBuilder> {
  static Serializer<RankingStructStruct> get serializer =>
      _$rankingStructStructSerializer;

  DocumentReference? get fencer;

  @BuiltValueField(wireName: 'elo_FA')
  int? get eloFA;

  @BuiltValueField(wireName: 'elo_FY')
  int? get eloFY;

  @BuiltValueField(wireName: 'elo_EA')
  int? get eloEA;

  @BuiltValueField(wireName: 'elo_EY')
  int? get eloEY;

  @BuiltValueField(wireName: 'elo_SA')
  int? get eloSA;

  @BuiltValueField(wireName: 'elo_SY')
  int? get eloSY;

  @BuiltValueField(wireName: 'elo_NA')
  int? get eloNA;

  @BuiltValueField(wireName: 'elo_NY')
  int? get eloNY;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(RankingStructStructBuilder builder) => builder
    ..eloFA = 0
    ..eloFY = 0
    ..eloEA = 0
    ..eloEY = 0
    ..eloSA = 0
    ..eloSY = 0
    ..eloNA = 0
    ..eloNY = 0
    ..firestoreUtilData = FirestoreUtilData();

  RankingStructStruct._();
  factory RankingStructStruct(
          [void Function(RankingStructStructBuilder) updates]) =
      _$RankingStructStruct;
}

RankingStructStruct createRankingStructStruct({
  DocumentReference? fencer,
  int? eloFA,
  int? eloFY,
  int? eloEA,
  int? eloEY,
  int? eloSA,
  int? eloSY,
  int? eloNA,
  int? eloNY,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RankingStructStruct(
      (r) => r
        ..fencer = fencer
        ..eloFA = eloFA
        ..eloFY = eloFY
        ..eloEA = eloEA
        ..eloEY = eloEY
        ..eloSA = eloSA
        ..eloSY = eloSY
        ..eloNA = eloNA
        ..eloNY = eloNY
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

RankingStructStruct? updateRankingStructStruct(
  RankingStructStruct? rankingStruct, {
  bool clearUnsetFields = true,
}) =>
    rankingStruct != null
        ? (rankingStruct.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addRankingStructStructData(
  Map<String, dynamic> firestoreData,
  RankingStructStruct? rankingStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (rankingStruct == null) {
    return;
  }
  if (rankingStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && rankingStruct.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final rankingStructData =
      getRankingStructFirestoreData(rankingStruct, forFieldValue);
  final nestedData =
      rankingStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = rankingStruct.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getRankingStructFirestoreData(
  RankingStructStruct? rankingStruct, [
  bool forFieldValue = false,
]) {
  if (rankingStruct == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(RankingStructStruct.serializer, rankingStruct);

  // Add any Firestore field values
  rankingStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRankingStructListFirestoreData(
  List<RankingStructStruct>? rankingStructs,
) =>
    rankingStructs
        ?.map((r) => getRankingStructFirestoreData(r, true))
        .toList() ??
    [];
