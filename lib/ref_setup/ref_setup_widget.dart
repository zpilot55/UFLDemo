import '/auth/firebase_auth/auth_util.dart';
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
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ref_setup_model.dart';
export 'ref_setup_model.dart';

class RefSetupWidget extends StatefulWidget {
  const RefSetupWidget({Key? key}) : super(key: key);

  @override
  _RefSetupWidgetState createState() => _RefSetupWidgetState();
}

class _RefSetupWidgetState extends State<RefSetupWidget>
    with TickerProviderStateMixin {
  late RefSetupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RefSetupModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          actions: [],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              Align(
                alignment: Alignment(0.0, 0),
                child: TabBar(
                  labelColor: FlutterFlowTheme.of(context).primary,
                  labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                  unselectedLabelStyle: TextStyle(),
                  indicatorColor: FlutterFlowTheme.of(context).secondary,
                  tabs: [
                    Tab(
                      text: 'Unranked Match',
                    ),
                    Tab(
                      text: 'Ranked Match',
                    ),
                  ],
                  controller: _model.tabBarController,
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _model.tabBarController,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Match Setup',
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Fencers: (Click Name to Scan QR)',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        FFAppState().refLeftPhoto,
                                        'https://firebasestorage.googleapis.com/v0/b/universalfencingleague.appspot.com/o/Fencer_silhouette.png?alt=media&token=7ae87fd2-6264-446f-abbf-c4a7d8d5b642',
                                      ),
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().update(() {
                                          FFAppState().isRightFencer = false;
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SelectFencerWidget(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        valueOrDefault<String>(
                                          FFAppState().refLeftName,
                                          'Left Fencer',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Text(
                                  'VS',
                                  style:
                                      FlutterFlowTheme.of(context).displaySmall,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().update(() {
                                          FFAppState().isRightFencer = true;
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SelectFencerWidget(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        valueOrDefault<String>(
                                          FFAppState().refRightName,
                                          'Right Fencer',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        FFAppState().refRightPhoto,
                                        'https://firebasestorage.googleapis.com/v0/b/universalfencingleague.appspot.com/o/Fencer_silhouette.png?alt=media&token=7ae87fd2-6264-446f-abbf-c4a7d8d5b642',
                                      ),
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
                                  child: Text(
                                    'Select Weapon:',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
                                  child: Text(
                                    valueOrDefault<String>(
                                      FFAppState().refereeweaponselect,
                                      ' <No Weapon>',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.25,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      setState(() {
                                        FFAppState().refereeweaponselect =
                                            'Foil';
                                        FFAppState().isWeaponSelected = true;
                                      });
                                    },
                                    text: 'Foil',
                                    options: FFButtonOptions(
                                      width: 100.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.25,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().update(() {
                                        FFAppState().refereeweaponselect =
                                            'Epee';
                                        FFAppState().isWeaponSelected = true;
                                      });
                                    },
                                    text: 'Epee',
                                    options: FFButtonOptions(
                                      width: 100.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.25,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().update(() {
                                        FFAppState().refereeweaponselect =
                                            'Sabre';
                                        FFAppState().isWeaponSelected = true;
                                      });
                                    },
                                    text: 'Sabre',
                                    options: FFButtonOptions(
                                      width: 100.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.25,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().update(() {
                                        FFAppState().refereeweaponselect =
                                            'Noodle';
                                        FFAppState().isWeaponSelected = true;
                                      });
                                    },
                                    text: 'Noodle',
                                    options: FFButtonOptions(
                                      width: 100.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
                                  child: Text(
                                    'Periods:',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
                                  child: Container(
                                    width: 160.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Color(0xFF9E9E9E),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: FlutterFlowCountController(
                                      decrementIconBuilder: (enabled) => FaIcon(
                                        FontAwesomeIcons.minus,
                                        color: enabled
                                            ? Color(0xDD000000)
                                            : Color(0xFFEEEEEE),
                                        size: 20.0,
                                      ),
                                      incrementIconBuilder: (enabled) => FaIcon(
                                        FontAwesomeIcons.plus,
                                        color: enabled
                                            ? Colors.blue
                                            : Color(0xFFEEEEEE),
                                        size: 20.0,
                                      ),
                                      countBuilder: (count) => Text(
                                        count.toString(),
                                        style: GoogleFonts.getFont(
                                          'Roboto',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      count: _model.periodCountValue ??= 1,
                                      updateCount: (count) => setState(() =>
                                          _model.periodCountValue = count),
                                      stepSize: 1,
                                      minimum: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
                                  child: Text(
                                    'Time Per Period (Minutes):',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
                                  child: Container(
                                    width: 160.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Color(0xFF9E9E9E),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: FlutterFlowCountController(
                                      decrementIconBuilder: (enabled) => FaIcon(
                                        FontAwesomeIcons.minus,
                                        color: enabled
                                            ? Color(0xDD000000)
                                            : Color(0xFFEEEEEE),
                                        size: 20.0,
                                      ),
                                      incrementIconBuilder: (enabled) => FaIcon(
                                        FontAwesomeIcons.plus,
                                        color: enabled
                                            ? Colors.blue
                                            : Color(0xFFEEEEEE),
                                        size: 20.0,
                                      ),
                                      countBuilder: (count) => Text(
                                        count.toString(),
                                        style: GoogleFonts.getFont(
                                          'Roboto',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      count: _model.timeCountValue ??= 3,
                                      updateCount: (count) => setState(
                                          () => _model.timeCountValue = count),
                                      stepSize: 1,
                                      minimum: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
                                  child: Text(
                                    'Touches to Win:',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
                                  child: Container(
                                    width: 160.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Color(0xFF9E9E9E),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: FlutterFlowCountController(
                                      decrementIconBuilder: (enabled) => FaIcon(
                                        FontAwesomeIcons.minus,
                                        color: enabled
                                            ? Color(0xDD000000)
                                            : Color(0xFFEEEEEE),
                                        size: 20.0,
                                      ),
                                      incrementIconBuilder: (enabled) => FaIcon(
                                        FontAwesomeIcons.plus,
                                        color: enabled
                                            ? Colors.blue
                                            : Color(0xFFEEEEEE),
                                        size: 20.0,
                                      ),
                                      countBuilder: (count) => Text(
                                        count.toString(),
                                        style: GoogleFonts.getFont(
                                          'Roboto',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      count: _model.touchesCountValue ??= 5,
                                      updateCount: (count) => setState(() =>
                                          _model.touchesCountValue = count),
                                      stepSize: 1,
                                      minimum: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if ((FFAppState().leftFencerRef !=
                                      FFAppState().SelectFencerReference) &&
                                  (FFAppState().rightFencerRef !=
                                      FFAppState().SelectFencerReference) &&
                                  FFAppState().isWeaponSelected)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 30.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      currentUserLocationValue =
                                          await getCurrentUserLocation(
                                              defaultLocation:
                                                  LatLng(0.0, 0.0));
                                      FFAppState().update(() {
                                        FFAppState().currentPeriod = 1;
                                      });
                                      FFAppState().update(() {
                                        FFAppState().addToRefFencers(
                                            FFAppState().leftFencerRef!);
                                      });
                                      FFAppState().update(() {
                                        FFAppState().addToRefFencers(
                                            FFAppState().rightFencerRef!);
                                      });
                                      // Create matchdetails

                                      var matchdetailsDevRecordReference =
                                          MatchdetailsDevRecord.collection
                                              .doc();
                                      await matchdetailsDevRecordReference.set({
                                        ...createMatchdetailsDevRecordData(
                                          overallStats:
                                              createMatchStatSnapshotStruct(
                                            pointsL: 0,
                                            pointsR: 0,
                                            yellowCardsL: 0,
                                            yellowCardsR: 0,
                                            redCardsL: 0,
                                            redCardsR: 0,
                                            simultaneous: 0,
                                            haltsRef: 0,
                                            haltsL: 0,
                                            haltsR: 0,
                                            simpleAttackHitsL: 0,
                                            simpleAttackHitsR: 0,
                                            simpleAttackOffTarL: 0,
                                            simpleAttackOffTarR: 0,
                                            compoundAttackHitsL: 0,
                                            compoundAttackHitsR: 0,
                                            compoundAttackOffTarL: 0,
                                            compoundAttackOffTarR: 0,
                                            parryRiposteHitsL: 0,
                                            parryRiposteHitsR: 0,
                                            parryRiposteOffTargetL: 0,
                                            parryRiposteOffTargetR: 0,
                                            remiseHitsL: 0,
                                            remiseHitsR: 0,
                                            remiseOffTarL: 0,
                                            remiseOffTarR: 0,
                                            counterattackHitsL: 0,
                                            counterattackHitsR: 0,
                                            counterattackOffTarL: 0,
                                            counterattackOffTarR: 0,
                                            pointInLineHitsL: 0,
                                            pointInLineHitsR: 0,
                                            pointInLineOffTarL: 0,
                                            pointInLineOffTarR: 0,
                                            timestamp: -1,
                                            periodstamp: -1,
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'MatchEvents': [
                                              getMatchEventFirestoreData(
                                                createMatchEventStruct(
                                                  actionableFencer: FFAppState()
                                                      .refereeReference,
                                                  scoreLeft: 0,
                                                  scoreRight: 0,
                                                  timeOfAction: functions
                                                      .minutesToMS(_model
                                                          .timeCountValue!),
                                                  periodOfAction: 1,
                                                  actionID: -1,
                                                  clearUnsetFields: false,
                                                  create: true,
                                                ),
                                                true,
                                              )
                                            ],
                                          },
                                        ),
                                      });
                                      _model.currentMatchDetails =
                                          MatchdetailsDevRecord
                                              .getDocumentFromData({
                                        ...createMatchdetailsDevRecordData(
                                          overallStats:
                                              createMatchStatSnapshotStruct(
                                            pointsL: 0,
                                            pointsR: 0,
                                            yellowCardsL: 0,
                                            yellowCardsR: 0,
                                            redCardsL: 0,
                                            redCardsR: 0,
                                            simultaneous: 0,
                                            haltsRef: 0,
                                            haltsL: 0,
                                            haltsR: 0,
                                            simpleAttackHitsL: 0,
                                            simpleAttackHitsR: 0,
                                            simpleAttackOffTarL: 0,
                                            simpleAttackOffTarR: 0,
                                            compoundAttackHitsL: 0,
                                            compoundAttackHitsR: 0,
                                            compoundAttackOffTarL: 0,
                                            compoundAttackOffTarR: 0,
                                            parryRiposteHitsL: 0,
                                            parryRiposteHitsR: 0,
                                            parryRiposteOffTargetL: 0,
                                            parryRiposteOffTargetR: 0,
                                            remiseHitsL: 0,
                                            remiseHitsR: 0,
                                            remiseOffTarL: 0,
                                            remiseOffTarR: 0,
                                            counterattackHitsL: 0,
                                            counterattackHitsR: 0,
                                            counterattackOffTarL: 0,
                                            counterattackOffTarR: 0,
                                            pointInLineHitsL: 0,
                                            pointInLineHitsR: 0,
                                            pointInLineOffTarL: 0,
                                            pointInLineOffTarR: 0,
                                            timestamp: -1,
                                            periodstamp: -1,
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'MatchEvents': [
                                              getMatchEventFirestoreData(
                                                createMatchEventStruct(
                                                  actionableFencer: FFAppState()
                                                      .refereeReference,
                                                  scoreLeft: 0,
                                                  scoreRight: 0,
                                                  timeOfAction: functions
                                                      .minutesToMS(_model
                                                          .timeCountValue!),
                                                  periodOfAction: 1,
                                                  actionID: -1,
                                                  clearUnsetFields: false,
                                                  create: true,
                                                ),
                                                true,
                                              )
                                            ],
                                          },
                                        ),
                                      }, matchdetailsDevRecordReference);

                                      var matchstatslogDevRecordReference =
                                          MatchstatslogDevRecord.collection
                                              .doc();
                                      await matchstatslogDevRecordReference
                                          .set({
                                        ...mapToFirestore(
                                          {
                                            'MatchStats': [
                                              getMatchStatSnapshotFirestoreData(
                                                createMatchStatSnapshotStruct(
                                                  pointsL: 0,
                                                  pointsR: 0,
                                                  yellowCardsL: 0,
                                                  yellowCardsR: 0,
                                                  redCardsL: 0,
                                                  redCardsR: 0,
                                                  simultaneous: 0,
                                                  haltsRef: 0,
                                                  haltsL: 0,
                                                  haltsR: 0,
                                                  simpleAttackHitsL: 0,
                                                  simpleAttackHitsR: 0,
                                                  simpleAttackOffTarL: 0,
                                                  simpleAttackOffTarR: 0,
                                                  compoundAttackHitsL: 0,
                                                  compoundAttackHitsR: 0,
                                                  compoundAttackOffTarL: 0,
                                                  compoundAttackOffTarR: 0,
                                                  parryRiposteHitsL: 0,
                                                  parryRiposteHitsR: 0,
                                                  parryRiposteOffTargetL: 0,
                                                  parryRiposteOffTargetR: 0,
                                                  remiseHitsL: 0,
                                                  remiseHitsR: 0,
                                                  remiseOffTarL: 0,
                                                  remiseOffTarR: 0,
                                                  counterattackHitsL: 0,
                                                  counterattackHitsR: 0,
                                                  counterattackOffTarL: 0,
                                                  counterattackOffTarR: 0,
                                                  pointInLineHitsL: 0,
                                                  pointInLineHitsR: 0,
                                                  pointInLineOffTarL: 0,
                                                  pointInLineOffTarR: 0,
                                                  timestamp: -1,
                                                  periodstamp: 0,
                                                  clearUnsetFields: false,
                                                  create: true,
                                                ),
                                                true,
                                              )
                                            ],
                                          },
                                        ),
                                      });
                                      _model.currentMatchStatsLog =
                                          MatchstatslogDevRecord
                                              .getDocumentFromData({
                                        ...mapToFirestore(
                                          {
                                            'MatchStats': [
                                              getMatchStatSnapshotFirestoreData(
                                                createMatchStatSnapshotStruct(
                                                  pointsL: 0,
                                                  pointsR: 0,
                                                  yellowCardsL: 0,
                                                  yellowCardsR: 0,
                                                  redCardsL: 0,
                                                  redCardsR: 0,
                                                  simultaneous: 0,
                                                  haltsRef: 0,
                                                  haltsL: 0,
                                                  haltsR: 0,
                                                  simpleAttackHitsL: 0,
                                                  simpleAttackHitsR: 0,
                                                  simpleAttackOffTarL: 0,
                                                  simpleAttackOffTarR: 0,
                                                  compoundAttackHitsL: 0,
                                                  compoundAttackHitsR: 0,
                                                  compoundAttackOffTarL: 0,
                                                  compoundAttackOffTarR: 0,
                                                  parryRiposteHitsL: 0,
                                                  parryRiposteHitsR: 0,
                                                  parryRiposteOffTargetL: 0,
                                                  parryRiposteOffTargetR: 0,
                                                  remiseHitsL: 0,
                                                  remiseHitsR: 0,
                                                  remiseOffTarL: 0,
                                                  remiseOffTarR: 0,
                                                  counterattackHitsL: 0,
                                                  counterattackHitsR: 0,
                                                  counterattackOffTarL: 0,
                                                  counterattackOffTarR: 0,
                                                  pointInLineHitsL: 0,
                                                  pointInLineHitsR: 0,
                                                  pointInLineOffTarL: 0,
                                                  pointInLineOffTarR: 0,
                                                  timestamp: -1,
                                                  periodstamp: 0,
                                                  clearUnsetFields: false,
                                                  create: true,
                                                ),
                                                true,
                                              )
                                            ],
                                          },
                                        ),
                                      }, matchstatslogDevRecordReference);
                                      // Create matches doc

                                      var matchesDevRecordReference =
                                          MatchesDevRecord.collection.doc();
                                      await matchesDevRecordReference.set({
                                        ...createMatchesDevRecordData(
                                          user1: FFAppState().leftFencerRef,
                                          user2: FFAppState().rightFencerRef,
                                          weapon:
                                              FFAppState().refereeweaponselect,
                                          noOfPeriods: _model.periodCountValue,
                                          scoreLeft: 0,
                                          scoreRight: 0,
                                          location: currentUserLocationValue,
                                          matchDetails: _model
                                              .currentMatchDetails?.reference,
                                          matchRanking: 'U',
                                          scheduledTime: getCurrentTimestamp,
                                          matchStatsLog: _model
                                              .currentMatchStatsLog?.reference,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'fencers': FFAppState().refFencers,
                                          },
                                        ),
                                      });
                                      _model.currentMatchInProgress =
                                          MatchesDevRecord.getDocumentFromData({
                                        ...createMatchesDevRecordData(
                                          user1: FFAppState().leftFencerRef,
                                          user2: FFAppState().rightFencerRef,
                                          weapon:
                                              FFAppState().refereeweaponselect,
                                          noOfPeriods: _model.periodCountValue,
                                          scoreLeft: 0,
                                          scoreRight: 0,
                                          location: currentUserLocationValue,
                                          matchDetails: _model
                                              .currentMatchDetails?.reference,
                                          matchRanking: 'U',
                                          scheduledTime: getCurrentTimestamp,
                                          matchStatsLog: _model
                                              .currentMatchStatsLog?.reference,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'fencers': FFAppState().refFencers,
                                          },
                                        ),
                                      }, matchesDevRecordReference);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RefViewWidget(
                                            initStartTime:
                                                _model.timeCountValue,
                                            startNumOfPeriods:
                                                _model.periodCountValue,
                                            startNumOfTouches:
                                                _model.touchesCountValue,
                                            currentMatchInProgress:
                                                _model.currentMatchInProgress,
                                            currentMatchDetails:
                                                _model.currentMatchDetails,
                                            rankCode: 'U',
                                          ),
                                        ),
                                      );

                                      setState(() {});
                                    },
                                    text: 'Start Match',
                                    options: FFButtonOptions(
                                      width: 300.0,
                                      height: 100.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Match Setup',
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Fencers: (Click Name to Scan QR)',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        FFAppState().refLeftPhoto,
                                        'https://firebasestorage.googleapis.com/v0/b/universalfencingleague.appspot.com/o/Fencer_silhouette.png?alt=media&token=7ae87fd2-6264-446f-abbf-c4a7d8d5b642',
                                      ),
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().update(() {
                                          FFAppState().isRightFencer = false;
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SelectFencerWidget(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        valueOrDefault<String>(
                                          FFAppState().refLeftName,
                                          'Left Fencer',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Text(
                                  'VS',
                                  style:
                                      FlutterFlowTheme.of(context).displaySmall,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().update(() {
                                          FFAppState().isRightFencer = true;
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SelectFencerWidget(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        valueOrDefault<String>(
                                          FFAppState().refRightName,
                                          'Right Fencer',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        FFAppState().refRightPhoto,
                                        'https://firebasestorage.googleapis.com/v0/b/universalfencingleague.appspot.com/o/Fencer_silhouette.png?alt=media&token=7ae87fd2-6264-446f-abbf-c4a7d8d5b642',
                                      ),
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
                                  child: Text(
                                    'Select Weapon:',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
                                  child: Text(
                                    valueOrDefault<String>(
                                      FFAppState().refereeweaponselect,
                                      ' <No Weapon>',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.25,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().update(() {
                                        FFAppState().refereeweaponselect =
                                            'Foil';
                                      });
                                    },
                                    text: 'Foil',
                                    options: FFButtonOptions(
                                      width: 110.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.25,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().update(() {
                                        FFAppState().refereeweaponselect =
                                            'Epee';
                                      });
                                    },
                                    text: 'Epee',
                                    options: FFButtonOptions(
                                      width: 100.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.25,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().update(() {
                                        FFAppState().refereeweaponselect =
                                            'Sabre';
                                      });
                                    },
                                    text: 'Sabre',
                                    options: FFButtonOptions(
                                      width: 110.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.25,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().update(() {
                                        FFAppState().refereeweaponselect =
                                            'Noodle';
                                      });
                                    },
                                    text: 'Noodle',
                                    options: FFButtonOptions(
                                      width: 110.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
                                  child: Text(
                                    'Select Mode:',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
                                  child: Text(
                                    valueOrDefault<String>(
                                      FFAppState().refereemodeselect,
                                      '<Select Mode>',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().update(() {
                                      FFAppState().refereemodeselect =
                                          'RankedAdult';
                                    });
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 3.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1.0),
                                    ),
                                    child: Container(
                                      width: 140.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(1.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Adult',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Text(
                                                  '15 Touches\nUp to 3 periods',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().update(() {
                                      FFAppState().refereemodeselect =
                                          'RankedYouth';
                                    });
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 3.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1.0),
                                    ),
                                    child: Container(
                                      width: 140.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(1.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Youth',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Text(
                                                  '10 Touches\nUp to 2 periods',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if ((FFAppState().refereeweaponselect ==
                                      'Foil') &&
                                  (FFAppState().refereemodeselect ==
                                      'RankedAdult'))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 30.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (FFAppState().refereemodeselect !=
                                              null &&
                                          FFAppState().refereemodeselect !=
                                              '') {
                                        FFAppState().addToRefFencers(
                                            FFAppState().leftFencerRef!);
                                        FFAppState().addToRefFencers(
                                            FFAppState().rightFencerRef!);
                                        if (FFAppState().refereemodeselect ==
                                            'RankedAdult') {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RefViewWidget(
                                                initStartTime:
                                                    _model.timeCountValue,
                                                startNumOfPeriods: 3,
                                                startNumOfTouches: 15,
                                                rankCode:
                                                    '${FFAppState().refereeweaponselect}A',
                                              ),
                                            ),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RefViewWidget(
                                                initStartTime:
                                                    _model.timeCountValue,
                                                startNumOfPeriods: 2,
                                                startNumOfTouches: 10,
                                                rankCode:
                                                    '${FFAppState().refereeweaponselect}Y',
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    text: 'Start Match',
                                    options: FFButtonOptions(
                                      width: 300.0,
                                      height: 100.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
