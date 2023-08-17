import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RankingsRecord extends FirestoreRecord {
  RankingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fencerRankings" field.
  RankingStructStruct? _fencerRankings;
  RankingStructStruct get fencerRankings =>
      _fencerRankings ?? RankingStructStruct();
  bool hasFencerRankings() => _fencerRankings != null;

  void _initializeFields() {
    _fencerRankings =
        RankingStructStruct.maybeFromMap(snapshotData['fencerRankings']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rankings');

  static Stream<RankingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RankingsRecord.fromSnapshot(s));

  static Future<RankingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RankingsRecord.fromSnapshot(s));

  static RankingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RankingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RankingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RankingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RankingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RankingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRankingsRecordData({
  RankingStructStruct? fencerRankings,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fencerRankings': RankingStructStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "fencerRankings" field.
  addRankingStructStructData(firestoreData, fencerRankings, 'fencerRankings');

  return firestoreData;
}

class RankingsRecordDocumentEquality implements Equality<RankingsRecord> {
  const RankingsRecordDocumentEquality();

  @override
  bool equals(RankingsRecord? e1, RankingsRecord? e2) {
    return e1?.fencerRankings == e2?.fencerRankings;
  }

  @override
  int hash(RankingsRecord? e) => const ListEquality().hash([e?.fencerRankings]);

  @override
  bool isValidKey(Object? o) => o is RankingsRecord;
}
