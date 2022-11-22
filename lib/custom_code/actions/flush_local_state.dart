// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future flushLocalState() async {
  FFAppState().beginBreak = false;
  FFAppState().beginNextPer = false;
  FFAppState().currentFencerName = "";
  FFAppState().currentFencerPicURL = "";
  FFAppState().currentMatchEvents = [];
  FFAppState().currentPeriod = 1;
  FFAppState().endOfBout = false;
  FFAppState().endOfBoutPopup = false;
  FFAppState().isLeftFencerAction = true;
  FFAppState().isRightFencer = false;
  FFAppState().isSimultaneous = false;
  FFAppState().isTimerRunning = false;
  FFAppState().leftFencerRef = null;
  FFAppState().nonAttackLabel = "";
  FFAppState().onBreak = false;
  FFAppState().refFencers.clear();
  FFAppState().refIsHit = false;
  FFAppState().refLeftName = "";
  FFAppState().refLeftPhoto = "";
  FFAppState().refLeftScore = 0;
  FFAppState().refRightName = "";
  FFAppState().refRightPhoto = "";
  FFAppState().refRightScore = 0;
  FFAppState().refSecondTextAction = "";
  FFAppState().refereeweaponselect = "";
  FFAppState().rightFencerRef = null;
  FFAppState().scannedFencerRef = null;
  FFAppState().showActions = false;
  FFAppState().startStopText = "START";
}
