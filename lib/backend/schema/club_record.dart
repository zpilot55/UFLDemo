import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'club_record.g.dart';

abstract class ClubRecord implements Built<ClubRecord, ClubRecordBuilder> {
  static Serializer<ClubRecord> get serializer => _$clubRecordSerializer;

  String? get name;

  LatLng? get location;

  @BuiltValueField(wireName: 'founding_date')
  DateTime? get foundingDate;

  DocumentReference? get coach1;

  DocumentReference? get coach2;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ClubRecordBuilder builder) =>
      builder..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('club');

  static Stream<ClubRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ClubRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ClubRecord._();
  factory ClubRecord([void Function(ClubRecordBuilder) updates]) = _$ClubRecord;

  static ClubRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createClubRecordData({
  String? name,
  LatLng? location,
  DateTime? foundingDate,
  DocumentReference? coach1,
  DocumentReference? coach2,
}) {
  final firestoreData = serializers.toFirestore(
    ClubRecord.serializer,
    ClubRecord(
      (c) => c
        ..name = name
        ..location = location
        ..foundingDate = foundingDate
        ..coach1 = coach1
        ..coach2 = coach2,
    ),
  );

  return firestoreData;
}
