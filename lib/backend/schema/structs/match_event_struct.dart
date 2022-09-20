import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'match_event_struct.g.dart';

abstract class MatchEventStruct
    implements Built<MatchEventStruct, MatchEventStructBuilder> {
  static Serializer<MatchEventStruct> get serializer =>
      _$matchEventStructSerializer;

  DocumentReference? get actionableFencer;

  int? get scoreLeft;

  int? get scoreRight;

  int? get timeOfAction;

  int? get periodOfAction;

  int? get actionID;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(MatchEventStructBuilder builder) => builder
    ..scoreLeft = 0
    ..scoreRight = 0
    ..timeOfAction = 0
    ..periodOfAction = 0
    ..actionID = 0
    ..firestoreUtilData = FirestoreUtilData();

  MatchEventStruct._();
  factory MatchEventStruct([void Function(MatchEventStructBuilder) updates]) =
      _$MatchEventStruct;
}

MatchEventStruct createMatchEventStruct({
  DocumentReference? actionableFencer,
  int? scoreLeft,
  int? scoreRight,
  int? timeOfAction,
  int? periodOfAction,
  int? actionID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MatchEventStruct(
      (m) => m
        ..actionableFencer = actionableFencer
        ..scoreLeft = scoreLeft
        ..scoreRight = scoreRight
        ..timeOfAction = timeOfAction
        ..periodOfAction = periodOfAction
        ..actionID = actionID
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

MatchEventStruct? updateMatchEventStruct(
  MatchEventStruct? matchEvent, {
  bool clearUnsetFields = true,
}) =>
    matchEvent != null
        ? (matchEvent.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addMatchEventStructData(
  Map<String, dynamic> firestoreData,
  MatchEventStruct? matchEvent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (matchEvent == null) {
    return;
  }
  if (matchEvent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && matchEvent.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final matchEventData = getMatchEventFirestoreData(matchEvent, forFieldValue);
  final nestedData = matchEventData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = matchEvent.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getMatchEventFirestoreData(
  MatchEventStruct? matchEvent, [
  bool forFieldValue = false,
]) {
  if (matchEvent == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(MatchEventStruct.serializer, matchEvent);

  // Add any Firestore field values
  matchEvent.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMatchEventListFirestoreData(
  List<MatchEventStruct>? matchEvents,
) =>
    matchEvents?.map((m) => getMatchEventFirestoreData(m, true)).toList() ?? [];
