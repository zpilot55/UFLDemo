import '/auth/firebase_auth/auth_util.dart';
import '/components/col_main_drawer_widget.dart';
import '/edit_profile/edit_profile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Col_mainDrawer component.
  late ColMainDrawerModel colMainDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    colMainDrawerModel = createModel(context, () => ColMainDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    colMainDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
