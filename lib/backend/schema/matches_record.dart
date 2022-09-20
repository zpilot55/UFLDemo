import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'matches_record.g.dart';

abstract class MatchesRecord
    implements Built<MatchesRecord, MatchesRecordBuilder> {
  static Serializer<MatchesRecord> get serializer => _$matchesRecordSerializer;

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

  @BuiltValueField(wireName: 'MatchEvents')
  BuiltList<MatchEventStruct>? get matchEvents;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MatchesRecordBuilder builder) => builder
    ..noOfPeriods = 0
    ..weapon = ''
    ..fencers = ListBuilder()
    ..scoreLeft = 0
    ..scoreRight = 0
    ..matchEvents = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('matches');

  static Stream<MatchesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MatchesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MatchesRecord._();
  factory MatchesRecord([void Function(MatchesRecordBuilder) updates]) =
      _$MatchesRecord;

  static MatchesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMatchesRecordData({
  DocumentReference? user1,
  DocumentReference? user2,
  DateTime? scheduledTime,
  int? noOfPeriods,
  String? weapon,
  LatLng? location,
  int? scoreLeft,
  int? scoreRight,
}) {
  final firestoreData = serializers.toFirestore(
    MatchesRecord.serializer,
    MatchesRecord(
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
        ..matchEvents = null,
    ),
  );

  return firestoreData;
}
