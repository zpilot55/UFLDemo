import 'dart:collection';
import 'dart:math';

import 'package:u_f_l_demo/app_state.dart';
import 'package:u_f_l_demo/backend/backend.dart';
import 'package:u_f_l_demo/ref_view2/ref_view_operate.dart';
import 'package:u_f_l_demo/ref_view2/ref_view_record.dart';

class RefViewEvent {
  int isLeftLost = 0; //影响左
  int isLeftMain = 0; //发起左
  int isLeftChange = 0; //挑战左

  int time = -1; //发生时间

  int cardType = -1;

  String hint = ""; //提示

  double lost = 0; //失分
}

class RefViewMatch {
  List<List<RefViewEvent>>? periodList;

  String leftName = "Left Fencer";
  String rightName = "Right Fencer";
  String leftIcon = "";
  String rightIcon = "";

  int maxTouch = 15;

  int maxSeconds = 300; //180
  int currentSeconds = 0;

  int currentPeriod = 1;
  int maxPeriod = 3; //3

  int leftChallenge = 3;
  int rightChallenge = 3;

  int leftScore = 0;
  int rightScore = 0;

  int priority = 0;

  DateTime? scheduledTime;

  RefViewMatch() {
    periodList = [];
    scheduledTime = new DateTime.now();
    for (int i = 0; i < maxPeriod + 1; i++) {
      //+1 包含加时赛
      periodList!.add([]);
    }
  }

  List<RefViewEvent> getEvent(int period) {
    return periodList![(period - 1)];
  }

  void addEvent(RefViewEvent value) {
    getEvent(currentPeriod).add(value);
  }

  List getLostScore() {
    List<RefViewEvent> eventList = getEvent(currentPeriod);
    double leftLost = 0;
    double rightLost = 0;
    eventList.forEach((element) {
      if (element.isLeftLost == RefViewOperateState.POS_LEFT) {
        leftLost += element.lost;
      }
      if (element.isLeftLost == RefViewOperateState.POS_RIGHT) {
        rightLost += element.lost;
      }
    });

    int result = -1;
    if (leftLost >= maxTouch) {
      if (leftLost == rightLost) {
        result = 0;
      } else {
        result = 2;
      }
    }
    if (rightLost >= maxTouch) {
      if (leftLost == rightLost) {
        result = 0;
      } else {
        result = 1;
      }
    }

    return [leftLost.toInt(), rightLost.toInt(), result];
  }

  int result() {
    List<RefViewEvent> eventList = getEvent(currentPeriod);
    int leftLost = 0;
    int rightLost = 0;
    eventList.forEach((element) {
      if (element.isLeftLost == RefViewOperateState.POS_LEFT) {
        leftLost += element.lost.toInt();
      }
      if (element.isLeftLost == RefViewOperateState.POS_RIGHT) {
        rightLost += element.lost.toInt();
      }
    });

    if (leftLost > rightLost) {
      return 2;
    }
    if (rightLost > leftLost) {
      return 1;
    }
    return 0;
  }

  List getCard() {
    List<RefViewEvent> eventList = getEvent(currentPeriod);
    int leftYellow = 0;
    int leftRed = 0;
    int leftBlack = 0;

    int rightYellow = 0;
    int rightRed = 0;
    int rightBlack = 0;

    eventList.forEach((element) {
      if (element.cardType == 0) {
        if (element.isLeftLost == RefViewOperateState.POS_LEFT) {
          leftYellow++;
        }
        if (element.isLeftLost == RefViewOperateState.POS_RIGHT) {
          rightYellow++;
        }
      }
      if (element.cardType == 1) {
        if (element.isLeftLost == RefViewOperateState.POS_LEFT) {
          leftRed++;
        }
        if (element.isLeftLost == RefViewOperateState.POS_RIGHT) {
          rightRed++;
        }
      }
      if (element.cardType == 2) {
        if (element.isLeftLost == RefViewOperateState.POS_LEFT) {
          leftBlack++;
        }
        if (element.isLeftLost == RefViewOperateState.POS_RIGHT) {
          rightBlack++;
        }
      }
    });

    return [leftYellow, leftRed, leftBlack, rightYellow, rightRed, rightBlack];
  }

  void reset() {}

  bool isOvertime() {
    if (currentPeriod > maxPeriod) {
      return true;
    }
    return false;
  }

  bool isAppend() {
    if (leftScore == rightScore &&
        currentPeriod >= maxPeriod &&
        leftScore < maxTouch &&
        priority == 0) {
      return true;
    }
    return false;
  }

  Future<MatchesDevRecord> getFireStore() async {
    List<MatchEventStruct>? _matchEvents = [];
    List<StatlineStruct>? _statlines = [];
    MatchStatSnapshotStruct? _overallStats = initSnap(0);

    List<MatchStatSnapshotStruct> _periodStats = [];

    List<MatchStatSnapshotStruct>? _matchStats = [];

    for (int i = 0; i < periodList!.length; i++) {
      List<RefViewEvent> eventList = periodList![i];
      MatchStatSnapshotStruct pM = initSnap(i);
      for (int j = 0; j < eventList.length; j++) {
        var lScore = 0;
        var rScore = 0;
        RefViewEvent event = eventList[j];
        if (event.isLeftLost == RefViewOperateState.POS_LEFT) {
          rScore = event.lost.toInt();
        }
        if (event.isLeftLost == RefViewOperateState.POS_RIGHT) {
          lScore = event.lost.toInt();
        }

        final results = totalSnap(_overallStats, pM, event, i);

        MatchStatSnapshotStruct snapshotStruct =  results.$1;
        int actionId =  results.$2;

        MatchEventStruct eventStruct = MatchEventStruct(
            actionableFencer: lScore >= rScore
                ? FFAppState().leftFencerRef
                : FFAppState().rightFencerRef,
            actionID: actionId,
            scoreRight: rScore,
            scoreLeft: lScore,
            timeOfAction: event.time,
            periodOfAction: (i + 1),
            videoURL: RefViewRecord.currentPath);
        _matchEvents.add(eventStruct);

        StatlineStruct statlineStruct = StatlineStruct(
            leftStat: lScore.toDouble(), rightStat: rScore.toDouble(), label: "");

        _statlines.add(statlineStruct);



        _matchStats.add(snapshotStruct);
      }
      _periodStats.add(pM);
    }

    //statsLog
    final matchstatslogDevRecord = MatchstatslogDevRecord.collection.doc();

    final matchstatslogDevData = Map<String, dynamic>();

    //tag
    // List<MatchStatSnapshotStruct>? _matchStats = [];

    matchstatslogDevData["MatchStats"] = _matchStats;

    // await matchstatslogDevRecord.set(matchstatslogDevData);

    MatchstatslogDevRecord matchstatslogDevRecordRes =
        MatchstatslogDevRecord.getDocumentFromData(
            mapFromFirestore(matchstatslogDevData), matchstatslogDevRecord);

    //detail
    final matchdetailsDevRecord = MatchdetailsDevRecord.collection.doc();

    final matchdetailsDevData = Map<String, dynamic>();

    //tag
    // List<MatchEventStruct>? _matchEvents = [];
    // List<StatlineStruct>? _statlines = [];
    // MatchStatSnapshotStruct? _overallStats;
    // List<MatchStatSnapshotStruct>? _periodStats;

    matchdetailsDevData["MatchEvents"] = _matchEvents;
    matchdetailsDevData["Statlines"] = _statlines;
    matchdetailsDevData["PeriodStats"] = _periodStats;
    matchdetailsDevData["OverallStats"] = _overallStats;

    // await matchdetailsDevRecord.set(matchdetailsDevData);

    MatchdetailsDevRecord matchdetailsDevRecordRes =
        MatchdetailsDevRecord.getDocumentFromData(
            mapFromFirestore(matchdetailsDevData), matchdetailsDevRecord);

    //main
    final matchesDevRecord = MatchesDevRecord.collection.doc();

    final matchesDevData = createMatchesDevRecordData(
        user1: FFAppState().leftFencerRef,
        user2: FFAppState().rightFencerRef,
        scheduledTime: scheduledTime,
        noOfPeriods: currentPeriod,
        weapon: FFAppState().refereeweaponselect,
        location: null,
        scoreLeft: leftScore,
        scoreRight: rightScore,
        matchRanking: FFAppState().refereemodeselect,
        matchDetails: matchdetailsDevRecordRes.reference,
        matchStatsLog: matchstatslogDevRecordRes.reference);

    await matchesDevRecord.set(matchesDevData);
    MatchesDevRecord res =
        MatchesDevRecord.getDocumentFromData(matchesDevData, matchesDevRecord);

    return res;
  }

  (MatchStatSnapshotStruct m, int actionId) totalSnap(MatchStatSnapshotStruct total,
      MatchStatSnapshotStruct ptotal, RefViewEvent event, int index) {
    int pointsL = 0;
    int pointsR = 0;
    int yellowCardsL = 0;
    int yellowCardsR = 0;
    int redCardsL = 0;
    int redCardsR = 0;
    int simultaneous = 0;
    int haltsRef = 0;
    int haltsL = 0;
    int haltsR = 0;
    int simpleAttackHitsL = 0;
    int simpleAttackHitsR = 0;
    int simpleAttackOffTarL = 0;
    int simpleAttackOffTarR = 0;
    int compoundAttackHitsL = 0;
    int compoundAttackHitsR = 0;
    int compoundAttackOffTarL = 0;
    int compoundAttackOffTarR = 0;
    int parryRiposteHitsL = 0;
    int parryRiposteHitsR = 0;
    int parryRiposteOffTargetL = 0;
    int parryRiposteOffTargetR = 0;
    int remiseHitsL = 0;
    int remiseHitsR = 0;
    int remiseOffTarL = 0;
    int remiseOffTarR = 0;
    int counterattackHitsL = 0;
    int counterattackHitsR = 0;
    int counterattackOffTarL = 0;
    int counterattackOffTarR = 0;
    int pointInLineHitsL = 0;
    int pointInLineHitsR = 0;
    int pointInLineOffTarL = 0;
    int pointInLineOffTarR = 0;

    int actionId = 0;

    if (event.cardType == 0) {
      if (event.isLeftLost == RefViewOperateState.POS_LEFT) {
        yellowCardsL++;
        actionId = LeftYELLOWCARD;
      }
      if (event.isLeftLost == RefViewOperateState.POS_RIGHT) {
        yellowCardsR++;
        actionId = RightYELLOWCARD;
      }
    } else if (event.cardType == 1) {
      if (event.isLeftLost == RefViewOperateState.POS_LEFT) {
        redCardsL++;
        actionId = LeftREDCARD;
      }
      if (event.isLeftLost == RefViewOperateState.POS_RIGHT) {
        redCardsR++;
        actionId = RightREDCARD;
      }
    } else {
      if (event.hint.contains("Simple attack") && event.hint.contains("Hits")) {
        if (event.isLeftLost == RefViewOperateState.POS_LEFT) {
          simpleAttackHitsR++;
          actionId = RightSimpleAttackHITS;
        } else if (event.isLeftLost == RefViewOperateState.POS_RIGHT) {
          simpleAttackHitsL++;
          actionId = LeftSimpleAttackHITS;
        } else {
          simultaneous++;
          actionId = RefSimultaneousHITS;
        }
      }

      if (event.hint.contains("Simple attack") &&
          event.hint.contains("Off Target")) {
        if (event.isLeftLost == RefViewOperateState.POS_LEFT) {
          simpleAttackOffTarR++;
          actionId = RightSimpleAttackOffTarget;
        } else if (event.isLeftLost == RefViewOperateState.POS_RIGHT) {
          simpleAttackOffTarL++;
          actionId = LeftSimpleAttackOffTarget;
        } else {
          simultaneous++;
          actionId = RefSimultaneousHITS;
        }
      }

      if (event.hint.contains("Compound attack") &&
          event.hint.contains("Hits")) {
        if (event.isLeftLost == RefViewOperateState.POS_LEFT) {
          compoundAttackHitsR++;
          actionId = RightCompoundAttackHITS;
        } else if (event.isLeftLost == RefViewOperateState.POS_RIGHT) {
          compoundAttackHitsL++;
          actionId = LeftCompoundAttackHITS;
        } else {
          simultaneous++;
          actionId = RefSimultaneousHITS;
        }
      }

      if (event.hint.contains("Compound attack") &&
          event.hint.contains("Off Target")) {
        if (event.isLeftLost == RefViewOperateState.POS_LEFT) {
          compoundAttackOffTarR++;
          actionId = RightCompoundAttackOffTarget;
        } else if (event.isLeftLost == RefViewOperateState.POS_RIGHT) {
          compoundAttackOffTarL++;
          actionId = LeftCompoundAttackOffTarget;
        } else {
          simultaneous++;
          actionId = RefSimultaneousHITS;
        }
      }

      if (event.hint.contains("Point in line") && event.hint.contains("Hits")) {
        if (event.isLeftLost == RefViewOperateState.POS_LEFT) {
          pointInLineHitsR++;
          actionId = RightPointInLineHITS;
        } else if (event.isLeftLost == RefViewOperateState.POS_RIGHT) {
          pointInLineHitsL++;
          actionId = LeftPointInLineHITS;
        } else {
          simultaneous++;
          actionId = RefSimultaneousHITS;
        }
      }

      if (event.hint.contains("Point in line") &&
          event.hint.contains("Off Target")) {
        if (event.isLeftLost == RefViewOperateState.POS_LEFT) {
          pointInLineOffTarR++;
          actionId = RightPointInLineOffTarget;
        } else if (event.isLeftLost == RefViewOperateState.POS_RIGHT) {
          pointInLineOffTarL++;
          actionId = LeftPointInLineOffTarget;
        } else {
          simultaneous++;
          actionId = RefSimultaneousHITS;
        }
      }

      if (event.hint.contains("Parry-riposte") && event.hint.contains("Hits")) {
        if (event.isLeftLost == RefViewOperateState.POS_LEFT) {
          parryRiposteHitsR++;
          actionId = RightParryRiposteHITS;
        } else if (event.isLeftLost == RefViewOperateState.POS_RIGHT) {
          parryRiposteHitsL++;
          actionId = LeftParryRiposteHITS;
        } else {
          simultaneous++;
          actionId = RefSimultaneousHITS;
        }
      }

      if (event.hint.contains("Parry-riposte") &&
          event.hint.contains("Off Target")) {
        if (event.isLeftLost == RefViewOperateState.POS_LEFT) {
          parryRiposteOffTargetR++;
          actionId = RightParryRiposteOffTarget;
        } else if (event.isLeftLost == RefViewOperateState.POS_RIGHT) {
          parryRiposteOffTargetL++;
          actionId = LeftParryRiposteOffTarget;
        } else {
          simultaneous++;
          actionId = RefSimultaneousHITS;
        }
      }

      if (event.hint.contains("Counterattack") && event.hint.contains("Hits")) {
        if (event.isLeftLost == RefViewOperateState.POS_LEFT) {
          counterattackHitsR++;
          actionId = RightCounterattackHITS;
        } else if (event.isLeftLost == RefViewOperateState.POS_RIGHT) {
          counterattackHitsL++;
          actionId = LeftCounterattackHITS;
        } else {
          simultaneous++;
          actionId = RefSimultaneousHITS;
        }
      }

      if (event.hint.contains("Counterattack") &&
          event.hint.contains("Off Target")) {
        if (event.isLeftLost == RefViewOperateState.POS_LEFT) {
          counterattackOffTarR++;
          actionId = RightCounterattackOffTarget;
        } else if (event.isLeftLost == RefViewOperateState.POS_RIGHT) {
          counterattackOffTarL++;
          actionId = LeftCounterattackOffTarget;
        } else {
          simultaneous++;
          actionId = RefSimultaneousHITS;
        }
      }

      if (event.hint.contains("Remise") && event.hint.contains("Hits")) {
        if (event.isLeftLost == RefViewOperateState.POS_LEFT) {
          remiseHitsR++;
          actionId = RightRemiseHITS;
        } else if (event.isLeftLost == RefViewOperateState.POS_RIGHT) {
          remiseHitsL++;
          actionId = LeftRemiseHITS;
        } else {
          simultaneous++;
          actionId = RefSimultaneousHITS;
        }
      }

      if (event.hint.contains("Remise") && event.hint.contains("Off Target")) {
        if (event.isLeftLost == RefViewOperateState.POS_LEFT) {
          remiseOffTarR++;
          actionId = RightRemiseOffTarget;
        } else if (event.isLeftLost == RefViewOperateState.POS_RIGHT) {
          remiseOffTarL++;
          actionId = LeftRemiseOffTarget;
        } else {
          simultaneous++;
          actionId = RefSimultaneousHITS;
        }
      }

      if (event.isLeftChange == RefViewOperateState.POS_LEFT) {
        haltsRef = event.isLeftChange;
        haltsL++;
      }
      if (event.isLeftChange == RefViewOperateState.POS_RIGHT) {
        haltsRef = event.isLeftChange;
        haltsR++;
      }
    }

    MatchStatSnapshotStruct snapshotStruct = MatchStatSnapshotStruct(
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
      timestamp: event.time,
      periodstamp: (index + 1),
    );

    total.pointsL += snapshotStruct.pointsL;
    total.yellowCardsL += snapshotStruct.yellowCardsL;
    total.yellowCardsR += snapshotStruct.yellowCardsR;
    total.redCardsL += snapshotStruct.redCardsL;
    total.redCardsR += snapshotStruct.redCardsR;
    total.simultaneous += snapshotStruct.simultaneous;
    total.haltsRef += snapshotStruct.haltsRef;
    total.haltsL += snapshotStruct.haltsL;
    total.haltsR += snapshotStruct.haltsR;
    total.simpleAttackHitsL += snapshotStruct.simpleAttackHitsL;
    total.simpleAttackHitsR += snapshotStruct.simpleAttackHitsR;
    total.simpleAttackOffTarL += snapshotStruct.simpleAttackOffTarL;
    total.simpleAttackOffTarR += snapshotStruct.simpleAttackOffTarR;
    total.compoundAttackHitsL += snapshotStruct.compoundAttackHitsL;
    total.compoundAttackHitsR += snapshotStruct.compoundAttackHitsR;
    total.compoundAttackOffTarL += snapshotStruct.compoundAttackOffTarL;
    total.compoundAttackOffTarR += snapshotStruct.compoundAttackOffTarR;
    total.parryRiposteHitsL += snapshotStruct.parryRiposteHitsL;
    total.parryRiposteHitsR += snapshotStruct.parryRiposteHitsR;
    total.parryRiposteOffTargetL += snapshotStruct.parryRiposteOffTargetL;
    total.parryRiposteOffTargetR += snapshotStruct.parryRiposteOffTargetR;
    total.remiseHitsL += snapshotStruct.remiseHitsL;
    total.remiseHitsR += snapshotStruct.remiseHitsR;
    total.remiseOffTarL += snapshotStruct.remiseOffTarL;
    total.remiseOffTarR += snapshotStruct.remiseOffTarR;
    total.counterattackHitsL += snapshotStruct.counterattackHitsL;
    total.counterattackHitsR += snapshotStruct.counterattackHitsR;
    total.counterattackOffTarL += snapshotStruct.counterattackOffTarL;
    total.counterattackOffTarR += snapshotStruct.counterattackOffTarR;
    total.pointInLineHitsL += snapshotStruct.pointInLineHitsL;
    total.pointInLineHitsR += snapshotStruct.pointInLineHitsR;
    total.pointInLineOffTarL += snapshotStruct.pointInLineOffTarL;
    total.pointInLineOffTarR += snapshotStruct.pointInLineOffTarR;

    ptotal.pointsL += snapshotStruct.pointsL;
    ptotal.yellowCardsL += snapshotStruct.yellowCardsL;
    ptotal.yellowCardsR += snapshotStruct.yellowCardsR;
    ptotal.redCardsL += snapshotStruct.redCardsL;
    ptotal.redCardsR += snapshotStruct.redCardsR;
    ptotal.simultaneous += snapshotStruct.simultaneous;
    ptotal.haltsRef += snapshotStruct.haltsRef;
    ptotal.haltsL += snapshotStruct.haltsL;
    ptotal.haltsR += snapshotStruct.haltsR;
    ptotal.simpleAttackHitsL += snapshotStruct.simpleAttackHitsL;
    ptotal.simpleAttackHitsR += snapshotStruct.simpleAttackHitsR;
    ptotal.simpleAttackOffTarL += snapshotStruct.simpleAttackOffTarL;
    ptotal.simpleAttackOffTarR += snapshotStruct.simpleAttackOffTarR;
    ptotal.compoundAttackHitsL += snapshotStruct.compoundAttackHitsL;
    ptotal.compoundAttackHitsR += snapshotStruct.compoundAttackHitsR;
    ptotal.compoundAttackOffTarL += snapshotStruct.compoundAttackOffTarL;
    ptotal.compoundAttackOffTarR += snapshotStruct.compoundAttackOffTarR;
    ptotal.parryRiposteHitsL += snapshotStruct.parryRiposteHitsL;
    ptotal.parryRiposteHitsR += snapshotStruct.parryRiposteHitsR;
    ptotal.parryRiposteOffTargetL += snapshotStruct.parryRiposteOffTargetL;
    ptotal.parryRiposteOffTargetR += snapshotStruct.parryRiposteOffTargetR;
    ptotal.remiseHitsL += snapshotStruct.remiseHitsL;
    ptotal.remiseHitsR += snapshotStruct.remiseHitsR;
    ptotal.remiseOffTarL += snapshotStruct.remiseOffTarL;
    ptotal.remiseOffTarR += snapshotStruct.remiseOffTarR;
    ptotal.counterattackHitsL += snapshotStruct.counterattackHitsL;
    ptotal.counterattackHitsR += snapshotStruct.counterattackHitsR;
    ptotal.counterattackOffTarL += snapshotStruct.counterattackOffTarL;
    ptotal.counterattackOffTarR += snapshotStruct.counterattackOffTarR;
    ptotal.pointInLineHitsL += snapshotStruct.pointInLineHitsL;
    ptotal.pointInLineHitsR += snapshotStruct.pointInLineHitsR;
    ptotal.pointInLineOffTarL += snapshotStruct.pointInLineOffTarL;
    ptotal.pointInLineOffTarR += snapshotStruct.pointInLineOffTarR;
    return (snapshotStruct, actionId);
  }

  MatchStatSnapshotStruct initSnap(int index) {
    MatchStatSnapshotStruct snapshotStruct = MatchStatSnapshotStruct(
      pointsL: 0,
      pointsR: 0,
      yellowCardsL: 0,
      yellowCardsR: 0,
      redCardsL: 0,
      redCardsR: 0,
      simultaneous: 0,
      haltsRef: 0,
      haltsL: 0,
      haltsR: 0,
      simpleAttackHitsL: 0,
      simpleAttackHitsR: 0,
      simpleAttackOffTarL: 0,
      simpleAttackOffTarR: 0,
      compoundAttackHitsL: 0,
      compoundAttackHitsR: 0,
      compoundAttackOffTarL: 0,
      compoundAttackOffTarR: 0,
      parryRiposteHitsL: 0,
      parryRiposteHitsR: 0,
      parryRiposteOffTargetL: 0,
      parryRiposteOffTargetR: 0,
      remiseHitsL: 0,
      remiseHitsR: 0,
      remiseOffTarL: 0,
      remiseOffTarR: 0,
      counterattackHitsL: 0,
      counterattackHitsR: 0,
      counterattackOffTarL: 0,
      counterattackOffTarR: 0,
      pointInLineHitsL: 0,
      pointInLineHitsR: 0,
      pointInLineOffTarL: 0,
      pointInLineOffTarR: 0,
      timestamp: 0,
      periodstamp: (index + 1),
    );
    return snapshotStruct;
  }

  final int RefSimultaneousHITS = 2;

  final int LeftSimpleAttackHITS = 100;
  final int LeftCompoundAttackHITS = 101;
  final int LeftParryRiposteHITS = 102;
  final int LeftRemiseHITS = 103;
  final int LeftCounterattackHITS = 104;
  final int LeftPointInLineHITS = 105;
  final int LeftBeatAttackHITS = 106;
  final int LeftOppositionHITS = 107;
  final int LeftAttackNoAttackHITS = 108;
  final int LeftSimpleAttackOffTarget = 140;
  final int LeftCompoundAttackOffTarget = 141;
  final int LeftParryRiposteOffTarget = 142;
  final int LeftRemiseOffTarget = 143;
  final int LeftCounterattackOffTarget = 144;
  final int LeftPointInLineOffTarget = 145;
  final int LeftBeatAttackOffTarget = 146;
  final int LeftOppositionOffTarget = 147;
  final int LeftAttackNoAttackOffTarget = 148;
  final int LeftYELLOWCARD = 190;
  final int LeftREDCARD = 191;
  final int LeftBLACKCARD = 192;


  final int RightSimpleAttackHITS = 200;
  final int RightCompoundAttackHITS = 201;
  final int RightParryRiposteHITS = 202;
  final int RightRemiseHITS = 203;
  final int RightCounterattackHITS = 204;
  final int RightPointInLineHITS = 205;
  final int RightBeatAttackHITS = 206;
  final int RightOppositionHITS = 207;
  final int RightAttackNoAttackHITS = 208;
  final int RightSimpleAttackOffTarget = 240;
  final int RightCompoundAttackOffTarget = 241;
  final int RightParryRiposteOffTarget = 242;
  final int RightRemiseOffTarget = 243;
  final int RightCounterattackOffTarget = 244;
  final int RightPointInLineOffTarget = 245;
  final int RightBeatAttackOffTarget = 246;
  final int RightOppositionOffTarget = 247;
  final int RightAttackNoAttackOffTarget = 248;
  final int RightYELLOWCARD = 290;
  final int RightREDCARD = 291;
  final int RightBLACKCARD = 292;

}
