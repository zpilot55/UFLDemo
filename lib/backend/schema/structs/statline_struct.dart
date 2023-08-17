// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatlineStruct extends FFFirebaseStruct {
  StatlineStruct({
    String? label,
    double? leftStat,
    double? rightStat,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _label = label,
        _leftStat = leftStat,
        _rightStat = rightStat,
        super(firestoreUtilData);

  // "Label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;
  bool hasLabel() => _label != null;

  // "LeftStat" field.
  double? _leftStat;
  double get leftStat => _leftStat ?? 0.0;
  set leftStat(double? val) => _leftStat = val;
  void incrementLeftStat(double amount) => _leftStat = leftStat + amount;
  bool hasLeftStat() => _leftStat != null;

  // "RightStat" field.
  double? _rightStat;
  double get rightStat => _rightStat ?? 0.0;
  set rightStat(double? val) => _rightStat = val;
  void incrementRightStat(double amount) => _rightStat = rightStat + amount;
  bool hasRightStat() => _rightStat != null;

  static StatlineStruct fromMap(Map<String, dynamic> data) => StatlineStruct(
        label: data['Label'] as String?,
        leftStat: castToType<double>(data['LeftStat']),
        rightStat: castToType<double>(data['RightStat']),
      );

  static StatlineStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? StatlineStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Label': _label,
        'LeftStat': _leftStat,
        'RightStat': _rightStat,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
  static StatlineStruct fromSerializableMap(Map<String, dynamic> data) =>
      fromMap(data);

  @override
  String toString() => 'StatlineStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StatlineStruct &&
        label == other.label &&
        leftStat == other.leftStat &&
        rightStat == other.rightStat;
  }

  @override
  int get hashCode => const ListEquality().hash([label, leftStat, rightStat]);
}

StatlineStruct createStatlineStruct({
  String? label,
  double? leftStat,
  double? rightStat,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StatlineStruct(
      label: label,
      leftStat: leftStat,
      rightStat: rightStat,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StatlineStruct? updateStatlineStruct(
  StatlineStruct? statline, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    statline
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStatlineStructData(
  Map<String, dynamic> firestoreData,
  StatlineStruct? statline,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (statline == null) {
    return;
  }
  if (statline.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && statline.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final statlineData = getStatlineFirestoreData(statline, forFieldValue);
  final nestedData = statlineData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = statline.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStatlineFirestoreData(
  StatlineStruct? statline, [
  bool forFieldValue = false,
]) {
  if (statline == null) {
    return {};
  }
  final firestoreData = mapToFirestore(statline.toMap());

  // Add any Firestore field values
  statline.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStatlineListFirestoreData(
  List<StatlineStruct>? statlines,
) =>
    statlines?.map((e) => getStatlineFirestoreData(e, true)).toList() ?? [];
