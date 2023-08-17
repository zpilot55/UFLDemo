// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatchStatSnapshotStruct extends FFFirebaseStruct {
  MatchStatSnapshotStruct({
    int? pointsL,
    int? pointsR,
    int? yellowCardsL,
    int? yellowCardsR,
    int? redCardsL,
    int? redCardsR,
    int? simultaneous,
    int? haltsRef,
    int? haltsL,
    int? haltsR,
    int? simpleAttackHitsL,
    int? simpleAttackHitsR,
    int? simpleAttackOffTarL,
    int? simpleAttackOffTarR,
    int? compoundAttackHitsL,
    int? compoundAttackHitsR,
    int? compoundAttackOffTarL,
    int? compoundAttackOffTarR,
    int? parryRiposteHitsL,
    int? parryRiposteHitsR,
    int? parryRiposteOffTargetL,
    int? parryRiposteOffTargetR,
    int? remiseHitsL,
    int? remiseHitsR,
    int? remiseOffTarL,
    int? remiseOffTarR,
    int? counterattackHitsL,
    int? counterattackHitsR,
    int? counterattackOffTarL,
    int? counterattackOffTarR,
    int? pointInLineHitsL,
    int? pointInLineHitsR,
    int? pointInLineOffTarL,
    int? pointInLineOffTarR,
    int? timestamp,
    int? periodstamp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pointsL = pointsL,
        _pointsR = pointsR,
        _yellowCardsL = yellowCardsL,
        _yellowCardsR = yellowCardsR,
        _redCardsL = redCardsL,
        _redCardsR = redCardsR,
        _simultaneous = simultaneous,
        _haltsRef = haltsRef,
        _haltsL = haltsL,
        _haltsR = haltsR,
        _simpleAttackHitsL = simpleAttackHitsL,
        _simpleAttackHitsR = simpleAttackHitsR,
        _simpleAttackOffTarL = simpleAttackOffTarL,
        _simpleAttackOffTarR = simpleAttackOffTarR,
        _compoundAttackHitsL = compoundAttackHitsL,
        _compoundAttackHitsR = compoundAttackHitsR,
        _compoundAttackOffTarL = compoundAttackOffTarL,
        _compoundAttackOffTarR = compoundAttackOffTarR,
        _parryRiposteHitsL = parryRiposteHitsL,
        _parryRiposteHitsR = parryRiposteHitsR,
        _parryRiposteOffTargetL = parryRiposteOffTargetL,
        _parryRiposteOffTargetR = parryRiposteOffTargetR,
        _remiseHitsL = remiseHitsL,
        _remiseHitsR = remiseHitsR,
        _remiseOffTarL = remiseOffTarL,
        _remiseOffTarR = remiseOffTarR,
        _counterattackHitsL = counterattackHitsL,
        _counterattackHitsR = counterattackHitsR,
        _counterattackOffTarL = counterattackOffTarL,
        _counterattackOffTarR = counterattackOffTarR,
        _pointInLineHitsL = pointInLineHitsL,
        _pointInLineHitsR = pointInLineHitsR,
        _pointInLineOffTarL = pointInLineOffTarL,
        _pointInLineOffTarR = pointInLineOffTarR,
        _timestamp = timestamp,
        _periodstamp = periodstamp,
        super(firestoreUtilData);

  // "PointsL" field.
  int? _pointsL;
  int get pointsL => _pointsL ?? 0;
  set pointsL(int? val) => _pointsL = val;
  void incrementPointsL(int amount) => _pointsL = pointsL + amount;
  bool hasPointsL() => _pointsL != null;

  // "PointsR" field.
  int? _pointsR;
  int get pointsR => _pointsR ?? 0;
  set pointsR(int? val) => _pointsR = val;
  void incrementPointsR(int amount) => _pointsR = pointsR + amount;
  bool hasPointsR() => _pointsR != null;

  // "YellowCardsL" field.
  int? _yellowCardsL;
  int get yellowCardsL => _yellowCardsL ?? 0;
  set yellowCardsL(int? val) => _yellowCardsL = val;
  void incrementYellowCardsL(int amount) =>
      _yellowCardsL = yellowCardsL + amount;
  bool hasYellowCardsL() => _yellowCardsL != null;

  // "YellowCardsR" field.
  int? _yellowCardsR;
  int get yellowCardsR => _yellowCardsR ?? 0;
  set yellowCardsR(int? val) => _yellowCardsR = val;
  void incrementYellowCardsR(int amount) =>
      _yellowCardsR = yellowCardsR + amount;
  bool hasYellowCardsR() => _yellowCardsR != null;

  // "RedCardsL" field.
  int? _redCardsL;
  int get redCardsL => _redCardsL ?? 0;
  set redCardsL(int? val) => _redCardsL = val;
  void incrementRedCardsL(int amount) => _redCardsL = redCardsL + amount;
  bool hasRedCardsL() => _redCardsL != null;

  // "RedCardsR" field.
  int? _redCardsR;
  int get redCardsR => _redCardsR ?? 0;
  set redCardsR(int? val) => _redCardsR = val;
  void incrementRedCardsR(int amount) => _redCardsR = redCardsR + amount;
  bool hasRedCardsR() => _redCardsR != null;

  // "Simultaneous" field.
  int? _simultaneous;
  int get simultaneous => _simultaneous ?? 0;
  set simultaneous(int? val) => _simultaneous = val;
  void incrementSimultaneous(int amount) =>
      _simultaneous = simultaneous + amount;
  bool hasSimultaneous() => _simultaneous != null;

  // "HaltsRef" field.
  int? _haltsRef;
  int get haltsRef => _haltsRef ?? 0;
  set haltsRef(int? val) => _haltsRef = val;
  void incrementHaltsRef(int amount) => _haltsRef = haltsRef + amount;
  bool hasHaltsRef() => _haltsRef != null;

  // "HaltsL" field.
  int? _haltsL;
  int get haltsL => _haltsL ?? 0;
  set haltsL(int? val) => _haltsL = val;
  void incrementHaltsL(int amount) => _haltsL = haltsL + amount;
  bool hasHaltsL() => _haltsL != null;

  // "HaltsR" field.
  int? _haltsR;
  int get haltsR => _haltsR ?? 0;
  set haltsR(int? val) => _haltsR = val;
  void incrementHaltsR(int amount) => _haltsR = haltsR + amount;
  bool hasHaltsR() => _haltsR != null;

  // "SimpleAttackHitsL" field.
  int? _simpleAttackHitsL;
  int get simpleAttackHitsL => _simpleAttackHitsL ?? 0;
  set simpleAttackHitsL(int? val) => _simpleAttackHitsL = val;
  void incrementSimpleAttackHitsL(int amount) =>
      _simpleAttackHitsL = simpleAttackHitsL + amount;
  bool hasSimpleAttackHitsL() => _simpleAttackHitsL != null;

  // "SimpleAttackHitsR" field.
  int? _simpleAttackHitsR;
  int get simpleAttackHitsR => _simpleAttackHitsR ?? 0;
  set simpleAttackHitsR(int? val) => _simpleAttackHitsR = val;
  void incrementSimpleAttackHitsR(int amount) =>
      _simpleAttackHitsR = simpleAttackHitsR + amount;
  bool hasSimpleAttackHitsR() => _simpleAttackHitsR != null;

  // "SimpleAttackOffTarL" field.
  int? _simpleAttackOffTarL;
  int get simpleAttackOffTarL => _simpleAttackOffTarL ?? 0;
  set simpleAttackOffTarL(int? val) => _simpleAttackOffTarL = val;
  void incrementSimpleAttackOffTarL(int amount) =>
      _simpleAttackOffTarL = simpleAttackOffTarL + amount;
  bool hasSimpleAttackOffTarL() => _simpleAttackOffTarL != null;

  // "SimpleAttackOffTarR" field.
  int? _simpleAttackOffTarR;
  int get simpleAttackOffTarR => _simpleAttackOffTarR ?? 0;
  set simpleAttackOffTarR(int? val) => _simpleAttackOffTarR = val;
  void incrementSimpleAttackOffTarR(int amount) =>
      _simpleAttackOffTarR = simpleAttackOffTarR + amount;
  bool hasSimpleAttackOffTarR() => _simpleAttackOffTarR != null;

  // "CompoundAttackHitsL" field.
  int? _compoundAttackHitsL;
  int get compoundAttackHitsL => _compoundAttackHitsL ?? 0;
  set compoundAttackHitsL(int? val) => _compoundAttackHitsL = val;
  void incrementCompoundAttackHitsL(int amount) =>
      _compoundAttackHitsL = compoundAttackHitsL + amount;
  bool hasCompoundAttackHitsL() => _compoundAttackHitsL != null;

  // "CompoundAttackHitsR" field.
  int? _compoundAttackHitsR;
  int get compoundAttackHitsR => _compoundAttackHitsR ?? 0;
  set compoundAttackHitsR(int? val) => _compoundAttackHitsR = val;
  void incrementCompoundAttackHitsR(int amount) =>
      _compoundAttackHitsR = compoundAttackHitsR + amount;
  bool hasCompoundAttackHitsR() => _compoundAttackHitsR != null;

  // "CompoundAttackOffTarL" field.
  int? _compoundAttackOffTarL;
  int get compoundAttackOffTarL => _compoundAttackOffTarL ?? 0;
  set compoundAttackOffTarL(int? val) => _compoundAttackOffTarL = val;
  void incrementCompoundAttackOffTarL(int amount) =>
      _compoundAttackOffTarL = compoundAttackOffTarL + amount;
  bool hasCompoundAttackOffTarL() => _compoundAttackOffTarL != null;

  // "CompoundAttackOffTarR" field.
  int? _compoundAttackOffTarR;
  int get compoundAttackOffTarR => _compoundAttackOffTarR ?? 0;
  set compoundAttackOffTarR(int? val) => _compoundAttackOffTarR = val;
  void incrementCompoundAttackOffTarR(int amount) =>
      _compoundAttackOffTarR = compoundAttackOffTarR + amount;
  bool hasCompoundAttackOffTarR() => _compoundAttackOffTarR != null;

  // "ParryRiposteHitsL" field.
  int? _parryRiposteHitsL;
  int get parryRiposteHitsL => _parryRiposteHitsL ?? 0;
  set parryRiposteHitsL(int? val) => _parryRiposteHitsL = val;
  void incrementParryRiposteHitsL(int amount) =>
      _parryRiposteHitsL = parryRiposteHitsL + amount;
  bool hasParryRiposteHitsL() => _parryRiposteHitsL != null;

  // "ParryRiposteHitsR" field.
  int? _parryRiposteHitsR;
  int get parryRiposteHitsR => _parryRiposteHitsR ?? 0;
  set parryRiposteHitsR(int? val) => _parryRiposteHitsR = val;
  void incrementParryRiposteHitsR(int amount) =>
      _parryRiposteHitsR = parryRiposteHitsR + amount;
  bool hasParryRiposteHitsR() => _parryRiposteHitsR != null;

  // "ParryRiposteOffTargetL" field.
  int? _parryRiposteOffTargetL;
  int get parryRiposteOffTargetL => _parryRiposteOffTargetL ?? 0;
  set parryRiposteOffTargetL(int? val) => _parryRiposteOffTargetL = val;
  void incrementParryRiposteOffTargetL(int amount) =>
      _parryRiposteOffTargetL = parryRiposteOffTargetL + amount;
  bool hasParryRiposteOffTargetL() => _parryRiposteOffTargetL != null;

  // "ParryRiposteOffTargetR" field.
  int? _parryRiposteOffTargetR;
  int get parryRiposteOffTargetR => _parryRiposteOffTargetR ?? 0;
  set parryRiposteOffTargetR(int? val) => _parryRiposteOffTargetR = val;
  void incrementParryRiposteOffTargetR(int amount) =>
      _parryRiposteOffTargetR = parryRiposteOffTargetR + amount;
  bool hasParryRiposteOffTargetR() => _parryRiposteOffTargetR != null;

  // "RemiseHitsL" field.
  int? _remiseHitsL;
  int get remiseHitsL => _remiseHitsL ?? 0;
  set remiseHitsL(int? val) => _remiseHitsL = val;
  void incrementRemiseHitsL(int amount) => _remiseHitsL = remiseHitsL + amount;
  bool hasRemiseHitsL() => _remiseHitsL != null;

  // "RemiseHitsR" field.
  int? _remiseHitsR;
  int get remiseHitsR => _remiseHitsR ?? 0;
  set remiseHitsR(int? val) => _remiseHitsR = val;
  void incrementRemiseHitsR(int amount) => _remiseHitsR = remiseHitsR + amount;
  bool hasRemiseHitsR() => _remiseHitsR != null;

  // "RemiseOffTarL" field.
  int? _remiseOffTarL;
  int get remiseOffTarL => _remiseOffTarL ?? 0;
  set remiseOffTarL(int? val) => _remiseOffTarL = val;
  void incrementRemiseOffTarL(int amount) =>
      _remiseOffTarL = remiseOffTarL + amount;
  bool hasRemiseOffTarL() => _remiseOffTarL != null;

  // "RemiseOffTarR" field.
  int? _remiseOffTarR;
  int get remiseOffTarR => _remiseOffTarR ?? 0;
  set remiseOffTarR(int? val) => _remiseOffTarR = val;
  void incrementRemiseOffTarR(int amount) =>
      _remiseOffTarR = remiseOffTarR + amount;
  bool hasRemiseOffTarR() => _remiseOffTarR != null;

  // "CounterattackHitsL" field.
  int? _counterattackHitsL;
  int get counterattackHitsL => _counterattackHitsL ?? 0;
  set counterattackHitsL(int? val) => _counterattackHitsL = val;
  void incrementCounterattackHitsL(int amount) =>
      _counterattackHitsL = counterattackHitsL + amount;
  bool hasCounterattackHitsL() => _counterattackHitsL != null;

  // "CounterattackHitsR" field.
  int? _counterattackHitsR;
  int get counterattackHitsR => _counterattackHitsR ?? 0;
  set counterattackHitsR(int? val) => _counterattackHitsR = val;
  void incrementCounterattackHitsR(int amount) =>
      _counterattackHitsR = counterattackHitsR + amount;
  bool hasCounterattackHitsR() => _counterattackHitsR != null;

  // "CounterattackOffTarL" field.
  int? _counterattackOffTarL;
  int get counterattackOffTarL => _counterattackOffTarL ?? 0;
  set counterattackOffTarL(int? val) => _counterattackOffTarL = val;
  void incrementCounterattackOffTarL(int amount) =>
      _counterattackOffTarL = counterattackOffTarL + amount;
  bool hasCounterattackOffTarL() => _counterattackOffTarL != null;

  // "CounterattackOffTarR" field.
  int? _counterattackOffTarR;
  int get counterattackOffTarR => _counterattackOffTarR ?? 0;
  set counterattackOffTarR(int? val) => _counterattackOffTarR = val;
  void incrementCounterattackOffTarR(int amount) =>
      _counterattackOffTarR = counterattackOffTarR + amount;
  bool hasCounterattackOffTarR() => _counterattackOffTarR != null;

  // "PointInLineHitsL" field.
  int? _pointInLineHitsL;
  int get pointInLineHitsL => _pointInLineHitsL ?? 0;
  set pointInLineHitsL(int? val) => _pointInLineHitsL = val;
  void incrementPointInLineHitsL(int amount) =>
      _pointInLineHitsL = pointInLineHitsL + amount;
  bool hasPointInLineHitsL() => _pointInLineHitsL != null;

  // "PointInLineHitsR" field.
  int? _pointInLineHitsR;
  int get pointInLineHitsR => _pointInLineHitsR ?? 0;
  set pointInLineHitsR(int? val) => _pointInLineHitsR = val;
  void incrementPointInLineHitsR(int amount) =>
      _pointInLineHitsR = pointInLineHitsR + amount;
  bool hasPointInLineHitsR() => _pointInLineHitsR != null;

  // "PointInLineOffTarL" field.
  int? _pointInLineOffTarL;
  int get pointInLineOffTarL => _pointInLineOffTarL ?? 0;
  set pointInLineOffTarL(int? val) => _pointInLineOffTarL = val;
  void incrementPointInLineOffTarL(int amount) =>
      _pointInLineOffTarL = pointInLineOffTarL + amount;
  bool hasPointInLineOffTarL() => _pointInLineOffTarL != null;

  // "PointInLineOffTarR" field.
  int? _pointInLineOffTarR;
  int get pointInLineOffTarR => _pointInLineOffTarR ?? 0;
  set pointInLineOffTarR(int? val) => _pointInLineOffTarR = val;
  void incrementPointInLineOffTarR(int amount) =>
      _pointInLineOffTarR = pointInLineOffTarR + amount;
  bool hasPointInLineOffTarR() => _pointInLineOffTarR != null;

  // "timestamp" field.
  int? _timestamp;
  int get timestamp => _timestamp ?? 0;
  set timestamp(int? val) => _timestamp = val;
  void incrementTimestamp(int amount) => _timestamp = timestamp + amount;
  bool hasTimestamp() => _timestamp != null;

  // "periodstamp" field.
  int? _periodstamp;
  int get periodstamp => _periodstamp ?? 0;
  set periodstamp(int? val) => _periodstamp = val;
  void incrementPeriodstamp(int amount) => _periodstamp = periodstamp + amount;
  bool hasPeriodstamp() => _periodstamp != null;

  static MatchStatSnapshotStruct fromMap(Map<String, dynamic> data) =>
      MatchStatSnapshotStruct(
        pointsL: castToType<int>(data['PointsL']),
        pointsR: castToType<int>(data['PointsR']),
        yellowCardsL: castToType<int>(data['YellowCardsL']),
        yellowCardsR: castToType<int>(data['YellowCardsR']),
        redCardsL: castToType<int>(data['RedCardsL']),
        redCardsR: castToType<int>(data['RedCardsR']),
        simultaneous: castToType<int>(data['Simultaneous']),
        haltsRef: castToType<int>(data['HaltsRef']),
        haltsL: castToType<int>(data['HaltsL']),
        haltsR: castToType<int>(data['HaltsR']),
        simpleAttackHitsL: castToType<int>(data['SimpleAttackHitsL']),
        simpleAttackHitsR: castToType<int>(data['SimpleAttackHitsR']),
        simpleAttackOffTarL: castToType<int>(data['SimpleAttackOffTarL']),
        simpleAttackOffTarR: castToType<int>(data['SimpleAttackOffTarR']),
        compoundAttackHitsL: castToType<int>(data['CompoundAttackHitsL']),
        compoundAttackHitsR: castToType<int>(data['CompoundAttackHitsR']),
        compoundAttackOffTarL: castToType<int>(data['CompoundAttackOffTarL']),
        compoundAttackOffTarR: castToType<int>(data['CompoundAttackOffTarR']),
        parryRiposteHitsL: castToType<int>(data['ParryRiposteHitsL']),
        parryRiposteHitsR: castToType<int>(data['ParryRiposteHitsR']),
        parryRiposteOffTargetL: castToType<int>(data['ParryRiposteOffTargetL']),
        parryRiposteOffTargetR: castToType<int>(data['ParryRiposteOffTargetR']),
        remiseHitsL: castToType<int>(data['RemiseHitsL']),
        remiseHitsR: castToType<int>(data['RemiseHitsR']),
        remiseOffTarL: castToType<int>(data['RemiseOffTarL']),
        remiseOffTarR: castToType<int>(data['RemiseOffTarR']),
        counterattackHitsL: castToType<int>(data['CounterattackHitsL']),
        counterattackHitsR: castToType<int>(data['CounterattackHitsR']),
        counterattackOffTarL: castToType<int>(data['CounterattackOffTarL']),
        counterattackOffTarR: castToType<int>(data['CounterattackOffTarR']),
        pointInLineHitsL: castToType<int>(data['PointInLineHitsL']),
        pointInLineHitsR: castToType<int>(data['PointInLineHitsR']),
        pointInLineOffTarL: castToType<int>(data['PointInLineOffTarL']),
        pointInLineOffTarR: castToType<int>(data['PointInLineOffTarR']),
        timestamp: castToType<int>(data['timestamp']),
        periodstamp: castToType<int>(data['periodstamp']),
      );

  static MatchStatSnapshotStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? MatchStatSnapshotStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'PointsL': _pointsL,
        'PointsR': _pointsR,
        'YellowCardsL': _yellowCardsL,
        'YellowCardsR': _yellowCardsR,
        'RedCardsL': _redCardsL,
        'RedCardsR': _redCardsR,
        'Simultaneous': _simultaneous,
        'HaltsRef': _haltsRef,
        'HaltsL': _haltsL,
        'HaltsR': _haltsR,
        'SimpleAttackHitsL': _simpleAttackHitsL,
        'SimpleAttackHitsR': _simpleAttackHitsR,
        'SimpleAttackOffTarL': _simpleAttackOffTarL,
        'SimpleAttackOffTarR': _simpleAttackOffTarR,
        'CompoundAttackHitsL': _compoundAttackHitsL,
        'CompoundAttackHitsR': _compoundAttackHitsR,
        'CompoundAttackOffTarL': _compoundAttackOffTarL,
        'CompoundAttackOffTarR': _compoundAttackOffTarR,
        'ParryRiposteHitsL': _parryRiposteHitsL,
        'ParryRiposteHitsR': _parryRiposteHitsR,
        'ParryRiposteOffTargetL': _parryRiposteOffTargetL,
        'ParryRiposteOffTargetR': _parryRiposteOffTargetR,
        'RemiseHitsL': _remiseHitsL,
        'RemiseHitsR': _remiseHitsR,
        'RemiseOffTarL': _remiseOffTarL,
        'RemiseOffTarR': _remiseOffTarR,
        'CounterattackHitsL': _counterattackHitsL,
        'CounterattackHitsR': _counterattackHitsR,
        'CounterattackOffTarL': _counterattackOffTarL,
        'CounterattackOffTarR': _counterattackOffTarR,
        'PointInLineHitsL': _pointInLineHitsL,
        'PointInLineHitsR': _pointInLineHitsR,
        'PointInLineOffTarL': _pointInLineOffTarL,
        'PointInLineOffTarR': _pointInLineOffTarR,
        'timestamp': _timestamp,
        'periodstamp': _periodstamp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
  static MatchStatSnapshotStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      fromMap(data);

  @override
  String toString() => 'MatchStatSnapshotStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MatchStatSnapshotStruct &&
        pointsL == other.pointsL &&
        pointsR == other.pointsR &&
        yellowCardsL == other.yellowCardsL &&
        yellowCardsR == other.yellowCardsR &&
        redCardsL == other.redCardsL &&
        redCardsR == other.redCardsR &&
        simultaneous == other.simultaneous &&
        haltsRef == other.haltsRef &&
        haltsL == other.haltsL &&
        haltsR == other.haltsR &&
        simpleAttackHitsL == other.simpleAttackHitsL &&
        simpleAttackHitsR == other.simpleAttackHitsR &&
        simpleAttackOffTarL == other.simpleAttackOffTarL &&
        simpleAttackOffTarR == other.simpleAttackOffTarR &&
        compoundAttackHitsL == other.compoundAttackHitsL &&
        compoundAttackHitsR == other.compoundAttackHitsR &&
        compoundAttackOffTarL == other.compoundAttackOffTarL &&
        compoundAttackOffTarR == other.compoundAttackOffTarR &&
        parryRiposteHitsL == other.parryRiposteHitsL &&
        parryRiposteHitsR == other.parryRiposteHitsR &&
        parryRiposteOffTargetL == other.parryRiposteOffTargetL &&
        parryRiposteOffTargetR == other.parryRiposteOffTargetR &&
        remiseHitsL == other.remiseHitsL &&
        remiseHitsR == other.remiseHitsR &&
        remiseOffTarL == other.remiseOffTarL &&
        remiseOffTarR == other.remiseOffTarR &&
        counterattackHitsL == other.counterattackHitsL &&
        counterattackHitsR == other.counterattackHitsR &&
        counterattackOffTarL == other.counterattackOffTarL &&
        counterattackOffTarR == other.counterattackOffTarR &&
        pointInLineHitsL == other.pointInLineHitsL &&
        pointInLineHitsR == other.pointInLineHitsR &&
        pointInLineOffTarL == other.pointInLineOffTarL &&
        pointInLineOffTarR == other.pointInLineOffTarR &&
        timestamp == other.timestamp &&
        periodstamp == other.periodstamp;
  }

  @override
  int get hashCode => const ListEquality().hash([
        pointsL,
        pointsR,
        yellowCardsL,
        yellowCardsR,
        redCardsL,
        redCardsR,
        simultaneous,
        haltsRef,
        haltsL,
        haltsR,
        simpleAttackHitsL,
        simpleAttackHitsR,
        simpleAttackOffTarL,
        simpleAttackOffTarR,
        compoundAttackHitsL,
        compoundAttackHitsR,
        compoundAttackOffTarL,
        compoundAttackOffTarR,
        parryRiposteHitsL,
        parryRiposteHitsR,
        parryRiposteOffTargetL,
        parryRiposteOffTargetR,
        remiseHitsL,
        remiseHitsR,
        remiseOffTarL,
        remiseOffTarR,
        counterattackHitsL,
        counterattackHitsR,
        counterattackOffTarL,
        counterattackOffTarR,
        pointInLineHitsL,
        pointInLineHitsR,
        pointInLineOffTarL,
        pointInLineOffTarR,
        timestamp,
        periodstamp
      ]);
}

MatchStatSnapshotStruct createMatchStatSnapshotStruct({
  int? pointsL,
  int? pointsR,
  int? yellowCardsL,
  int? yellowCardsR,
  int? redCardsL,
  int? redCardsR,
  int? simultaneous,
  int? haltsRef,
  int? haltsL,
  int? haltsR,
  int? simpleAttackHitsL,
  int? simpleAttackHitsR,
  int? simpleAttackOffTarL,
  int? simpleAttackOffTarR,
  int? compoundAttackHitsL,
  int? compoundAttackHitsR,
  int? compoundAttackOffTarL,
  int? compoundAttackOffTarR,
  int? parryRiposteHitsL,
  int? parryRiposteHitsR,
  int? parryRiposteOffTargetL,
  int? parryRiposteOffTargetR,
  int? remiseHitsL,
  int? remiseHitsR,
  int? remiseOffTarL,
  int? remiseOffTarR,
  int? counterattackHitsL,
  int? counterattackHitsR,
  int? counterattackOffTarL,
  int? counterattackOffTarR,
  int? pointInLineHitsL,
  int? pointInLineHitsR,
  int? pointInLineOffTarL,
  int? pointInLineOffTarR,
  int? timestamp,
  int? periodstamp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MatchStatSnapshotStruct(
      pointsL: pointsL,
      pointsR: pointsR,
      yellowCardsL: yellowCardsL,
      yellowCardsR: yellowCardsR,
      redCardsL: redCardsL,
      redCardsR: redCardsR,
      simultaneous: simultaneous,
      haltsRef: haltsRef,
      haltsL: haltsL,
      haltsR: haltsR,
      simpleAttackHitsL: simpleAttackHitsL,
      simpleAttackHitsR: simpleAttackHitsR,
      simpleAttackOffTarL: simpleAttackOffTarL,
      simpleAttackOffTarR: simpleAttackOffTarR,
      compoundAttackHitsL: compoundAttackHitsL,
      compoundAttackHitsR: compoundAttackHitsR,
      compoundAttackOffTarL: compoundAttackOffTarL,
      compoundAttackOffTarR: compoundAttackOffTarR,
      parryRiposteHitsL: parryRiposteHitsL,
      parryRiposteHitsR: parryRiposteHitsR,
      parryRiposteOffTargetL: parryRiposteOffTargetL,
      parryRiposteOffTargetR: parryRiposteOffTargetR,
      remiseHitsL: remiseHitsL,
      remiseHitsR: remiseHitsR,
      remiseOffTarL: remiseOffTarL,
      remiseOffTarR: remiseOffTarR,
      counterattackHitsL: counterattackHitsL,
      counterattackHitsR: counterattackHitsR,
      counterattackOffTarL: counterattackOffTarL,
      counterattackOffTarR: counterattackOffTarR,
      pointInLineHitsL: pointInLineHitsL,
      pointInLineHitsR: pointInLineHitsR,
      pointInLineOffTarL: pointInLineOffTarL,
      pointInLineOffTarR: pointInLineOffTarR,
      timestamp: timestamp,
      periodstamp: periodstamp,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MatchStatSnapshotStruct? updateMatchStatSnapshotStruct(
  MatchStatSnapshotStruct? matchStatSnapshot, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    matchStatSnapshot
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMatchStatSnapshotStructData(
  Map<String, dynamic> firestoreData,
  MatchStatSnapshotStruct? matchStatSnapshot,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (matchStatSnapshot == null) {
    return;
  }
  if (matchStatSnapshot.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && matchStatSnapshot.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final matchStatSnapshotData =
      getMatchStatSnapshotFirestoreData(matchStatSnapshot, forFieldValue);
  final nestedData =
      matchStatSnapshotData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = matchStatSnapshot.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMatchStatSnapshotFirestoreData(
  MatchStatSnapshotStruct? matchStatSnapshot, [
  bool forFieldValue = false,
]) {
  if (matchStatSnapshot == null) {
    return {};
  }
  final firestoreData = mapToFirestore(matchStatSnapshot.toMap());

  // Add any Firestore field values
  matchStatSnapshot.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMatchStatSnapshotListFirestoreData(
  List<MatchStatSnapshotStruct>? matchStatSnapshots,
) =>
    matchStatSnapshots
        ?.map((e) => getMatchStatSnapshotFirestoreData(e, true))
        .toList() ??
    [];
