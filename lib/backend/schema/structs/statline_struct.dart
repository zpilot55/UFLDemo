import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'statline_struct.g.dart';

abstract class StatlineStruct
    implements Built<StatlineStruct, StatlineStructBuilder> {
  static Serializer<StatlineStruct> get serializer =>
      _$statlineStructSerializer;

  @BuiltValueField(wireName: 'Label')
  String? get label;

  @BuiltValueField(wireName: 'LeftStat')
  double? get leftStat;

  @BuiltValueField(wireName: 'RightStat')
  double? get rightStat;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(StatlineStructBuilder builder) => builder
    ..label = ''
    ..leftStat = 0.0
    ..rightStat = 0.0
    ..firestoreUtilData = FirestoreUtilData();

  StatlineStruct._();
  factory StatlineStruct([void Function(StatlineStructBuilder) updates]) =
      _$StatlineStruct;
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
      (s) => s
        ..label = label
        ..leftStat = leftStat
        ..rightStat = rightStat
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

StatlineStruct? updateStatlineStruct(
  StatlineStruct? statline, {
  bool clearUnsetFields = true,
}) =>
    statline != null
        ? (statline.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

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
  if (!forFieldValue && statline.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final statlineData = getStatlineFirestoreData(statline, forFieldValue);
  final nestedData = statlineData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = statline.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getStatlineFirestoreData(
  StatlineStruct? statline, [
  bool forFieldValue = false,
]) {
  if (statline == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(StatlineStruct.serializer, statline);

  // Add any Firestore field values
  statline.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStatlineListFirestoreData(
  List<StatlineStruct>? statlines,
) =>
    statlines?.map((s) => getStatlineFirestoreData(s, true)).toList() ?? [];
