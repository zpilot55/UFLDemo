import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ref_view/ref_view_widget.dart';
import '/select_fencer/select_fencer_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RefSetupModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PeriodCount widget.
  int? periodCountValue;
  // State field(s) for TimeCount widget.
  int? timeCountValue;
  // State field(s) for TouchesCount widget.
  int? touchesCountValue;
  // Stores action output result for [Backend Call - Create Document] action in Button-StartBout widget.
  MatchdetailsDevRecord? currentMatchDetails;
  // Stores action output result for [Backend Call - Create Document] action in Button-StartBout widget.
  MatchstatslogDevRecord? currentMatchStatsLog;
  // Stores action output result for [Backend Call - Create Document] action in Button-StartBout widget.
  MatchesDevRecord? currentMatchInProgress;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
