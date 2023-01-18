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

class RefSetupCopyWidget extends StatefulWidget {
  const RefSetupCopyWidget({Key? key}) : super(key: key);

  @override
  _RefSetupCopyWidgetState createState() => _RefSetupCopyWidgetState();
}

class _RefSetupCopyWidgetState extends State<RefSetupCopyWidget> {
  MatchesRecord? currentMatchInProgress;
  int? periodCountValue;
  int? timeCountValue;
  int? touchesCountValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
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
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            FFAppState().update(() {
                              FFAppState().isRightFencer = false;
                            });
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectFencerWidget(),
                              ),
                            );
                          },
                          child: Text(
                            valueOrDefault<String>(
                              FFAppState().refLeftName,
                              'Left Fencer',
                            ),
                            style: FlutterFlowTheme.of(context).title3,
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: InkWell(
                          onTap: () async {
                            FFAppState().update(() {
                              FFAppState().isRightFencer = true;
                            });
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectFencerWidget(),
                              ),
                            );
                          },
                          child: Text(
                            valueOrDefault<String>(
                              FFAppState().refRightName,
                              'Right Fencer',
                            ),
                            style: FlutterFlowTheme.of(context).title3,
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFFFAFAFA),
                      ),
                      child: Text(
                        'Select Weapon:',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFFFAFAFA),
                      ),
                      child: Text(
                        valueOrDefault<String>(
                          FFAppState().refereeweaponselect,
                          ' <No Weapon>',
                        ),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: FFButtonWidget(
                        onPressed: () async {
                          FFAppState().update(() {
                            FFAppState().refereeweaponselect = 'Foil';
                          });
                        },
                        text: 'Foil',
                        options: FFButtonOptions(
                          width: 100,
                          height: 40,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
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
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: FFButtonWidget(
                        onPressed: () async {
                          FFAppState().update(() {
                            FFAppState().refereeweaponselect = 'Epee';
                          });
                        },
                        text: 'Epee',
                        options: FFButtonOptions(
                          width: 100,
                          height: 40,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
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
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: FFButtonWidget(
                        onPressed: () async {
                          FFAppState().update(() {
                            FFAppState().refereeweaponselect = 'Sabre';
                          });
                        },
                        text: 'Sabre',
                        options: FFButtonOptions(
                          width: 100,
                          height: 40,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
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
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: FFButtonWidget(
                        onPressed: () async {
                          FFAppState().update(() {
                            FFAppState().refereeweaponselect = 'Noodle';
                          });
                        },
                        text: 'Noodle',
                        options: FFButtonOptions(
                          width: 100,
                          height: 40,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFFFAFAFA),
                      ),
                      child: Text(
                        'Periods:',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
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
                          decrementIconBuilder: (enabled) => FaIcon(
                            FontAwesomeIcons.minus,
                            color:
                                enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                            size: 20,
                          ),
                          incrementIconBuilder: (enabled) => FaIcon(
                            FontAwesomeIcons.plus,
                            color: enabled ? Colors.blue : Color(0xFFEEEEEE),
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
                          count: periodCountValue ??= FFAppState().startPeriods,
                          updateCount: (count) =>
                              setState(() => periodCountValue = count),
                          stepSize: 1,
                          minimum: 1,
                          maximum: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFFFAFAFA),
                      ),
                      child: Text(
                        'Time Per Period:',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
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
                          decrementIconBuilder: (enabled) => FaIcon(
                            FontAwesomeIcons.minus,
                            color:
                                enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                            size: 20,
                          ),
                          incrementIconBuilder: (enabled) => FaIcon(
                            FontAwesomeIcons.plus,
                            color: enabled ? Colors.blue : Color(0xFFEEEEEE),
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
                          count: timeCountValue ??=
                              FFAppState().startTimePeriod,
                          updateCount: (count) =>
                              setState(() => timeCountValue = count),
                          stepSize: 1,
                          minimum: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFFFAFAFA),
                      ),
                      child: Text(
                        'Touches:',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
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
                          decrementIconBuilder: (enabled) => FaIcon(
                            FontAwesomeIcons.minus,
                            color:
                                enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                            size: 20,
                          ),
                          incrementIconBuilder: (enabled) => FaIcon(
                            FontAwesomeIcons.plus,
                            color: enabled ? Colors.blue : Color(0xFFEEEEEE),
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
                          count: touchesCountValue ??=
                              FFAppState().startTotalTouches,
                          updateCount: (count) =>
                              setState(() => touchesCountValue = count),
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
                  FFButtonWidget(
                    onPressed: () async {
                      FFAppState().update(() {
                        FFAppState().startPeriods = periodCountValue!;
                        FFAppState().startTimePeriod = timeCountValue!;
                      });
                      FFAppState().update(() {
                        FFAppState().startTotalTouches = touchesCountValue!;
                        FFAppState()
                            .addToRefFencers(FFAppState().leftFencerRef!);
                      });
                      FFAppState().update(() {
                        FFAppState()
                            .addToRefFencers(FFAppState().rightFencerRef!);
                      });

                      final matchesCreateData = {
                        ...createMatchesRecordData(
                          user1: FFAppState().leftFencerRef,
                          user2: FFAppState().rightFencerRef,
                          scheduledTime: getCurrentTimestamp,
                          weapon: FFAppState().refereeweaponselect,
                          noOfPeriods: FFAppState().startPeriods,
                          scoreLeft: 0,
                          scoreRight: 0,
                        ),
                        'fencers': FFAppState().refFencers,
                        'MatchEvents': [
                          getMatchEventFirestoreData(
                            createMatchEventStruct(
                              actionableFencer: FFAppState().refereeReference,
                              scoreLeft: 0,
                              scoreRight: 0,
                              timeOfAction: functions
                                  .minutesToMS(FFAppState().startTimePeriod),
                              periodOfAction: 1,
                              actionID: -1,
                              clearUnsetFields: false,
                              create: true,
                            ),
                            true,
                          )
                        ],
                      };
                      var matchesRecordReference =
                          MatchesRecord.collection.doc();
                      await matchesRecordReference.set(matchesCreateData);
                      currentMatchInProgress =
                          MatchesRecord.getDocumentFromData(
                              matchesCreateData, matchesRecordReference);

                      final matchesUpdateData = {
                        'MatchEvents': FieldValue.arrayUnion([
                          getMatchEventFirestoreData(
                            createMatchEventStruct(
                              actionableFencer: FFAppState().refereeReference,
                              scoreLeft: 0,
                              scoreRight: 0,
                              timeOfAction: functions
                                  .minutesToMS(FFAppState().startTimePeriod),
                              periodOfAction: 1,
                              actionID: -11,
                              clearUnsetFields: false,
                            ),
                            true,
                          )
                        ]),
                      };
                      await currentMatchInProgress!.reference
                          .update(matchesUpdateData);
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RefViewWidget(
                            initStartTime: FFAppState().startTimePeriod,
                            currentMatchInProgress: currentMatchInProgress,
                          ),
                        ),
                      );

                      setState(() {});
                    },
                    text: 'Start Match',
                    options: FFButtonOptions(
                      width: 300,
                      height: 100,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle1.override(
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
