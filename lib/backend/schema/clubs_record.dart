import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'clubs_record.g.dart';

abstract class ClubsRecord implements Built<ClubsRecord, ClubsRecordBuilder> {
  static Serializer<ClubsRecord> get serializer => _$clubsRecordSerializer;

  String? get name;

  LatLng? get location;

  @BuiltValueField(wireName: 'founding_date')
  DateTime? get foundingDate;

  DocumentReference? get coach1;

  DocumentReference? get coach2;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ClubsRecordBuilder builder) =>
      builder..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('clubs');

  static Stream<ClubsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ClubsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ClubsRecord._();
  factory ClubsRecord([void Function(ClubsRecordBuilder) updates]) =
      _$ClubsRecord;

  static ClubsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createClubsRecordData({
  String? name,
  LatLng? location,
  DateTime? foundingDate,
  DocumentReference? coach1,
  DocumentReference? coach2,
}) {
  final firestoreData = serializers.toFirestore(
    ClubsRecord.serializer,
    ClubsRecord(
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
