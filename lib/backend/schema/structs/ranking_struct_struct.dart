// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RankingStructStruct extends FFFirebaseStruct {
  RankingStructStruct({
    DocumentReference? fencer,
    int? eloFA,
    int? eloFY,
    int? eloEA,
    int? eloEY,
    int? eloSA,
    int? eloSY,
    int? eloNA,
    int? eloNY,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fencer = fencer,
        _eloFA = eloFA,
        _eloFY = eloFY,
        _eloEA = eloEA,
        _eloEY = eloEY,
        _eloSA = eloSA,
        _eloSY = eloSY,
        _eloNA = eloNA,
        _eloNY = eloNY,
        super(firestoreUtilData);

  // "fencer" field.
  DocumentReference? _fencer;
  DocumentReference? get fencer => _fencer;
  set fencer(DocumentReference? val) => _fencer = val;
  bool hasFencer() => _fencer != null;

  // "elo_FA" field.
  int? _eloFA;
  int get eloFA => _eloFA ?? 0;
  set eloFA(int? val) => _eloFA = val;
  void incrementEloFA(int amount) => _eloFA = eloFA + amount;
  bool hasEloFA() => _eloFA != null;

  // "elo_FY" field.
  int? _eloFY;
  int get eloFY => _eloFY ?? 0;
  set eloFY(int? val) => _eloFY = val;
  void incrementEloFY(int amount) => _eloFY = eloFY + amount;
  bool hasEloFY() => _eloFY != null;

  // "elo_EA" field.
  int? _eloEA;
  int get eloEA => _eloEA ?? 0;
  set eloEA(int? val) => _eloEA = val;
  void incrementEloEA(int amount) => _eloEA = eloEA + amount;
  bool hasEloEA() => _eloEA != null;

  // "elo_EY" field.
  int? _eloEY;
  int get eloEY => _eloEY ?? 0;
  set eloEY(int? val) => _eloEY = val;
  void incrementEloEY(int amount) => _eloEY = eloEY + amount;
  bool hasEloEY() => _eloEY != null;

  // "elo_SA" field.
  int? _eloSA;
  int get eloSA => _eloSA ?? 0;
  set eloSA(int? val) => _eloSA = val;
  void incrementEloSA(int amount) => _eloSA = eloSA + amount;
  bool hasEloSA() => _eloSA != null;

  // "elo_SY" field.
  int? _eloSY;
  int get eloSY => _eloSY ?? 0;
  set eloSY(int? val) => _eloSY = val;
  void incrementEloSY(int amount) => _eloSY = eloSY + amount;
  bool hasEloSY() => _eloSY != null;

  // "elo_NA" field.
  int? _eloNA;
  int get eloNA => _eloNA ?? 0;
  set eloNA(int? val) => _eloNA = val;
  void incrementEloNA(int amount) => _eloNA = eloNA + amount;
  bool hasEloNA() => _eloNA != null;

  // "elo_NY" field.
  int? _eloNY;
  int get eloNY => _eloNY ?? 0;
  set eloNY(int? val) => _eloNY = val;
  void incrementEloNY(int amount) => _eloNY = eloNY + amount;
  bool hasEloNY() => _eloNY != null;

  static RankingStructStruct fromMap(Map<String, dynamic> data) =>
      RankingStructStruct(
        fencer: data['fencer'] as DocumentReference?,
        eloFA: castToType<int>(data['elo_FA']),
        eloFY: castToType<int>(data['elo_FY']),
        eloEA: castToType<int>(data['elo_EA']),
        eloEY: castToType<int>(data['elo_EY']),
        eloSA: castToType<int>(data['elo_SA']),
        eloSY: castToType<int>(data['elo_SY']),
        eloNA: castToType<int>(data['elo_NA']),
        eloNY: castToType<int>(data['elo_NY']),
      );

  static RankingStructStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? RankingStructStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'fencer': _fencer,
        'elo_FA': _eloFA,
        'elo_FY': _eloFY,
        'elo_EA': _eloEA,
        'elo_EY': _eloEY,
        'elo_SA': _eloSA,
        'elo_SY': _eloSY,
        'elo_NA': _eloNA,
        'elo_NY': _eloNY,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
  static RankingStructStruct fromSerializableMap(Map<String, dynamic> data) =>
      fromMap(data);

  @override
  String toString() => 'RankingStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RankingStructStruct &&
        fencer == other.fencer &&
        eloFA == other.eloFA &&
        eloFY == other.eloFY &&
        eloEA == other.eloEA &&
        eloEY == other.eloEY &&
        eloSA == other.eloSA &&
        eloSY == other.eloSY &&
        eloNA == other.eloNA &&
        eloNY == other.eloNY;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([fencer, eloFA, eloFY, eloEA, eloEY, eloSA, eloSY, eloNA, eloNY]);
}

RankingStructStruct createRankingStructStruct({
  DocumentReference? fencer,
  int? eloFA,
  int? eloFY,
  int? eloEA,
  int? eloEY,
  int? eloSA,
  int? eloSY,
  int? eloNA,
  int? eloNY,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RankingStructStruct(
      fencer: fencer,
      eloFA: eloFA,
      eloFY: eloFY,
      eloEA: eloEA,
      eloEY: eloEY,
      eloSA: eloSA,
      eloSY: eloSY,
      eloNA: eloNA,
      eloNY: eloNY,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RankingStructStruct? updateRankingStructStruct(
  RankingStructStruct? rankingStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    rankingStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRankingStructStructData(
  Map<String, dynamic> firestoreData,
  RankingStructStruct? rankingStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (rankingStruct == null) {
    return;
  }
  if (rankingStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && rankingStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final rankingStructData =
      getRankingStructFirestoreData(rankingStruct, forFieldValue);
  final nestedData =
      rankingStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = rankingStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRankingStructFirestoreData(
  RankingStructStruct? rankingStruct, [
  bool forFieldValue = false,
]) {
  if (rankingStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(rankingStruct.toMap());

  // Add any Firestore field values
  rankingStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRankingStructListFirestoreData(
  List<RankingStructStruct>? rankingStructs,
) =>
    rankingStructs
        ?.map((e) => getRankingStructFirestoreData(e, true))
        .toList() ??
    [];
