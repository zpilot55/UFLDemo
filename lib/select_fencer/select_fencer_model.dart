import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'select_fencer_widget.dart' show SelectFencerWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class SelectFencerModel extends FlutterFlowModel<SelectFencerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  var currentFencerID = '';
  List<UsersRecord> simpleSearchResults = [];
  // Stores action output result for [Custom Action - getCurrentUserDocument] action in ButtonScanQR widget.
  UsersRecord? currentUserRecord;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
