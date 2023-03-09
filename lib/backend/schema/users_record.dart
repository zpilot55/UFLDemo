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

  bool? get existingUser;

  DateTime? get dob;

  String? get homecountry;

  int? get numRankedFA;

  int? get numRankedFY;

  int? get numRankedEA;

  int? get numRankedEY;

  int? get numRankedSA;

  int? get numRankedSY;

  int? get numRankedNA;

  int? get numRankedNY;

  DocumentReference? get rankingsPage;

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
    ..existingUser = false
    ..homecountry = ''
    ..numRankedFA = 0
    ..numRankedFY = 0
    ..numRankedEA = 0
    ..numRankedEY = 0
    ..numRankedSA = 0
    ..numRankedSY = 0
    ..numRankedNA = 0
    ..numRankedNY = 0;

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
  bool? existingUser,
  DateTime? dob,
  String? homecountry,
  int? numRankedFA,
  int? numRankedFY,
  int? numRankedEA,
  int? numRankedEY,
  int? numRankedSA,
  int? numRankedSY,
  int? numRankedNA,
  int? numRankedNY,
  DocumentReference? rankingsPage,
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
        ..existingUser = existingUser
        ..dob = dob
        ..homecountry = homecountry
        ..numRankedFA = numRankedFA
        ..numRankedFY = numRankedFY
        ..numRankedEA = numRankedEA
        ..numRankedEY = numRankedEY
        ..numRankedSA = numRankedSA
        ..numRankedSY = numRankedSY
        ..numRankedNA = numRankedNA
        ..numRankedNY = numRankedNY
        ..rankingsPage = rankingsPage,
    ),
  );

  return firestoreData;
}
