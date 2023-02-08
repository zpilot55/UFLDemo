import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'matches_dev_record.g.dart';

abstract class MatchesDevRecord
    implements Built<MatchesDevRecord, MatchesDevRecordBuilder> {
  static Serializer<MatchesDevRecord> get serializer =>
      _$matchesDevRecordSerializer;

  DocumentReference? get user1;

  DocumentReference? get user2;

  @BuiltValueField(wireName: 'scheduled_time')
  DateTime? get scheduledTime;

  @BuiltValueField(wireName: 'no_of_periods')
  int? get noOfPeriods;

  String? get weapon;

  LatLng? get location;

  BuiltList<DocumentReference>? get fencers;

  @BuiltValueField(wireName: 'ScoreLeft')
  int? get scoreLeft;

  @BuiltValueField(wireName: 'ScoreRight')
  int? get scoreRight;

  @BuiltValueField(wireName: 'MatchDetails')
  DocumentReference? get matchDetails;

  @BuiltValueField(wireName: 'MatchStatsLog')
  DocumentReference? get matchStatsLog;

  @BuiltValueField(wireName: 'MatchRanking')
  String? get matchRanking;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MatchesDevRecordBuilder builder) => builder
    ..noOfPeriods = 0
    ..weapon = ''
    ..fencers = ListBuilder()
    ..scoreLeft = 0
    ..scoreRight = 0
    ..matchRanking = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('matches_dev');

  static Stream<MatchesDevRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MatchesDevRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MatchesDevRecord._();
  factory MatchesDevRecord([void Function(MatchesDevRecordBuilder) updates]) =
      _$MatchesDevRecord;

  static MatchesDevRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMatchesDevRecordData({
  DocumentReference? user1,
  DocumentReference? user2,
  DateTime? scheduledTime,
  int? noOfPeriods,
  String? weapon,
  LatLng? location,
  int? scoreLeft,
  int? scoreRight,
  DocumentReference? matchDetails,
  DocumentReference? matchStatsLog,
  String? matchRanking,
}) {
  final firestoreData = serializers.toFirestore(
    MatchesDevRecord.serializer,
    MatchesDevRecord(
      (m) => m
        ..user1 = user1
        ..user2 = user2
        ..scheduledTime = scheduledTime
        ..noOfPeriods = noOfPeriods
        ..weapon = weapon
        ..location = location
        ..fencers = null
        ..scoreLeft = scoreLeft
        ..scoreRight = scoreRight
        ..matchDetails = matchDetails
        ..matchStatsLog = matchStatsLog
        ..matchRanking = matchRanking,
    ),
  );

  return firestoreData;
}
