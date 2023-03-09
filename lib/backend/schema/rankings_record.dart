import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'rankings_record.g.dart';

abstract class RankingsRecord
    implements Built<RankingsRecord, RankingsRecordBuilder> {
  static Serializer<RankingsRecord> get serializer =>
      _$rankingsRecordSerializer;

  RankingStructStruct get fencerRankings;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RankingsRecordBuilder builder) =>
      builder..fencerRankings = RankingStructStructBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rankings');

  static Stream<RankingsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RankingsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RankingsRecord._();
  factory RankingsRecord([void Function(RankingsRecordBuilder) updates]) =
      _$RankingsRecord;

  static RankingsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRankingsRecordData({
  RankingStructStruct? fencerRankings,
}) {
  final firestoreData = serializers.toFirestore(
    RankingsRecord.serializer,
    RankingsRecord(
      (r) => r..fencerRankings = RankingStructStructBuilder(),
    ),
  );

  // Handle nested data for "fencerRankings" field.
  addRankingStructStructData(firestoreData, fencerRankings, 'fencerRankings');

  return firestoreData;
}
