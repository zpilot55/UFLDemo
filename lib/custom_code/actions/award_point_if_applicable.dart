// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future awardPointIfApplicable(bool isLeftFencerAction, String nonAttackLabel,
    String weapon, bool isHit) async {
  if (nonAttackLabel == "Red Card") {
    if (isLeftFencerAction) {
      FFAppState().refRightScore += 1;
    } else {
      FFAppState().refLeftScore += 1;
    }
  } else if (nonAttackLabel == "Simultaneous" && weapon == "Epee") {
    FFAppState().refLeftScore += 1;
    FFAppState().refRightScore += 1;
  } else if (isHit) {
    if (isLeftFencerAction) {
      FFAppState().refLeftScore += 1;
    } else {
      FFAppState().refRightScore += 1;
    }
  }
}
