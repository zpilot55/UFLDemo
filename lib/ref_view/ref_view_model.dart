import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../ref_match_recap_events/ref_match_recap_events_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RefViewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Timer widget.
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
  );
  StopWatchTimer timerController =
      StopWatchTimer(mode: StopWatchMode.countDown);

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  // Stores action output result for [Custom Action - setActionFromDropdown] action in DropDown widget.
  String? actionText1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  // Stores action output result for [Custom Action - setActionFromDropdown] action in DropDown widget.
  String? actionText2;
  // Stores action output result for [Custom Action - generateActionID] action in Button widget.
  int? currentActionID;
  // Stores action output result for [Custom Action - updateStats] action in Button widget.
  MatchStatSnapshotStruct? newStatsSnapshot;
  // Stores action output result for [Custom Action - generateStatlines] action in Button widget.
  List<StatlineStruct>? newMatchStatlines;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    timerController.dispose();
  }

  /// Additional helper methods are added here.

}
