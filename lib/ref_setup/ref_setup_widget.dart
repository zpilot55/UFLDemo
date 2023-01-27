import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../ref_view/ref_view_widget.dart';
import '../select_fencer/select_fencer_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RefSetupWidget extends StatefulWidget {
  const RefSetupWidget({Key? key}) : super(key: key);

  @override
  _RefSetupWidgetState createState() => _RefSetupWidgetState();
}

class _RefSetupWidgetState extends State<RefSetupWidget> {
  LatLng? currentUserLocationValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  MatchdetailsDevRecord? currentMatchDetails;
  MatchesDevRecord? currentMatchInProgress;
  int? periodCountValue;
  int? timeCountValue;
  int? touchesCountValue;
  MatchdetailsDevRecord? currentMatchDetailsRA;
  MatchesDevRecord? currentMatchInProgressRA;
  MatchdetailsDevRecord? currentMatchDetailsRY;
  MatchesDevRecord? currentMatchInProgressRY;

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              children: [
                TabBar(
                  labelColor: FlutterFlowTheme.of(context).primaryColor,
                  labelStyle: FlutterFlowTheme.of(context).bodyText1,
                  indicatorColor: FlutterFlowTheme.of(context).secondaryColor,
                  tabs: [
                    Tab(
                      text: 'Unranked Match',
                    ),
                    Tab(
                      text: 'Ranked Match',
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
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
                                  style: FlutterFlowTheme.of(context).title1,
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Fencers: (Click Name to Scan QR)',
                                    style: FlutterFlowTheme.of(context).title3,
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
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          FFAppState().refLeftPhoto,
                                          'https://firebasestorage.googleapis.com/v0/b/universalfencingleague.appspot.com/o/Fencer_silhouette.png?alt=media&token=7ae87fd2-6264-446f-abbf-c4a7d8d5b642',
                                        ),
                                        width: 80,
                                        height: 80,
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
                                          10, 0, 0, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          FFAppState().update(() {
                                            FFAppState().isRightFencer = false;
                                          });
                                          await Navigator.push(
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
                                              .title3,
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
                                      0, 10, 0, 10),
                                  child: Text(
                                    'VS',
                                    style: FlutterFlowTheme.of(context).title1,
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
                                          0, 0, 10, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          FFAppState().update(() {
                                            FFAppState().isRightFencer = true;
                                          });
                                          await Navigator.push(
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
                                              .title3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          FFAppState().refRightPhoto,
                                          'https://firebasestorage.googleapis.com/v0/b/universalfencingleague.appspot.com/o/Fencer_silhouette.png?alt=media&token=7ae87fd2-6264-446f-abbf-c4a7d8d5b642',
                                        ),
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFA),
                                    ),
                                    child: Text(
                                      'Select Weapon:',
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFA),
                                    ),
                                    child: Text(
                                      valueOrDefault<String>(
                                        FFAppState().refereeweaponselect,
                                        ' <No Weapon>',
                                      ),
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    height: 50,
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
                                        width: 100,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    height: 50,
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
                                        width: 100,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    height: 50,
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
                                        width: 100,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    height: 50,
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
                                        width: 100,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFA),
                                    ),
                                    child: Text(
                                      'Periods:',
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFA),
                                    ),
                                    child: Container(
                                      width: 160,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(25),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Color(0xFF9E9E9E),
                                          width: 1,
                                        ),
                                      ),
                                      child: FlutterFlowCountController(
                                        decrementIconBuilder: (enabled) =>
                                            FaIcon(
                                          FontAwesomeIcons.minus,
                                          color: enabled
                                              ? Color(0xDD000000)
                                              : Color(0xFFEEEEEE),
                                          size: 20,
                                        ),
                                        incrementIconBuilder: (enabled) =>
                                            FaIcon(
                                          FontAwesomeIcons.plus,
                                          color: enabled
                                              ? Colors.blue
                                              : Color(0xFFEEEEEE),
                                          size: 20,
                                        ),
                                        countBuilder: (count) => Text(
                                          count.toString(),
                                          style: GoogleFonts.getFont(
                                            'Roboto',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        count: periodCountValue ??= 1,
                                        updateCount: (count) => setState(
                                            () => periodCountValue = count),
                                        stepSize: 1,
                                        minimum: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFA),
                                    ),
                                    child: Text(
                                      'Time Per Period (Minutes):',
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFA),
                                    ),
                                    child: Container(
                                      width: 160,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(25),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Color(0xFF9E9E9E),
                                          width: 1,
                                        ),
                                      ),
                                      child: FlutterFlowCountController(
                                        decrementIconBuilder: (enabled) =>
                                            FaIcon(
                                          FontAwesomeIcons.minus,
                                          color: enabled
                                              ? Color(0xDD000000)
                                              : Color(0xFFEEEEEE),
                                          size: 20,
                                        ),
                                        incrementIconBuilder: (enabled) =>
                                            FaIcon(
                                          FontAwesomeIcons.plus,
                                          color: enabled
                                              ? Colors.blue
                                              : Color(0xFFEEEEEE),
                                          size: 20,
                                        ),
                                        countBuilder: (count) => Text(
                                          count.toString(),
                                          style: GoogleFonts.getFont(
                                            'Roboto',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        count: timeCountValue ??= 3,
                                        updateCount: (count) => setState(
                                            () => timeCountValue = count),
                                        stepSize: 1,
                                        minimum: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFA),
                                    ),
                                    child: Text(
                                      'Touches to Win:',
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFA),
                                    ),
                                    child: Container(
                                      width: 160,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(25),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Color(0xFF9E9E9E),
                                          width: 1,
                                        ),
                                      ),
                                      child: FlutterFlowCountController(
                                        decrementIconBuilder: (enabled) =>
                                            FaIcon(
                                          FontAwesomeIcons.minus,
                                          color: enabled
                                              ? Color(0xDD000000)
                                              : Color(0xFFEEEEEE),
                                          size: 20,
                                        ),
                                        incrementIconBuilder: (enabled) =>
                                            FaIcon(
                                          FontAwesomeIcons.plus,
                                          color: enabled
                                              ? Colors.blue
                                              : Color(0xFFEEEEEE),
                                          size: 20,
                                        ),
                                        countBuilder: (count) => Text(
                                          count.toString(),
                                          style: GoogleFonts.getFont(
                                            'Roboto',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        count: touchesCountValue ??= 5,
                                        updateCount: (count) => setState(
                                            () => touchesCountValue = count),
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
                                        0, 0, 0, 30),
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

                                        final matchdetailsDevCreateData = {
                                          ...createMatchdetailsDevRecordData(
                                            overallStats:
                                                createPeriodStatsStruct(
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
                                          'MatchEvents': [
                                            getMatchEventFirestoreData(
                                              createMatchEventStruct(
                                                actionableFencer: FFAppState()
                                                    .refereeReference,
                                                scoreLeft: 0,
                                                scoreRight: 0,
                                                timeOfAction:
                                                    functions.minutesToMS(
                                                        timeCountValue!),
                                                periodOfAction: 1,
                                                actionID: -1,
                                                clearUnsetFields: false,
                                                create: true,
                                              ),
                                              true,
                                            )
                                          ],
                                        };
                                        var matchdetailsDevRecordReference =
                                            MatchdetailsDevRecord.collection
                                                .doc();
                                        await matchdetailsDevRecordReference
                                            .set(matchdetailsDevCreateData);
                                        currentMatchDetails = MatchdetailsDevRecord
                                            .getDocumentFromData(
                                                matchdetailsDevCreateData,
                                                matchdetailsDevRecordReference);
                                        // Create matches doc

                                        final matchesDevCreateData = {
                                          ...createMatchesDevRecordData(
                                            user1: FFAppState().leftFencerRef,
                                            user2: FFAppState().rightFencerRef,
                                            weapon: FFAppState()
                                                .refereeweaponselect,
                                            noOfPeriods: periodCountValue,
                                            scoreLeft: 0,
                                            scoreRight: 0,
                                            location: currentUserLocationValue,
                                            matchDetails:
                                                currentMatchDetails!.reference,
                                            matchRanking: 'U',
                                          ),
                                          'fencers': FFAppState().refFencers,
                                          'scheduled_time':
                                              FieldValue.serverTimestamp(),
                                        };
                                        var matchesDevRecordReference =
                                            MatchesDevRecord.collection.doc();
                                        await matchesDevRecordReference
                                            .set(matchesDevCreateData);
                                        currentMatchInProgress =
                                            MatchesDevRecord
                                                .getDocumentFromData(
                                                    matchesDevCreateData,
                                                    matchesDevRecordReference);
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => RefViewWidget(
                                              initStartTime: timeCountValue,
                                              startNumOfPeriods:
                                                  periodCountValue,
                                              startNumOfTouches:
                                                  touchesCountValue,
                                              currentMatchInProgress:
                                                  currentMatchInProgress,
                                              currentMatchDetails:
                                                  currentMatchDetailsRA,
                                            ),
                                          ),
                                        );

                                        setState(() {});
                                      },
                                      text: 'Start Match',
                                      options: FFButtonOptions(
                                        width: 300,
                                        height: 100,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        elevation: 3,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
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
                                  style: FlutterFlowTheme.of(context).title1,
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Fencers: (Click Name to Scan QR)',
                                    style: FlutterFlowTheme.of(context).title3,
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
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          FFAppState().refLeftPhoto,
                                          'https://firebasestorage.googleapis.com/v0/b/universalfencingleague.appspot.com/o/Fencer_silhouette.png?alt=media&token=7ae87fd2-6264-446f-abbf-c4a7d8d5b642',
                                        ),
                                        width: 80,
                                        height: 80,
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
                                          10, 0, 0, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          FFAppState().update(() {
                                            FFAppState().isRightFencer = false;
                                          });
                                          await Navigator.push(
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
                                              .title3,
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
                                      0, 10, 0, 10),
                                  child: Text(
                                    'VS',
                                    style: FlutterFlowTheme.of(context).title1,
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
                                          0, 0, 10, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          FFAppState().update(() {
                                            FFAppState().isRightFencer = true;
                                          });
                                          await Navigator.push(
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
                                              .title3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          FFAppState().refRightPhoto,
                                          'https://firebasestorage.googleapis.com/v0/b/universalfencingleague.appspot.com/o/Fencer_silhouette.png?alt=media&token=7ae87fd2-6264-446f-abbf-c4a7d8d5b642',
                                        ),
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFA),
                                    ),
                                    child: Text(
                                      'Select Weapon:',
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFA),
                                    ),
                                    child: Text(
                                      valueOrDefault<String>(
                                        FFAppState().refereeweaponselect,
                                        ' <No Weapon>',
                                      ),
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    height: 50,
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
                                        width: 110,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    height: 50,
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
                                        width: 100,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    height: 50,
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
                                        width: 110,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    height: 50,
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
                                        width: 110,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFA),
                                    ),
                                    child: Text(
                                      'Select Mode:',
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFA),
                                    ),
                                    child: Text(
                                      valueOrDefault<String>(
                                        FFAppState().refereemodeselect,
                                        '<Select Mode>',
                                      ),
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      FFAppState().update(() {
                                        FFAppState().refereemodeselect =
                                            'RankedAdult';
                                      });
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1),
                                      ),
                                      child: Container(
                                        width: 140,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(1),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Adult',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 16,
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
                                                      .fromSTEB(0, 10, 0, 0),
                                                  child: Text(
                                                    '15 Touches\nUp to 3 periods',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 12,
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
                                    onTap: () async {
                                      FFAppState().update(() {
                                        FFAppState().refereemodeselect =
                                            'RankedYouth';
                                      });
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1),
                                      ),
                                      child: Container(
                                        width: 140,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(1),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Youth',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 16,
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
                                                      .fromSTEB(0, 10, 0, 0),
                                                  child: Text(
                                                    '10 Touches\nUp to 2 periods',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 12,
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
                                if (currentUserUid != currentUserUid)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 30),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        currentUserLocationValue =
                                            await getCurrentUserLocation(
                                                defaultLocation:
                                                    LatLng(0.0, 0.0));
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
                                            // Create matchdetails

                                            final matchdetailsDevCreateData = {
                                              ...createMatchdetailsDevRecordData(
                                                overallStats:
                                                    createPeriodStatsStruct(
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
                                              'MatchEvents': [
                                                getMatchEventFirestoreData(
                                                  createMatchEventStruct(
                                                    actionableFencer:
                                                        FFAppState()
                                                            .refereeReference,
                                                    scoreLeft: 0,
                                                    scoreRight: 0,
                                                    timeOfAction:
                                                        functions.minutesToMS(
                                                            timeCountValue!),
                                                    periodOfAction: 1,
                                                    actionID: -1,
                                                    clearUnsetFields: false,
                                                    create: true,
                                                  ),
                                                  true,
                                                )
                                              ],
                                            };
                                            var matchdetailsDevRecordReference =
                                                MatchdetailsDevRecord.collection
                                                    .doc();
                                            await matchdetailsDevRecordReference
                                                .set(matchdetailsDevCreateData);
                                            currentMatchDetailsRA =
                                                MatchdetailsDevRecord
                                                    .getDocumentFromData(
                                                        matchdetailsDevCreateData,
                                                        matchdetailsDevRecordReference);
                                            // Create matches doc

                                            final matchesDevCreateData = {
                                              ...createMatchesDevRecordData(
                                                user1:
                                                    FFAppState().leftFencerRef,
                                                user2:
                                                    FFAppState().rightFencerRef,
                                                weapon: FFAppState()
                                                    .refereeweaponselect,
                                                noOfPeriods: 3,
                                                scoreLeft: 0,
                                                scoreRight: 0,
                                                location:
                                                    currentUserLocationValue,
                                                matchDetails:
                                                    currentMatchDetailsRA!
                                                        .reference,
                                                matchRanking: 'A',
                                              ),
                                              'scheduled_time':
                                                  FieldValue.serverTimestamp(),
                                              'fencers':
                                                  FFAppState().refFencers,
                                            };
                                            var matchesDevRecordReference =
                                                MatchesDevRecord.collection
                                                    .doc();
                                            await matchesDevRecordReference
                                                .set(matchesDevCreateData);
                                            currentMatchInProgressRA =
                                                MatchesDevRecord
                                                    .getDocumentFromData(
                                                        matchesDevCreateData,
                                                        matchesDevRecordReference);
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    RefViewWidget(
                                                  initStartTime: timeCountValue,
                                                  startNumOfPeriods: 3,
                                                  startNumOfTouches: 15,
                                                  currentMatchInProgress:
                                                      currentMatchInProgressRA,
                                                  currentMatchDetails:
                                                      currentMatchDetailsRA,
                                                ),
                                              ),
                                            );
                                          } else {
                                            // Create matchdetails

                                            final matchdetailsDevCreateData = {
                                              ...createMatchdetailsDevRecordData(
                                                overallStats:
                                                    createPeriodStatsStruct(
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
                                              'MatchEvents': [
                                                getMatchEventFirestoreData(
                                                  createMatchEventStruct(
                                                    actionableFencer:
                                                        FFAppState()
                                                            .refereeReference,
                                                    scoreLeft: 0,
                                                    scoreRight: 0,
                                                    timeOfAction:
                                                        functions.minutesToMS(
                                                            timeCountValue!),
                                                    periodOfAction: 1,
                                                    actionID: -1,
                                                    clearUnsetFields: false,
                                                    create: true,
                                                  ),
                                                  true,
                                                )
                                              ],
                                            };
                                            var matchdetailsDevRecordReference =
                                                MatchdetailsDevRecord.collection
                                                    .doc();
                                            await matchdetailsDevRecordReference
                                                .set(matchdetailsDevCreateData);
                                            currentMatchDetailsRY =
                                                MatchdetailsDevRecord
                                                    .getDocumentFromData(
                                                        matchdetailsDevCreateData,
                                                        matchdetailsDevRecordReference);
                                            // Create matches doc

                                            final matchesDevCreateData = {
                                              ...createMatchesDevRecordData(
                                                user1:
                                                    FFAppState().leftFencerRef,
                                                user2:
                                                    FFAppState().rightFencerRef,
                                                weapon: FFAppState()
                                                    .refereeweaponselect,
                                                noOfPeriods: 2,
                                                scoreLeft: 0,
                                                scoreRight: 0,
                                                location:
                                                    currentUserLocationValue,
                                                matchDetails:
                                                    currentMatchDetails!
                                                        .reference,
                                                matchRanking: 'Y',
                                              ),
                                              'scheduled_time':
                                                  FieldValue.serverTimestamp(),
                                              'fencers':
                                                  FFAppState().refFencers,
                                            };
                                            var matchesDevRecordReference =
                                                MatchesDevRecord.collection
                                                    .doc();
                                            await matchesDevRecordReference
                                                .set(matchesDevCreateData);
                                            currentMatchInProgressRY =
                                                MatchesDevRecord
                                                    .getDocumentFromData(
                                                        matchesDevCreateData,
                                                        matchesDevRecordReference);
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    RefViewWidget(
                                                  initStartTime: timeCountValue,
                                                  startNumOfPeriods: 2,
                                                  startNumOfTouches: 10,
                                                  currentMatchInProgress:
                                                      currentMatchInProgressRY,
                                                  currentMatchDetails:
                                                      currentMatchDetailsRY,
                                                ),
                                              ),
                                            );
                                          }
                                        }

                                        setState(() {});
                                      },
                                      text: 'Start Match',
                                      options: FFButtonOptions(
                                        width: 300,
                                        height: 100,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        elevation: 3,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
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
      ),
    );
  }
}
