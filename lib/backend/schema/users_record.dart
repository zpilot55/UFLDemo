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

  @BuiltValueField(wireName: 'elo_FA')
  int? get eloFA;

  @BuiltValueField(wireName: 'elo_FY')
  int? get eloFY;

  @BuiltValueField(wireName: 'elo_EA')
  int? get eloEA;

  @BuiltValueField(wireName: 'elo_EY')
  int? get eloEY;

  @BuiltValueField(wireName: 'elo_SA')
  int? get eloSA;

  @BuiltValueField(wireName: 'elo_SY')
  int? get eloSY;

  @BuiltValueField(wireName: 'elo_NA')
  int? get eloNA;

  @BuiltValueField(wireName: 'elo_NY')
  int? get eloNY;

  bool? get isYouth;

  int? get matchesUntilRankedAdult;

  int? get matchesUntilRankedYouth;

  bool? get existingUser;

  DateTime? get dob;

  String? get homecountry;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..eloFA = 0
    ..eloFY = 0
    ..eloEA = 0
    ..eloEY = 0
    ..eloSA = 0
    ..eloSY = 0
    ..eloNA = 0
    ..eloNY = 0
    ..isYouth = false
    ..matchesUntilRankedAdult = 0
    ..matchesUntilRankedYouth = 0
    ..existingUser = false
    ..homecountry = '';

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
  int? eloFA,
  int? eloFY,
  int? eloEA,
  int? eloEY,
  int? eloSA,
  int? eloSY,
  int? eloNA,
  int? eloNY,
  bool? isYouth,
  int? matchesUntilRankedAdult,
  int? matchesUntilRankedYouth,
  bool? existingUser,
  DateTime? dob,
  String? homecountry,
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
        ..eloFA = eloFA
        ..eloFY = eloFY
        ..eloEA = eloEA
        ..eloEY = eloEY
        ..eloSA = eloSA
        ..eloSY = eloSY
        ..eloNA = eloNA
        ..eloNY = eloNY
        ..isYouth = isYouth
        ..matchesUntilRankedAdult = matchesUntilRankedAdult
        ..matchesUntilRankedYouth = matchesUntilRankedYouth
        ..existingUser = existingUser
        ..dob = dob
        ..homecountry = homecountry,
    ),
  );

  return firestoreData;
}
