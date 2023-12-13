import '/components/col_main_drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'rankings_copy_widget.dart' show RankingsCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RankingsCopyModel extends FlutterFlowModel<RankingsCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Col_mainDrawer component.
  late ColMainDrawerModel colMainDrawerModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    colMainDrawerModel = createModel(context, () => ColMainDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    colMainDrawerModel.dispose();
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
