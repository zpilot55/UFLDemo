// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatchEventStruct extends FFFirebaseStruct {
  MatchEventStruct({
    DocumentReference? actionableFencer,
    int? scoreLeft,
    int? scoreRight,
    int? timeOfAction,
    int? periodOfAction,
    int? actionID,
    String? videoURL,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _actionableFencer = actionableFencer,
        _scoreLeft = scoreLeft,
        _scoreRight = scoreRight,
        _timeOfAction = timeOfAction,
        _periodOfAction = periodOfAction,
        _actionID = actionID,
        _videoURL = videoURL,
        super(firestoreUtilData);

  // "actionableFencer" field.
  DocumentReference? _actionableFencer;
  DocumentReference? get actionableFencer => _actionableFencer;
  set actionableFencer(DocumentReference? val) => _actionableFencer = val;
  bool hasActionableFencer() => _actionableFencer != null;

  // "scoreLeft" field.
  int? _scoreLeft;
  int get scoreLeft => _scoreLeft ?? 0;
  set scoreLeft(int? val) => _scoreLeft = val;
  void incrementScoreLeft(int amount) => _scoreLeft = scoreLeft + amount;
  bool hasScoreLeft() => _scoreLeft != null;

  // "scoreRight" field.
  int? _scoreRight;
  int get scoreRight => _scoreRight ?? 0;
  set scoreRight(int? val) => _scoreRight = val;
  void incrementScoreRight(int amount) => _scoreRight = scoreRight + amount;
  bool hasScoreRight() => _scoreRight != null;

  // "timeOfAction" field.
  int? _timeOfAction;
  int get timeOfAction => _timeOfAction ?? 0;
  set timeOfAction(int? val) => _timeOfAction = val;
  void incrementTimeOfAction(int amount) =>
      _timeOfAction = timeOfAction + amount;
  bool hasTimeOfAction() => _timeOfAction != null;

  // "periodOfAction" field.
  int? _periodOfAction;
  int get periodOfAction => _periodOfAction ?? 0;
  set periodOfAction(int? val) => _periodOfAction = val;
  void incrementPeriodOfAction(int amount) =>
      _periodOfAction = periodOfAction + amount;
  bool hasPeriodOfAction() => _periodOfAction != null;

  // "actionID" field.
  int? _actionID;
  int get actionID => _actionID ?? 0;
  set actionID(int? val) => _actionID = val;
  void incrementActionID(int amount) => _actionID = actionID + amount;
  bool hasActionID() => _actionID != null;

  // "videoURL" field.
  String? _videoURL;
  String get videoURL => _videoURL ?? '';
  set videoURL(String? val) => _videoURL = val;
  bool hasVideoURL() => _videoURL != null;

  static MatchEventStruct fromMap(Map<String, dynamic> data) =>
      MatchEventStruct(
        actionableFencer: data['actionableFencer'] as DocumentReference?,
        scoreLeft: castToType<int>(data['scoreLeft']),
        scoreRight: castToType<int>(data['scoreRight']),
        timeOfAction: castToType<int>(data['timeOfAction']),
        periodOfAction: castToType<int>(data['periodOfAction']),
        actionID: castToType<int>(data['actionID']),
        videoURL: data['videoURL'] as String?,
      );

  static MatchEventStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MatchEventStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'actionableFencer': _actionableFencer,
        'scoreLeft': _scoreLeft,
        'scoreRight': _scoreRight,
        'timeOfAction': _timeOfAction,
        'periodOfAction': _periodOfAction,
        'actionID': _actionID,
        'videoURL': _videoURL,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
  static MatchEventStruct fromSerializableMap(Map<String, dynamic> data) =>
      fromMap(data);

  @override
  String toString() => 'MatchEventStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MatchEventStruct &&
        actionableFencer == other.actionableFencer &&
        scoreLeft == other.scoreLeft &&
        scoreRight == other.scoreRight &&
        timeOfAction == other.timeOfAction &&
        periodOfAction == other.periodOfAction &&
        actionID == other.actionID &&
        videoURL == other.videoURL;
  }

  @override
  int get hashCode => const ListEquality().hash([
        actionableFencer,
        scoreLeft,
        scoreRight,
        timeOfAction,
        periodOfAction,
        actionID,
        videoURL
      ]);
}

MatchEventStruct createMatchEventStruct({
  DocumentReference? actionableFencer,
  int? scoreLeft,
  int? scoreRight,
  int? timeOfAction,
  int? periodOfAction,
  int? actionID,
  String? videoURL,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MatchEventStruct(
      actionableFencer: actionableFencer,
      scoreLeft: scoreLeft,
      scoreRight: scoreRight,
      timeOfAction: timeOfAction,
      periodOfAction: periodOfAction,
      actionID: actionID,
      videoURL: videoURL,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MatchEventStruct? updateMatchEventStruct(
  MatchEventStruct? matchEvent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    matchEvent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

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
  final clearFields =
      !forFieldValue && matchEvent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final matchEventData = getMatchEventFirestoreData(matchEvent, forFieldValue);
  final nestedData = matchEventData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = matchEvent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMatchEventFirestoreData(
  MatchEventStruct? matchEvent, [
  bool forFieldValue = false,
]) {
  if (matchEvent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(matchEvent.toMap());

  // Add any Firestore field values
  matchEvent.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMatchEventListFirestoreData(
  List<MatchEventStruct>? matchEvents,
) =>
    matchEvents?.map((e) => getMatchEventFirestoreData(e, true)).toList() ?? [];
