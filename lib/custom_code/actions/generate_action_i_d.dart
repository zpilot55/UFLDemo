// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<int> generateActionID(
  bool isLeftFencer,
  String? drop1,
  bool isOffTarget,
  String nonAttackLabel,
) async {
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
        if (isOffTarget) {
          code = code + 40;
        }
      }
  }
  if (!isLeftFencer) {
    code = code + 100;
  }
  return code;
}
