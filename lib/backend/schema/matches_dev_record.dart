import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatchesDevRecord extends FirestoreRecord {
  MatchesDevRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user1" field.
  DocumentReference? _user1;
  DocumentReference? get user1 => _user1;
  bool hasUser1() => _user1 != null;

  // "user2" field.
  DocumentReference? _user2;
  DocumentReference? get user2 => _user2;
  bool hasUser2() => _user2 != null;

  // "scheduled_time" field.
  DateTime? _scheduledTime;
  DateTime? get scheduledTime => _scheduledTime;
  bool hasScheduledTime() => _scheduledTime != null;

  // "no_of_periods" field.
  int? _noOfPeriods;
  int get noOfPeriods => _noOfPeriods ?? 0;
  bool hasNoOfPeriods() => _noOfPeriods != null;

  // "weapon" field.
  String? _weapon;
  String get weapon => _weapon ?? '';
  bool hasWeapon() => _weapon != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "fencers" field.
  List<DocumentReference>? _fencers;
  List<DocumentReference> get fencers => _fencers ?? const [];
  bool hasFencers() => _fencers != null;

  // "ScoreLeft" field.
  int? _scoreLeft;
  int get scoreLeft => _scoreLeft ?? 0;
  bool hasScoreLeft() => _scoreLeft != null;

  // "ScoreRight" field.
  int? _scoreRight;
  int get scoreRight => _scoreRight ?? 0;
  bool hasScoreRight() => _scoreRight != null;

  // "MatchDetails" field.
  DocumentReference? _matchDetails;
  DocumentReference? get matchDetails => _matchDetails;
  bool hasMatchDetails() => _matchDetails != null;

  // "MatchStatsLog" field.
  DocumentReference? _matchStatsLog;
  DocumentReference? get matchStatsLog => _matchStatsLog;
  bool hasMatchStatsLog() => _matchStatsLog != null;

  // "MatchRanking" field.
  String? _matchRanking;
  String get matchRanking => _matchRanking ?? '';
  bool hasMatchRanking() => _matchRanking != null;

  void _initializeFields() {
    _user1 = snapshotData['user1'] as DocumentReference?;
    _user2 = snapshotData['user2'] as DocumentReference?;
    _scheduledTime = snapshotData['scheduled_time'] as DateTime?;
    _noOfPeriods = castToType<int>(snapshotData['no_of_periods']);
    _weapon = snapshotData['weapon'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _fencers = getDataList(snapshotData['fencers']);
    _scoreLeft = castToType<int>(snapshotData['ScoreLeft']);
    _scoreRight = castToType<int>(snapshotData['ScoreRight']);
    _matchDetails = snapshotData['MatchDetails'] as DocumentReference?;
    _matchStatsLog = snapshotData['MatchStatsLog'] as DocumentReference?;
    _matchRanking = snapshotData['MatchRanking'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('matches_dev');

  static Stream<MatchesDevRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MatchesDevRecord.fromSnapshot(s));

  static Future<MatchesDevRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MatchesDevRecord.fromSnapshot(s));

  static MatchesDevRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MatchesDevRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MatchesDevRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MatchesDevRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MatchesDevRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MatchesDevRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
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
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user1': user1,
      'user2': user2,
      'scheduled_time': scheduledTime,
      'no_of_periods': noOfPeriods,
      'weapon': weapon,
      'location': location,
      'ScoreLeft': scoreLeft,
      'ScoreRight': scoreRight,
      'MatchDetails': matchDetails,
      'MatchStatsLog': matchStatsLog,
      'MatchRanking': matchRanking,
    }.withoutNulls,
  );

  return firestoreData;
}

class MatchesDevRecordDocumentEquality implements Equality<MatchesDevRecord> {
  const MatchesDevRecordDocumentEquality();

  @override
  bool equals(MatchesDevRecord? e1, MatchesDevRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user1 == e2?.user1 &&
        e1?.user2 == e2?.user2 &&
        e1?.scheduledTime == e2?.scheduledTime &&
        e1?.noOfPeriods == e2?.noOfPeriods &&
        e1?.weapon == e2?.weapon &&
        e1?.location == e2?.location &&
        listEquality.equals(e1?.fencers, e2?.fencers) &&
        e1?.scoreLeft == e2?.scoreLeft &&
        e1?.scoreRight == e2?.scoreRight &&
        e1?.matchDetails == e2?.matchDetails &&
        e1?.matchStatsLog == e2?.matchStatsLog &&
        e1?.matchRanking == e2?.matchRanking;
  }

  @override
  int hash(MatchesDevRecord? e) => const ListEquality().hash([
        e?.user1,
        e?.user2,
        e?.scheduledTime,
        e?.noOfPeriods,
        e?.weapon,
        e?.location,
        e?.fencers,
        e?.scoreLeft,
        e?.scoreRight,
        e?.matchDetails,
        e?.matchStatsLog,
        e?.matchRanking
      ]);

  @override
  bool isValidKey(Object? o) => o is MatchesDevRecord;
}
