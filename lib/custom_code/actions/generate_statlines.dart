// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<StatlineStruct>> generateStatlines(
    MatchStatSnapshotStruct overallStats) async {
  // Add your function code here!

  List<StatlineStruct> statlines = [];
  List<String> labels = [
    "Yellow Cards",
    "Red Cards",
    "% Final Actions",
    "% Simultaneous",
    "Hit/Off-Target Ratio",
    "ROW Ratio",
    "Aggro Ratio"
  ];

  int totalHitsL = overallStats.simpleAttackHitsL! +
      overallStats.compoundAttackHitsL! +
      overallStats.parryRiposteHitsL! +
      overallStats.remiseHitsL! +
      overallStats.counterattackHitsL! +
      overallStats.pointInLineHitsL!;

  int totalOffTarL = overallStats.simpleAttackOffTarL! +
      overallStats.compoundAttackOffTarL! +
      overallStats.parryRiposteOffTargetL! +
      overallStats.remiseOffTarL! +
      overallStats.counterattackOffTarL! +
      overallStats.pointInLineOffTarL!;

  int totalHitsR = overallStats.simpleAttackHitsR! +
      overallStats.compoundAttackHitsR! +
      overallStats.parryRiposteHitsR! +
      overallStats.remiseHitsR! +
      overallStats.counterattackHitsR! +
      overallStats.pointInLineHitsR!;

  int totalOffTarR = overallStats.simpleAttackOffTarR! +
      overallStats.compoundAttackOffTarR! +
      overallStats.parryRiposteOffTargetR! +
      overallStats.remiseOffTarR! +
      overallStats.counterattackOffTarR! +
      overallStats.pointInLineOffTarR!;

  int totalActions = totalHitsL +
      totalHitsR +
      totalOffTarL +
      totalOffTarR +
      overallStats.simultaneous!;

  double percentFinalActionsL = (totalHitsL + totalOffTarL) / totalActions;
  double percentFinalActionsR = (totalHitsR + totalOffTarR) / totalActions;
  double percentSimultaneous = overallStats.simultaneous! / totalActions;
  double hotRatioL = totalHitsL / totalOffTarL;
  double hotRatioR = totalHitsR / totalOffTarR;

  double rowRatioL = (overallStats.simpleAttackHitsL! +
          overallStats.compoundAttackHitsL! +
          overallStats.parryRiposteHitsL! +
          overallStats.remiseHitsL! +
          overallStats.counterattackHitsL!) /
      totalHitsL;

  double rowRatioR = (overallStats.simpleAttackHitsR! +
          overallStats.compoundAttackHitsR! +
          overallStats.parryRiposteHitsR! +
          overallStats.remiseHitsR! +
          overallStats.counterattackHitsR!) /
      totalHitsR;
  double aggroRatioL = (overallStats.simpleAttackHitsL! +
          overallStats.compoundAttackHitsL! +
          overallStats.parryRiposteHitsL!) /
      totalHitsL;

  double aggroRatioR = (overallStats.simpleAttackHitsR! +
          overallStats.compoundAttackHitsR! +
          overallStats.parryRiposteHitsR!) /
      totalHitsR;

  List<double> leftValues = [
    overallStats.yellowCardsL!.toDouble(),
    overallStats.redCardsL!.toDouble(),
    percentFinalActionsL,
    percentSimultaneous,
    hotRatioL,
    rowRatioL,
    aggroRatioL
  ];
  List<double> rightValues = [
    overallStats.yellowCardsR!.toDouble(),
    overallStats.redCardsR!.toDouble(),
    percentFinalActionsR,
    percentSimultaneous,
    hotRatioR,
    rowRatioR,
    aggroRatioR
  ];

  StatlineStructBuilder tempstatlinebuilder = new StatlineStructBuilder();
  StatlineStruct tempstatline = new StatlineStruct();

  for (int i = 0; i < labels.length; i++) {
    tempstatlinebuilder.label = labels[i];
    tempstatlinebuilder.leftStat = leftValues[i];
    tempstatlinebuilder.rightStat = rightValues[i];
    tempstatline = tempstatlinebuilder.build();
    statlines.add(tempstatline);
  }

  return statlines;
}
