import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatchdetailsDevRecord extends FirestoreRecord {
  MatchdetailsDevRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "MatchEvents" field.
  List<MatchEventStruct>? _matchEvents;
  List<MatchEventStruct> get matchEvents => _matchEvents ?? const [];
  bool hasMatchEvents() => _matchEvents != null;

  // "Statlines" field.
  List<StatlineStruct>? _statlines;
  List<StatlineStruct> get statlines => _statlines ?? const [];
  bool hasStatlines() => _statlines != null;

  // "OverallStats" field.
  MatchStatSnapshotStruct? _overallStats;
  MatchStatSnapshotStruct get overallStats =>
      _overallStats ?? MatchStatSnapshotStruct();
  bool hasOverallStats() => _overallStats != null;

  // "PeriodStats" field.
  List<MatchStatSnapshotStruct>? _periodStats;
  List<MatchStatSnapshotStruct> get periodStats => _periodStats ?? const [];
  bool hasPeriodStats() => _periodStats != null;

  void _initializeFields() {
    _matchEvents = getStructList(
      snapshotData['MatchEvents'],
      MatchEventStruct.fromMap,
    );
    _statlines = getStructList(
      snapshotData['Statlines'],
      StatlineStruct.fromMap,
    );
    _overallStats =
        MatchStatSnapshotStruct.maybeFromMap(snapshotData['OverallStats']);
    _periodStats = getStructList(
      snapshotData['PeriodStats'],
      MatchStatSnapshotStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('matchdetails_dev');

  static Stream<MatchdetailsDevRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MatchdetailsDevRecord.fromSnapshot(s));

  static Future<MatchdetailsDevRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MatchdetailsDevRecord.fromSnapshot(s));

  static MatchdetailsDevRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MatchdetailsDevRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MatchdetailsDevRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MatchdetailsDevRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MatchdetailsDevRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MatchdetailsDevRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMatchdetailsDevRecordData({
  MatchStatSnapshotStruct? overallStats,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'OverallStats': MatchStatSnapshotStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "OverallStats" field.
  addMatchStatSnapshotStructData(firestoreData, overallStats, 'OverallStats');

  return firestoreData;
}

class MatchdetailsDevRecordDocumentEquality
    implements Equality<MatchdetailsDevRecord> {
  const MatchdetailsDevRecordDocumentEquality();

  @override
  bool equals(MatchdetailsDevRecord? e1, MatchdetailsDevRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.matchEvents, e2?.matchEvents) &&
        listEquality.equals(e1?.statlines, e2?.statlines) &&
        e1?.overallStats == e2?.overallStats &&
        listEquality.equals(e1?.periodStats, e2?.periodStats);
  }

  @override
  int hash(MatchdetailsDevRecord? e) => const ListEquality()
      .hash([e?.matchEvents, e?.statlines, e?.overallStats, e?.periodStats]);

  @override
  bool isValidKey(Object? o) => o is MatchdetailsDevRecord;
}
