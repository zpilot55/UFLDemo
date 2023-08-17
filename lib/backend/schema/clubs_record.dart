import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClubsRecord extends FirestoreRecord {
  ClubsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "founding_date" field.
  DateTime? _foundingDate;
  DateTime? get foundingDate => _foundingDate;
  bool hasFoundingDate() => _foundingDate != null;

  // "coach1" field.
  DocumentReference? _coach1;
  DocumentReference? get coach1 => _coach1;
  bool hasCoach1() => _coach1 != null;

  // "coach2" field.
  DocumentReference? _coach2;
  DocumentReference? get coach2 => _coach2;
  bool hasCoach2() => _coach2 != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _foundingDate = snapshotData['founding_date'] as DateTime?;
    _coach1 = snapshotData['coach1'] as DocumentReference?;
    _coach2 = snapshotData['coach2'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('clubs');

  static Stream<ClubsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClubsRecord.fromSnapshot(s));

  static Future<ClubsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClubsRecord.fromSnapshot(s));

  static ClubsRecord fromSnapshot(DocumentSnapshot snapshot) => ClubsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClubsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClubsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClubsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClubsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClubsRecordData({
  String? name,
  LatLng? location,
  DateTime? foundingDate,
  DocumentReference? coach1,
  DocumentReference? coach2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
      'founding_date': foundingDate,
      'coach1': coach1,
      'coach2': coach2,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClubsRecordDocumentEquality implements Equality<ClubsRecord> {
  const ClubsRecordDocumentEquality();

  @override
  bool equals(ClubsRecord? e1, ClubsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        e1?.foundingDate == e2?.foundingDate &&
        e1?.coach1 == e2?.coach1 &&
        e1?.coach2 == e2?.coach2;
  }

  @override
  int hash(ClubsRecord? e) => const ListEquality()
      .hash([e?.name, e?.location, e?.foundingDate, e?.coach1, e?.coach2]);

  @override
  bool isValidKey(Object? o) => o is ClubsRecord;
}
