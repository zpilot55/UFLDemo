import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/col_main_drawer_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../match_recap/match_recap_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class MatchHistoryModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for Col_mainDrawer component.
  late ColMainDrawerModel colMainDrawerModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  // State field(s) for ListView widget.
  PagingController<DocumentSnapshot?, MatchesDevRecord>? pagingController;
  Query? pagingQuery;
  List<StreamSubscription?> streamSubscriptions = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    colMainDrawerModel = createModel(context, () => ColMainDrawerModel());
  }

  void dispose() {
    colMainDrawerModel.dispose();
    streamSubscriptions.forEach((s) => s?.cancel());
  }

  /// Additional helper methods are added here.

}
