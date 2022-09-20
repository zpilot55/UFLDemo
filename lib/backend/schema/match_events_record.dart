import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'match_events_record.g.dart';

abstract class MatchEventsRecord
    implements Built<MatchEventsRecord, MatchEventsRecordBuilder> {
  static Serializer<MatchEventsRecord> get serializer =>
      _$matchEventsRecordSerializer;

  int? get actionID;

  DocumentReference? get actionableFencer;

  int? get periodOfAction;

  int? get scoreLeft;

  int? get scoreRight;

  int? get timeOfAction;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(MatchEventsRecordBuilder builder) => builder
    ..actionID = 0
    ..periodOfAction = 0
    ..scoreLeft = 0
    ..scoreRight = 0
    ..timeOfAction = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('MatchEvents')
          : FirebaseFirestore.instance.collectionGroup('MatchEvents');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('MatchEvents').doc();

  static Stream<MatchEventsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MatchEventsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MatchEventsRecord._();
  factory MatchEventsRecord([void Function(MatchEventsRecordBuilder) updates]) =
      _$MatchEventsRecord;

  static MatchEventsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMatchEventsRecordData({
  int? actionID,
  DocumentReference? actionableFencer,
  int? periodOfAction,
  int? scoreLeft,
  int? scoreRight,
  int? timeOfAction,
}) {
  final firestoreData = serializers.toFirestore(
    MatchEventsRecord.serializer,
    MatchEventsRecord(
      (m) => m
        ..actionID = actionID
        ..actionableFencer = actionableFencer
        ..periodOfAction = periodOfAction
        ..scoreLeft = scoreLeft
        ..scoreRight = scoreRight
        ..timeOfAction = timeOfAction,
    ),
  );

  return firestoreData;
}
