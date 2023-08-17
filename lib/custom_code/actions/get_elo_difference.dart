// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

Future<int> getEloDifference(
  int leftFencerElo,
  int rightFencerElo,
  bool didLeftWin,
) async {
  double eloDiff = 0;

  if (didLeftWin) {
    eloDiff =
        30 * (1 / (pow(10, ((leftFencerElo - rightFencerElo) / 400)) + 1));
  } else {
    eloDiff =
        30 * (1 / (pow(10, ((rightFencerElo - leftFencerElo) / 400)) + 1));
  }

  return eloDiff.round();
}
