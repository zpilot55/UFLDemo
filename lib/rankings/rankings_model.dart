import '/backend/backend.dart';
import '/components/col_main_drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RankingsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for Col_mainDrawer component.
  late ColMainDrawerModel colMainDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    colMainDrawerModel = createModel(context, () => ColMainDrawerModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    colMainDrawerModel.dispose();
  }

  /// Additional helper methods are added here.

}
