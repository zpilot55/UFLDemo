// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future flushMatchActionState() async {
  FFAppState().curentActionVideoURL = "";
  FFAppState().isLeftFencerAction = true;
  FFAppState().isSimultaneous = false;
  FFAppState().nonAttackLabel = "";
  FFAppState().refIsHit = false;
  FFAppState().refSecondTextAction = "";
  FFAppState().showActions = false;
  FFAppState().startStopText = "START";
}
