import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String getfirstname(String username) {
  List<String> fullnameList = username.split(" ");
  return fullnameList.first;
}

int minutesToMS(int inputMinutes) {
  return inputMinutes * 60000;
}

String getActionStringFromID(int actionID) {
  switch (actionID) {
    case -32:
      {
        return "End of Per. 3";
      }
    case -31:
      {
        return "Beg. of Per. 3";
      }
    case -22:
      {
        return "End of Per. 2";
      }
    case -21:
      {
        return "Beg. of Per. 2";
      }
    case -12:
      {
        return "End of Per. 1";
      }
    case -11:
      {
        return "Beg. of Per. 1";
      }
    case -2:
      {
        return "End of match";
      }
    case -1:
      {
        return "Start of match";
      }
    case 0:
      {
        return "ERROR: NOT FOUND";
      }
    case 1:
      {
        return "Ref. HALT";
      }
    case 2:
      {
        return "Simult.";
      }
    case 100:
      {
        return "Simp atk HITS";
      }
    case 101:
      {
        return "Comp atk HITS";
      }
    case 102:
      {
        return "Pry/Rip HITS";
      }
    case 103:
      {
        return "Remise HITS";
      }
    case 104:
      {
        return "Cnt/Atk HITS";
      }
    case 105:
      {
        return "Pt/Ln HITS";
      }
    case 140:
      {
        return "Simp atk OFF TAR";
      }
    case 141:
      {
        return "Comp atk OFF TAR";
      }
    case 142:
      {
        return "Pry/Rip OFF TAR";
      }
    case 143:
      {
        return "Remise OFF TAR";
      }
    case 144:
      {
        return "Cnt/Atk OFF TAR";
      }
    case 145:
      {
        return "Pt/Ln OFF TAR";
      }
    case 180:
      {
        return "Fencer HALT";
      }
    case 190:
      {
        return "YLW CARD";
      }
    case 191:
      {
        return "RED CARD";
      }
    case 200:
      {
        return "Simp atk HITS";
      }
    case 201:
      {
        return "Comp atk HITS";
      }
    case 202:
      {
        return "Pry/Rip HITS";
      }
    case 203:
      {
        return "Remise HITS";
      }
    case 204:
      {
        return "Cnt/Atk HITS";
      }
    case 205:
      {
        return "Pt/Ln HITS";
      }
    case 240:
      {
        return "Simp atk OFF TAR";
      }
    case 241:
      {
        return "Comp atk OFF TAR";
      }
    case 242:
      {
        return "Pry/Rip OFF TAR";
      }
    case 243:
      {
        return "Remise OFF TAR";
      }
    case 244:
      {
        return "Cnt/Atk OFF TAR";
      }
    case 245:
      {
        return "Pt/Ln OFF TAR";
      }
    case 280:
      {
        return "Fencer HALT";
      }
    case 290:
      {
        return "YELLOW CARD";
      }
    case 291:
      {
        return "RED CARD";
      }
    default:
      {
        return "ERROR: No action ID!";
      }
  }
}

int getActionIDfromRefState(
  bool isLeftFencer,
  String? drop1,
  bool isOffTarget,
  String? nonAttackLabel,
) {
  int code = 0;
  switch (nonAttackLabel) {
    case "Simultaneous":
      {
        return 2;
      }
    case "Yellow Card":
      {
        code = 190;
        break;
      }
    case "Red Card":
      {
        code = 191;
        break;
      }
    case "Pause":
      {
        code = 180;
        break;
      }
    default:
      {
        if (isOffTarget) {
          code = code + 40;
        }
        switch (drop1) {
          case "Simple Attack":
            {
              code = 100;
              break;
            }
          case "Compound":
            {
              code = 101;
              break;
            }
          case "Parry/Riposte":
            {
              code = 102;
              break;
            }
          case "Remise":
            {
              code = 103;
              break;
            }
          case "Counterattack":
            {
              code = 104;
              break;
            }
          case "Point in Line":
            {
              code = 105;
            }
        }
      }
  }
  if (!isLeftFencer) {
    code = code + 100;
  }
  return code;
}

dynamic makeMatchEventJSON(
  int actionID,
  DocumentReference actionableFencer,
  int periodOfAction,
  int scoreLeft,
  int scoreRight,
  int timeOfAction,
) {
  dynamic json = {};
  json['actionID'] = actionID;
  json['actionableFencer'] = actionableFencer;
  json['periodOfAction'] = periodOfAction;
  json['scoreLeft'] = scoreLeft;
  json['scoreRight'] = scoreRight;
  json['timeOfAction'] = timeOfAction;
  return json;
}

String msToMinSecFormat(int inputMS) {
  // convert milliseconds to minutes and seconds
  var ms = inputMS;
  var sec = (ms / 1000).truncate();

  ms -= sec * 1000;
  var min = (sec / 60).truncate();
  sec -= (min * 60);
//  var hours = (min / 60).truncate();
//  min -= (hours * 60);

  String minStr = min.toString();
  if (min < 10) {
    minStr = '0' + min.toString();
  }
  String secStr = sec.toString();
  if (sec < 10) {
    secStr = '0' + sec.toString();
  }
  return '$minStr:$secStr';
}
