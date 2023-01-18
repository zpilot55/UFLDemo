import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'elo_adult')
  int? get eloAdult;

  @BuiltValueField(wireName: 'elo_youth')
  int? get eloYouth;

  @BuiltValueField(wireName: 'matchesUntilRanked_adult')
  int? get matchesUntilRankedAdult;

  @BuiltValueField(wireName: 'matchesUntilRanked_youth')
  int? get matchesUntilRankedYouth;

  @BuiltValueField(wireName: 'isRanked_adult')
  bool? get isRankedAdult;

  @BuiltValueField(wireName: 'isRanked_youth')
  bool? get isRankedYouth;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..eloAdult = 0
    ..eloYouth = 0
    ..matchesUntilRankedAdult = 0
    ..matchesUntilRankedYouth = 0
    ..isRankedAdult = false
    ..isRankedYouth = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  int? eloAdult,
  int? eloYouth,
  int? matchesUntilRankedAdult,
  int? matchesUntilRankedYouth,
  bool? isRankedAdult,
  bool? isRankedYouth,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..eloAdult = eloAdult
        ..eloYouth = eloYouth
        ..matchesUntilRankedAdult = matchesUntilRankedAdult
        ..matchesUntilRankedYouth = matchesUntilRankedYouth
        ..isRankedAdult = isRankedAdult
        ..isRankedYouth = isRankedYouth,
    ),
  );

  return firestoreData;
}
