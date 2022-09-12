import '../components/col_main_drawer_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AthletesWidget extends StatefulWidget {
  const AthletesWidget({Key? key}) : super(key: key);

  @override
  _AthletesWidgetState createState() => _AthletesWidgetState();
}

class _AthletesWidgetState extends State<AthletesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Drawer(
        elevation: 16,
        child: ColMainDrawerWidget(),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Icon(
              Icons.people,
              color: Colors.black,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
