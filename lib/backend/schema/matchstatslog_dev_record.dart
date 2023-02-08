import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'matchstatslog_dev_record.g.dart';

abstract class MatchstatslogDevRecord
    implements Built<MatchstatslogDevRecord, MatchstatslogDevRecordBuilder> {
  static Serializer<MatchstatslogDevRecord> get serializer =>
      _$matchstatslogDevRecordSerializer;

  @BuiltValueField(wireName: 'MatchStats')
  BuiltList<MatchStatSnapshotStruct>? get matchStats;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MatchstatslogDevRecordBuilder builder) =>
      builder..matchStats = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('matchstatslog_dev');

  static Stream<MatchstatslogDevRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MatchstatslogDevRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MatchstatslogDevRecord._();
  factory MatchstatslogDevRecord(
          [void Function(MatchstatslogDevRecordBuilder) updates]) =
      _$MatchstatslogDevRecord;

  static MatchstatslogDevRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMatchstatslogDevRecordData() {
  final firestoreData = serializers.toFirestore(
    MatchstatslogDevRecord.serializer,
    MatchstatslogDevRecord(
      (m) => m..matchStats = null,
    ),
  );

  return firestoreData;
}
