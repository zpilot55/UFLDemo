import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'matchdetails_dev_record.g.dart';

abstract class MatchdetailsDevRecord
    implements Built<MatchdetailsDevRecord, MatchdetailsDevRecordBuilder> {
  static Serializer<MatchdetailsDevRecord> get serializer =>
      _$matchdetailsDevRecordSerializer;

  @BuiltValueField(wireName: 'MatchEvents')
  BuiltList<MatchEventStruct>? get matchEvents;

  @BuiltValueField(wireName: 'OverallStats')
  PeriodStatsStruct get overallStats;

  @BuiltValueField(wireName: 'PeriodStats')
  BuiltList<PeriodStatsStruct>? get periodStats;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MatchdetailsDevRecordBuilder builder) =>
      builder
        ..matchEvents = ListBuilder()
        ..overallStats = PeriodStatsStructBuilder()
        ..periodStats = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('matchdetails_dev');

  static Stream<MatchdetailsDevRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MatchdetailsDevRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MatchdetailsDevRecord._();
  factory MatchdetailsDevRecord(
          [void Function(MatchdetailsDevRecordBuilder) updates]) =
      _$MatchdetailsDevRecord;

  static MatchdetailsDevRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMatchdetailsDevRecordData({
  PeriodStatsStruct? overallStats,
}) {
  final firestoreData = serializers.toFirestore(
    MatchdetailsDevRecord.serializer,
    MatchdetailsDevRecord(
      (m) => m
        ..matchEvents = null
        ..overallStats = PeriodStatsStructBuilder()
        ..periodStats = null,
    ),
  );

  // Handle nested data for "OverallStats" field.
  addPeriodStatsStructData(firestoreData, overallStats, 'OverallStats');

  return firestoreData;
}
