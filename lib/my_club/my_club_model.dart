import '/components/col_main_drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyClubModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for Col_mainDrawer component.
  late ColMainDrawerModel colMainDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    colMainDrawerModel = createModel(context, () => ColMainDrawerModel());
  }

  void dispose() {
    colMainDrawerModel.dispose();
  }

  /// Additional helper methods are added here.

}
