// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> setActionFromDropdown(
  String? actionDropText,
  String? hitDropText,
) async {
  FFAppState().update(() {
    FFAppState().isSimultaneous = false;
    FFAppState().nonAttackLabel = '';
  });
  if (hitDropText == 'HITS') {
    FFAppState().update(() {
      FFAppState().refIsHit = true;
    });
  } else {
    FFAppState().update(() {
      FFAppState().refIsHit = false;
    });
  }
  FFAppState().update(() {
    FFAppState().isSimultaneous = false;
  });
  return "'s $actionDropText ${hitDropText == 'HITS' ? ' HITS' : ' IS OFF TARGET'}";
}
