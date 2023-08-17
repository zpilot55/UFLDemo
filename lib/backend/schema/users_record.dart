import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "elo_FA" field.
  int? _eloFA;
  int get eloFA => _eloFA ?? 0;
  bool hasEloFA() => _eloFA != null;

  // "elo_FY" field.
  int? _eloFY;
  int get eloFY => _eloFY ?? 0;
  bool hasEloFY() => _eloFY != null;

  // "elo_EA" field.
  int? _eloEA;
  int get eloEA => _eloEA ?? 0;
  bool hasEloEA() => _eloEA != null;

  // "elo_EY" field.
  int? _eloEY;
  int get eloEY => _eloEY ?? 0;
  bool hasEloEY() => _eloEY != null;

  // "elo_SA" field.
  int? _eloSA;
  int get eloSA => _eloSA ?? 0;
  bool hasEloSA() => _eloSA != null;

  // "elo_SY" field.
  int? _eloSY;
  int get eloSY => _eloSY ?? 0;
  bool hasEloSY() => _eloSY != null;

  // "elo_NA" field.
  int? _eloNA;
  int get eloNA => _eloNA ?? 0;
  bool hasEloNA() => _eloNA != null;

  // "elo_NY" field.
  int? _eloNY;
  int get eloNY => _eloNY ?? 0;
  bool hasEloNY() => _eloNY != null;

  // "isYouth" field.
  bool? _isYouth;
  bool get isYouth => _isYouth ?? false;
  bool hasIsYouth() => _isYouth != null;

  // "existingUser" field.
  bool? _existingUser;
  bool get existingUser => _existingUser ?? false;
  bool hasExistingUser() => _existingUser != null;

  // "dob" field.
  DateTime? _dob;
  DateTime? get dob => _dob;
  bool hasDob() => _dob != null;

  // "homecountry" field.
  String? _homecountry;
  String get homecountry => _homecountry ?? '';
  bool hasHomecountry() => _homecountry != null;

  // "numRankedFA" field.
  int? _numRankedFA;
  int get numRankedFA => _numRankedFA ?? 0;
  bool hasNumRankedFA() => _numRankedFA != null;

  // "numRankedFY" field.
  int? _numRankedFY;
  int get numRankedFY => _numRankedFY ?? 0;
  bool hasNumRankedFY() => _numRankedFY != null;

  // "numRankedEA" field.
  int? _numRankedEA;
  int get numRankedEA => _numRankedEA ?? 0;
  bool hasNumRankedEA() => _numRankedEA != null;

  // "numRankedEY" field.
  int? _numRankedEY;
  int get numRankedEY => _numRankedEY ?? 0;
  bool hasNumRankedEY() => _numRankedEY != null;

  // "numRankedSA" field.
  int? _numRankedSA;
  int get numRankedSA => _numRankedSA ?? 0;
  bool hasNumRankedSA() => _numRankedSA != null;

  // "numRankedSY" field.
  int? _numRankedSY;
  int get numRankedSY => _numRankedSY ?? 0;
  bool hasNumRankedSY() => _numRankedSY != null;

  // "numRankedNA" field.
  int? _numRankedNA;
  int get numRankedNA => _numRankedNA ?? 0;
  bool hasNumRankedNA() => _numRankedNA != null;

  // "numRankedNY" field.
  int? _numRankedNY;
  int get numRankedNY => _numRankedNY ?? 0;
  bool hasNumRankedNY() => _numRankedNY != null;

  // "rankingsPage" field.
  DocumentReference? _rankingsPage;
  DocumentReference? get rankingsPage => _rankingsPage;
  bool hasRankingsPage() => _rankingsPage != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _eloFA = castToType<int>(snapshotData['elo_FA']);
    _eloFY = castToType<int>(snapshotData['elo_FY']);
    _eloEA = castToType<int>(snapshotData['elo_EA']);
    _eloEY = castToType<int>(snapshotData['elo_EY']);
    _eloSA = castToType<int>(snapshotData['elo_SA']);
    _eloSY = castToType<int>(snapshotData['elo_SY']);
    _eloNA = castToType<int>(snapshotData['elo_NA']);
    _eloNY = castToType<int>(snapshotData['elo_NY']);
    _isYouth = snapshotData['isYouth'] as bool?;
    _existingUser = snapshotData['existingUser'] as bool?;
    _dob = snapshotData['dob'] as DateTime?;
    _homecountry = snapshotData['homecountry'] as String?;
    _numRankedFA = castToType<int>(snapshotData['numRankedFA']);
    _numRankedFY = castToType<int>(snapshotData['numRankedFY']);
    _numRankedEA = castToType<int>(snapshotData['numRankedEA']);
    _numRankedEY = castToType<int>(snapshotData['numRankedEY']);
    _numRankedSA = castToType<int>(snapshotData['numRankedSA']);
    _numRankedSY = castToType<int>(snapshotData['numRankedSY']);
    _numRankedNA = castToType<int>(snapshotData['numRankedNA']);
    _numRankedNY = castToType<int>(snapshotData['numRankedNY']);
    _rankingsPage = snapshotData['rankingsPage'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
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
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'elo_FA': eloFA,
      'elo_FY': eloFY,
      'elo_EA': eloEA,
      'elo_EY': eloEY,
      'elo_SA': eloSA,
      'elo_SY': eloSY,
      'elo_NA': eloNA,
      'elo_NY': eloNY,
      'isYouth': isYouth,
      'existingUser': existingUser,
      'dob': dob,
      'homecountry': homecountry,
      'numRankedFA': numRankedFA,
      'numRankedFY': numRankedFY,
      'numRankedEA': numRankedEA,
      'numRankedEY': numRankedEY,
      'numRankedSA': numRankedSA,
      'numRankedSY': numRankedSY,
      'numRankedNA': numRankedNA,
      'numRankedNY': numRankedNY,
      'rankingsPage': rankingsPage,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.eloFA == e2?.eloFA &&
        e1?.eloFY == e2?.eloFY &&
        e1?.eloEA == e2?.eloEA &&
        e1?.eloEY == e2?.eloEY &&
        e1?.eloSA == e2?.eloSA &&
        e1?.eloSY == e2?.eloSY &&
        e1?.eloNA == e2?.eloNA &&
        e1?.eloNY == e2?.eloNY &&
        e1?.isYouth == e2?.isYouth &&
        e1?.existingUser == e2?.existingUser &&
        e1?.dob == e2?.dob &&
        e1?.homecountry == e2?.homecountry &&
        e1?.numRankedFA == e2?.numRankedFA &&
        e1?.numRankedFY == e2?.numRankedFY &&
        e1?.numRankedEA == e2?.numRankedEA &&
        e1?.numRankedEY == e2?.numRankedEY &&
        e1?.numRankedSA == e2?.numRankedSA &&
        e1?.numRankedSY == e2?.numRankedSY &&
        e1?.numRankedNA == e2?.numRankedNA &&
        e1?.numRankedNY == e2?.numRankedNY &&
        e1?.rankingsPage == e2?.rankingsPage;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.eloFA,
        e?.eloFY,
        e?.eloEA,
        e?.eloEY,
        e?.eloSA,
        e?.eloSY,
        e?.eloNA,
        e?.eloNY,
        e?.isYouth,
        e?.existingUser,
        e?.dob,
        e?.homecountry,
        e?.numRankedFA,
        e?.numRankedFY,
        e?.numRankedEA,
        e?.numRankedEY,
        e?.numRankedSA,
        e?.numRankedSY,
        e?.numRankedNA,
        e?.numRankedNY,
        e?.rankingsPage
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
