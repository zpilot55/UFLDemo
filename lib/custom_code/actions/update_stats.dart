// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<MatchStatSnapshotStruct> updateStats(
  int actionID,
  int timestamp,
  MatchStatSnapshotStruct statsSnapshot,
  int period,
) async {
  // Add your function code here!

  MatchStatSnapshotStructBuilder newSnapshot =
      new MatchStatSnapshotStructBuilder();

  newSnapshot.replace(statsSnapshot);

  switch (actionID) {
    case 1:
      {
        newSnapshot.haltsRef = (statsSnapshot.haltsRef)! + 1;
        break;
      }
    case 2:
      {
        newSnapshot.simultaneous = (statsSnapshot.simultaneous)! + 1;
        break;
      }
    case 100:
      {
        newSnapshot.simpleAttackHitsL = (statsSnapshot.simpleAttackHitsL)! + 1;
        newSnapshot.pointsL = (statsSnapshot.pointsL)! + 1;
        break;
      }
    case 101:
      {
        newSnapshot.compoundAttackHitsL =
            (statsSnapshot.compoundAttackHitsL)! + 1;
        newSnapshot.pointsL = (statsSnapshot.pointsL)! + 1;
        break;
      }
    case 102:
      {
        newSnapshot.parryRiposteHitsL = (statsSnapshot.parryRiposteHitsL)! + 1;
        newSnapshot.pointsL = (statsSnapshot.pointsL)! + 1;
        break;
      }
    case 103:
      {
        newSnapshot.remiseHitsL = (statsSnapshot.remiseHitsL)! + 1;
        newSnapshot.pointsL = (statsSnapshot.pointsL)! + 1;
        break;
      }
    case 104:
      {
        newSnapshot.counterattackHitsL =
            (statsSnapshot.counterattackHitsL)! + 1;
        newSnapshot.pointsL = (statsSnapshot.pointsL)! + 1;
        break;
      }
    case 105:
      {
        newSnapshot.pointInLineHitsL = (statsSnapshot.pointInLineHitsL)! + 1;
        newSnapshot.pointsL = (statsSnapshot.pointsL)! + 1;
        break;
      }
    case 140:
      {
        newSnapshot.simpleAttackOffTarL =
            (statsSnapshot.simpleAttackOffTarL)! + 1;
        break;
      }
    case 141:
      {
        newSnapshot.compoundAttackOffTarL =
            (statsSnapshot.compoundAttackOffTarL)! + 1;
        break;
      }
    case 142:
      {
        newSnapshot.parryRiposteOffTargetL =
            (statsSnapshot.parryRiposteOffTargetL)! + 1;
        break;
      }
    case 143:
      {
        newSnapshot.remiseOffTarL = (statsSnapshot.remiseOffTarL)! + 1;
        break;
      }
    case 144:
      {
        newSnapshot.counterattackOffTarL =
            (statsSnapshot.counterattackOffTarL)! + 1;
        break;
      }
    case 145:
      {
        newSnapshot.pointInLineOffTarL =
            (statsSnapshot.pointInLineOffTarL)! + 1;
        break;
      }
    case 180:
      {
        newSnapshot.haltsL = (statsSnapshot.haltsL)! + 1;
        break;
      }
    case 190:
      {
        newSnapshot.yellowCardsL = (statsSnapshot.yellowCardsL)! + 1;
        break;
      }
    case 191:
      {
        newSnapshot.redCardsL = (statsSnapshot.redCardsL)! + 1;
        newSnapshot.pointsR = (statsSnapshot.pointsR)! + 1;
        break;
      }
    case 200:
      {
        newSnapshot.simpleAttackHitsR = (statsSnapshot.simpleAttackHitsR)! + 1;
        newSnapshot.pointsR = (statsSnapshot.pointsR)! + 1;
        break;
      }
    case 201:
      {
        newSnapshot.compoundAttackHitsR =
            (statsSnapshot.compoundAttackHitsR)! + 1;
        newSnapshot.pointsR = (statsSnapshot.pointsR)! + 1;
        break;
      }
    case 202:
      {
        newSnapshot.parryRiposteHitsR = (statsSnapshot.parryRiposteHitsR)! + 1;
        newSnapshot.pointsR = (statsSnapshot.pointsR)! + 1;
        break;
      }
    case 203:
      {
        newSnapshot.remiseHitsR = (statsSnapshot.remiseHitsR)! + 1;
        newSnapshot.pointsR = (statsSnapshot.pointsR)! + 1;
        break;
      }
    case 204:
      {
        newSnapshot.counterattackHitsR =
            (statsSnapshot.counterattackHitsR)! + 1;
        newSnapshot.pointsR = (statsSnapshot.pointsR)! + 1;
        break;
      }
    case 205:
      {
        newSnapshot.pointInLineHitsR = (statsSnapshot.pointInLineHitsR)! + 1;
        newSnapshot.pointsR = (statsSnapshot.pointsR)! + 1;
        break;
      }
    case 240:
      {
        newSnapshot.simpleAttackOffTarR =
            (statsSnapshot.simpleAttackOffTarR)! + 1;
        break;
      }
    case 241:
      {
        newSnapshot.compoundAttackOffTarR =
            (statsSnapshot.compoundAttackOffTarR)! + 1;
        break;
      }
    case 242:
      {
        newSnapshot.parryRiposteOffTargetR =
            (statsSnapshot.parryRiposteOffTargetR)! + 1;
        break;
      }
    case 243:
      {
        newSnapshot.remiseOffTarR = (statsSnapshot.remiseOffTarR)! + 1;
        break;
      }
    case 244:
      {
        newSnapshot.counterattackOffTarR =
            (statsSnapshot.counterattackOffTarR)! + 1;
        break;
      }
    case 245:
      {
        newSnapshot.pointInLineOffTarR =
            (statsSnapshot.pointInLineOffTarR)! + 1;
        break;
      }
    case 280:
      {
        newSnapshot.haltsR = (statsSnapshot.haltsR)! + 1;
        break;
      }
    case 290:
      {
        newSnapshot.yellowCardsR = (statsSnapshot.yellowCardsR)! + 1;
        newSnapshot.pointsL = (statsSnapshot.pointsL)! + 1;
        break;
      }
    case 291:
      {
        newSnapshot.redCardsR = (statsSnapshot.redCardsR)! + 1;
        break;
      }
    default:
      {
        return statsSnapshot;
      }
  }

  newSnapshot.timestamp = timestamp;
  newSnapshot.periodstamp = period;
  MatchStatSnapshotStruct newStruct = newSnapshot.build();

  return newStruct;
}
