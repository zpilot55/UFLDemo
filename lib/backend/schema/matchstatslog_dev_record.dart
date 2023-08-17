import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatchstatslogDevRecord extends FirestoreRecord {
  MatchstatslogDevRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "MatchStats" field.
  List<MatchStatSnapshotStruct>? _matchStats;
  List<MatchStatSnapshotStruct> get matchStats => _matchStats ?? const [];
  bool hasMatchStats() => _matchStats != null;

  void _initializeFields() {
    _matchStats = getStructList(
      snapshotData['MatchStats'],
      MatchStatSnapshotStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('matchstatslog_dev');

  static Stream<MatchstatslogDevRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MatchstatslogDevRecord.fromSnapshot(s));

  static Future<MatchstatslogDevRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MatchstatslogDevRecord.fromSnapshot(s));

  static MatchstatslogDevRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MatchstatslogDevRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MatchstatslogDevRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MatchstatslogDevRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MatchstatslogDevRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MatchstatslogDevRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMatchstatslogDevRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class MatchstatslogDevRecordDocumentEquality
    implements Equality<MatchstatslogDevRecord> {
  const MatchstatslogDevRecordDocumentEquality();

  @override
  bool equals(MatchstatslogDevRecord? e1, MatchstatslogDevRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.matchStats, e2?.matchStats);
  }

  @override
  int hash(MatchstatslogDevRecord? e) =>
      const ListEquality().hash([e?.matchStats]);

  @override
  bool isValidKey(Object? o) => o is MatchstatslogDevRecord;
}
