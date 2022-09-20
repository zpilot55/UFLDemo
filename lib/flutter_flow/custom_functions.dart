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
    case -2:
      {
        return "End of period";
      }
    case -1:
      {
        return "End of match";
      }
    case 0:
      {
        return "Start of match";
      }
    case 1:
      {
        return "Referee called halt";
      }
    case 2:
      {
        return "Simultaneous action";
      }
    case 100:
      {
        return "Simple attack HITS";
      }
    case 101:
      {
        return "Compound attack HITS";
      }
    case 102:
      {
        return "Parry riposte HITS";
      }
    case 103:
      {
        return "Remise HITS";
      }
    case 104:
      {
        return "Counterattack HITS";
      }
    case 105:
      {
        return "Point in line HITS";
      }
    case 140:
      {
        return "Simple attack OFF TARGET";
      }
    case 141:
      {
        return "Compound attack OFF TARGET";
      }
    case 142:
      {
        return "Parry riposte OFF TARGET";
      }
    case 143:
      {
        return "Remise OFF TARGET";
      }
    case 144:
      {
        return "Counterattack OFF TARGET";
      }
    case 145:
      {
        return "Point in line OFF TARGET";
      }
    case 180:
      {
        return "Fencer called halt";
      }
    case 190:
      {
        return "YELLOW CARD";
      }
    case 191:
      {
        return "RED CARD";
      }
    case 200:
      {
        return "Simple attack HITS";
      }
    case 201:
      {
        return "Compound attack HITS";
      }
    case 202:
      {
        return "Parry riposte HITS";
      }
    case 203:
      {
        return "Remise HITS";
      }
    case 204:
      {
        return "Counterattack HITS";
      }
    case 205:
      {
        return "Point in line HITS";
      }
    case 240:
      {
        return "Simple attack OFF TARGET";
      }
    case 241:
      {
        return "Compound attack OFF TARGET";
      }
    case 242:
      {
        return "Parry riposte OFF TARGET";
      }
    case 243:
      {
        return "Remise OFF TARGET";
      }
    case 244:
      {
        return "Counterattack OFF TARGET";
      }
    case 245:
      {
        return "Point in line OFF TARGET";
      }
    case 280:
      {
        return "Fencer called halt";
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
