import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'match_statistics_struct.g.dart';

abstract class MatchStatisticsStruct
    implements Built<MatchStatisticsStruct, MatchStatisticsStructBuilder> {
  static Serializer<MatchStatisticsStruct> get serializer =>
      _$matchStatisticsStructSerializer;

  @BuiltValueField(wireName: 'p1points_L')
  int? get p1pointsL;

  @BuiltValueField(wireName: 'p1points_R')
  int? get p1pointsR;

  @BuiltValueField(wireName: 'p2points_L')
  int? get p2pointsL;

  @BuiltValueField(wireName: 'p2points_R')
  int? get p2pointsR;

  @BuiltValueField(wireName: 'p3points_L')
  int? get p3pointsL;

  @BuiltValueField(wireName: 'p3points_R')
  int? get p3pointsR;

  @BuiltValueField(wireName: 'ActionPer_L')
  double? get actionPerL;

  @BuiltValueField(wireName: 'ActionPer_R')
  double? get actionPerR;

  @BuiltValueField(wireName: 'HOTRatio_L')
  double? get hOTRatioL;

  @BuiltValueField(wireName: 'HOTRatio_R')
  double? get hOTRatioR;

  @BuiltValueField(wireName: 'ROWRatio_L')
  double? get rOWRatioL;

  @BuiltValueField(wireName: 'ROWRatio_R')
  double? get rOWRatioR;

  @BuiltValueField(wireName: 'SIMULPer')
  double? get sIMULPer;

  @BuiltValueField(wireName: 'AggroRatio_L')
  double? get aggroRatioL;

  @BuiltValueField(wireName: 'AggroRatio_R')
  double? get aggroRatioR;

  @BuiltValueField(wireName: 'numRed_L')
  int? get numRedL;

  @BuiltValueField(wireName: 'numRed_R')
  int? get numRedR;

  @BuiltValueField(wireName: 'numYellow_L')
  int? get numYellowL;

  @BuiltValueField(wireName: 'numYellow_R')
  int? get numYellowR;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(MatchStatisticsStructBuilder builder) =>
      builder
        ..p1pointsL = 0
        ..p1pointsR = 0
        ..p2pointsL = 0
        ..p2pointsR = 0
        ..p3pointsL = 0
        ..p3pointsR = 0
        ..actionPerL = 0.0
        ..actionPerR = 0.0
        ..hOTRatioL = 0.0
        ..hOTRatioR = 0.0
        ..rOWRatioL = 0.0
        ..rOWRatioR = 0.0
        ..sIMULPer = 0.0
        ..aggroRatioL = 0.0
        ..aggroRatioR = 0.0
        ..numRedL = 0
        ..numRedR = 0
        ..numYellowL = 0
        ..numYellowR = 0
        ..firestoreUtilData = FirestoreUtilData();

  MatchStatisticsStruct._();
  factory MatchStatisticsStruct(
          [void Function(MatchStatisticsStructBuilder) updates]) =
      _$MatchStatisticsStruct;
}

MatchStatisticsStruct createMatchStatisticsStruct({
  int? p1pointsL,
  int? p1pointsR,
  int? p2pointsL,
  int? p2pointsR,
  int? p3pointsL,
  int? p3pointsR,
  double? actionPerL,
  double? actionPerR,
  double? hOTRatioL,
  double? hOTRatioR,
  double? rOWRatioL,
  double? rOWRatioR,
  double? sIMULPer,
  double? aggroRatioL,
  double? aggroRatioR,
  int? numRedL,
  int? numRedR,
  int? numYellowL,
  int? numYellowR,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MatchStatisticsStruct(
      (m) => m
        ..p1pointsL = p1pointsL
        ..p1pointsR = p1pointsR
        ..p2pointsL = p2pointsL
        ..p2pointsR = p2pointsR
        ..p3pointsL = p3pointsL
        ..p3pointsR = p3pointsR
        ..actionPerL = actionPerL
        ..actionPerR = actionPerR
        ..hOTRatioL = hOTRatioL
        ..hOTRatioR = hOTRatioR
        ..rOWRatioL = rOWRatioL
        ..rOWRatioR = rOWRatioR
        ..sIMULPer = sIMULPer
        ..aggroRatioL = aggroRatioL
        ..aggroRatioR = aggroRatioR
        ..numRedL = numRedL
        ..numRedR = numRedR
        ..numYellowL = numYellowL
        ..numYellowR = numYellowR
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

MatchStatisticsStruct? updateMatchStatisticsStruct(
  MatchStatisticsStruct? matchStatistics, {
  bool clearUnsetFields = true,
}) =>
    matchStatistics != null
        ? (matchStatistics.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addMatchStatisticsStructData(
  Map<String, dynamic> firestoreData,
  MatchStatisticsStruct? matchStatistics,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (matchStatistics == null) {
    return;
  }
  if (matchStatistics.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && matchStatistics.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final matchStatisticsData =
      getMatchStatisticsFirestoreData(matchStatistics, forFieldValue);
  final nestedData =
      matchStatisticsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = matchStatistics.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getMatchStatisticsFirestoreData(
  MatchStatisticsStruct? matchStatistics, [
  bool forFieldValue = false,
]) {
  if (matchStatistics == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(
      MatchStatisticsStruct.serializer, matchStatistics);

  // Add any Firestore field values
  matchStatistics.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMatchStatisticsListFirestoreData(
  List<MatchStatisticsStruct>? matchStatisticss,
) =>
    matchStatisticss
        ?.map((m) => getMatchStatisticsFirestoreData(m, true))
        .toList() ??
    [];
