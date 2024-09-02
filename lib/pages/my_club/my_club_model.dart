import '/components/col_main_drawer/col_main_drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'my_club_widget.dart' show MyClubWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyClubModel extends FlutterFlowModel<MyClubWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Col_mainDrawer component.
  late ColMainDrawerModel colMainDrawerModel;

  @override
  void initState(BuildContext context) {
    colMainDrawerModel = createModel(context, () => ColMainDrawerModel());
  }

  @override
  void dispose() {
    colMainDrawerModel.dispose();
  }
}
