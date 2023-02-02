// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
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
  newSnapshot.pointsL = (statsSnapshot.pointsL)! + 1;
  newSnapshot.timestamp = timestamp;
  newSnapshot.periodstamp = period;

  MatchStatSnapshotStruct newStruct = newSnapshot.build();

  return newStruct;
}
