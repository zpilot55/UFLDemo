import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/ref_match_recap_events/ref_match_recap_events_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ref_view_model.dart';
export 'ref_view_model.dart';

class RefViewWidget extends StatefulWidget {
  const RefViewWidget({
    Key? key,
    this.initStartTime,
    this.startNumOfPeriods,
    this.startNumOfTouches,
    this.currentMatchInProgress,
    this.currentMatchDetails,
    this.rankCode,
  }) : super(key: key);

  final int? initStartTime;
  final int? startNumOfPeriods;
  final int? startNumOfTouches;
  final MatchesDevRecord? currentMatchInProgress;
  final MatchdetailsDevRecord? currentMatchDetails;
  final String? rankCode;

  @override
  _RefViewWidgetState createState() => _RefViewWidgetState();
}

class _RefViewWidgetState extends State<RefViewWidget> {
  late RefViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RefViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(FFAppState().leftFencerRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0x00FFFFFF),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final refViewUsersRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Color(0x00FFFFFF),
              endDrawer: Drawer(
                elevation: 16.0,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SelectionArea(
                            child: Text(
                          'Match Options',
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        )),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SelectionArea(
                              child: Text(
                            'Replay Last Action',
                            style: FlutterFlowTheme.of(context).titleMedium,
                          )),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RefMatchRecapEventsWidget(
                                currentMatch: widget.currentMatchDetails,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SelectionArea(
                                child: Text(
                              'View Match Timeline',
                              style: FlutterFlowTheme.of(context).titleMedium,
                            )),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SelectionArea(
                              child: Text(
                            'Injured Fencer',
                            style: FlutterFlowTheme.of(context).titleMedium,
                          )),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SelectionArea(
                              child: Text(
                            'Issue Black Card',
                            style: FlutterFlowTheme.of(context).titleMedium,
                          )),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              body: SafeArea(
                top: true,
                child: StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(FFAppState().rightFencerRef!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    final stackUsersRecord = snapshot.data!;
                    return Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 160.0,
                                decoration: BoxDecoration(
                                  color: Color(0x80FFFFFF),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Time: ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 18.0,
                                              ),
                                        ),
                                        FlutterFlowTimer(
                                          initialTime: functions.minutesToMS(
                                              widget.initStartTime!),
                                          getDisplayTime: (value) =>
                                              StopWatchTimer.getDisplayTime(
                                            value,
                                            hours: false,
                                          ),
                                          timer: _model.timerController,
                                          onChanged: (value, displayTime,
                                              shouldUpdate) {
                                            _model.timerMilliseconds = value;
                                            _model.timerValue = displayTime;
                                            if (shouldUpdate) setState(() {});
                                          },
                                          onEnded: () async {
                                            FFAppState().update(() {
                                              FFAppState().isTimerRunning =
                                                  false;
                                            });
                                            if (FFAppState().currentPeriod ==
                                                widget.startNumOfPeriods) {
                                              setState(() {
                                                FFAppState().endOfBout = true;
                                                FFAppState().startStopText =
                                                    'END OF BOUT';
                                              });
                                            } else {
                                              if (FFAppState().onBreak) {
                                                setState(() {
                                                  FFAppState().onBreak = false;
                                                  FFAppState().beginNextPer =
                                                      true;
                                                  FFAppState().startStopText =
                                                      'NEXT PER';
                                                });
                                              } else {
                                                setState(() {
                                                  FFAppState().beginBreak =
                                                      true;
                                                  FFAppState().startStopText =
                                                      'BEGIN BREAK';
                                                });
                                              }
                                            }
                                          },
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.network(
                                                valueOrDefault<String>(
                                                  FFAppState().refLeftPhoto,
                                                  'https://firebasestorage.googleapis.com/v0/b/universalfencingleague.appspot.com/o/Fencer_silhouette.png?alt=media&token=7ae87fd2-6264-446f-abbf-c4a7d8d5b642',
                                                ),
                                                width: 60.0,
                                                height: 60.0,
                                                fit: BoxFit.cover,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  FFAppState().refLeftName,
                                                  'Left Fencer',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Period: ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      FFAppState()
                                                          .currentPeriod
                                                          .toString(),
                                                      '1',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      FFAppState()
                                                          .refLeftScore
                                                          .toString(),
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                  Text(
                                                    '-',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      FFAppState()
                                                          .refRightScore
                                                          .toString(),
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Image.network(
                                                valueOrDefault<String>(
                                                  FFAppState().refRightPhoto,
                                                  'https://firebasestorage.googleapis.com/v0/b/universalfencingleague.appspot.com/o/Fencer_silhouette.png?alt=media&token=7ae87fd2-6264-446f-abbf-c4a7d8d5b642',
                                                ),
                                                width: 60.0,
                                                height: 60.0,
                                                fit: BoxFit.cover,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  FFAppState().refRightName,
                                                  'Right Fencer',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (!FFAppState().isTimerRunning)
                                          FFButtonWidget(
                                            onPressed: () async {
                                              FFAppState().update(() {
                                                FFAppState().endOfBout = true;
                                                FFAppState().endOfBoutPopup =
                                                    true;
                                              });
                                            },
                                            text: 'END BOUT',
                                            options: FFButtonOptions(
                                              width: 130.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFFFF0000),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
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
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: Color(0x80FFFFFF),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (!valueOrDefault<bool>(
                                        FFAppState().isTimerRunning ||
                                            FFAppState().showActions ||
                                            FFAppState().endOfBoutPopup,
                                        true,
                                      ))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              FFAppState().update(() {
                                                FFAppState()
                                                    .isLeftFencerAction = true;
                                                FFAppState().showActions = true;
                                              });
                                              FFAppState().update(() {
                                                FFAppState().currentFencerName =
                                                    FFAppState().refLeftName;
                                              });
                                            },
                                            text: 'L',
                                            options: FFButtonOptions(
                                              width: 50.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFFFF0000),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      Spacer(),
                                      if (!(FFAppState().showActions ||
                                          FFAppState().endOfBoutPopup))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (FFAppState().endOfBout) {
                                                FFAppState().update(() {
                                                  FFAppState().endOfBoutPopup =
                                                      true;
                                                });
                                              } else {
                                                if (FFAppState().beginBreak) {
                                                  FFAppState().update(() {
                                                    FFAppState().beginBreak =
                                                        false;
                                                    FFAppState().onBreak = true;
                                                  });
                                                  _model.timerController
                                                      .setPresetTime(
                                                    mSec: functions.minutesToMS(
                                                        FFAppState()
                                                            .breakDuration),
                                                    add: false,
                                                  );
                                                  _model
                                                      .timerController.onExecute
                                                      .add(StopWatchExecute
                                                          .reset);

                                                  _model
                                                      .timerController.onExecute
                                                      .add(StopWatchExecute
                                                          .start);
                                                  FFAppState().update(() {
                                                    FFAppState().showActions =
                                                        false;
                                                    FFAppState().startStopText =
                                                        'ON BREAK';
                                                  });
                                                } else {
                                                  if (!FFAppState().onBreak) {
                                                    if (FFAppState()
                                                        .beginNextPer) {
                                                      _model.timerController
                                                          .setPresetTime(
                                                        mSec: functions
                                                            .minutesToMS(widget
                                                                .initStartTime!),
                                                        add: false,
                                                      );
                                                      _model.timerController
                                                          .onExecute
                                                          .add(StopWatchExecute
                                                              .reset);

                                                      FFAppState().update(() {
                                                        FFAppState()
                                                                .startStopText =
                                                            'START';
                                                        FFAppState()
                                                                .currentPeriod =
                                                            FFAppState()
                                                                    .currentPeriod +
                                                                1;
                                                        FFAppState()
                                                                .beginNextPer =
                                                            false;
                                                      });
                                                    } else {
                                                      if (FFAppState()
                                                          .isTimerRunning) {
                                                        _model.timerController
                                                            .onExecute
                                                            .add(
                                                                StopWatchExecute
                                                                    .stop);
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .isTimerRunning =
                                                              false;
                                                          FFAppState()
                                                                  .startStopText =
                                                              'START';
                                                        });
                                                      } else {
                                                        _model.timerController
                                                            .onExecute
                                                            .add(
                                                                StopWatchExecute
                                                                    .start);
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .isTimerRunning =
                                                              true;
                                                          FFAppState()
                                                                  .startStopText =
                                                              'STOP';
                                                        });
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            },
                                            text: valueOrDefault<String>(
                                              FFAppState().startStopText,
                                              'START',
                                            ),
                                            options: FFButtonOptions(
                                              width: 200.0,
                                              height: 60.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Colors.black,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      Spacer(),
                                      if (!valueOrDefault<bool>(
                                        FFAppState().isTimerRunning ||
                                            FFAppState().showActions ||
                                            FFAppState().endOfBoutPopup,
                                        true,
                                      ))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              FFAppState().update(() {
                                                FFAppState()
                                                    .isLeftFencerAction = false;
                                                FFAppState().showActions = true;
                                              });
                                              FFAppState().update(() {
                                                FFAppState().currentFencerName =
                                                    FFAppState().refRightName;
                                              });
                                            },
                                            text: 'R',
                                            options: FFButtonOptions(
                                              width: 50.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFF00FF00),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (FFAppState().showActions)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 250.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 20.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Action: ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 18.0,
                                              ),
                                        ),
                                        if (!FFAppState().isSimultaneous)
                                          Text(
                                            FFAppState().currentFencerName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 18.0,
                                                ),
                                          ),
                                        Text(
                                          FFAppState().refSecondTextAction,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 18.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownValueController1 ??=
                                              FormFieldController<String>(null),
                                          options: [
                                            'Simple Attack',
                                            'Compound',
                                            'Parry/Riposte',
                                            'Remise',
                                            'Counterattack',
                                            'Point in Line'
                                          ],
                                          onChanged: (val) async {
                                            setState(() =>
                                                _model.dropDownValue1 = val);
                                            _model.actionText1 = await actions
                                                .setActionFromDropdown(
                                              _model.dropDownValue1,
                                              _model.dropDownValue2,
                                            );
                                            FFAppState().update(() {
                                              FFAppState().refSecondTextAction =
                                                  _model.actionText1!;
                                              FFAppState().isSimultaneous =
                                                  false;
                                            });

                                            setState(() {});
                                          },
                                          width: 180.0,
                                          height: 50.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.black,
                                                  ),
                                          hintText: 'Type of Attack?',
                                          fillColor: Colors.white,
                                          elevation: 2.0,
                                          borderColor: Colors.black,
                                          borderWidth: 1.0,
                                          borderRadius: 0.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 4.0, 12.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                        FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownValueController2 ??=
                                              FormFieldController<String>(null),
                                          options: ['HITS', 'OFF TARGET'],
                                          onChanged: (val) async {
                                            setState(() =>
                                                _model.dropDownValue2 = val);
                                            _model.actionText2 = await actions
                                                .setActionFromDropdown(
                                              _model.dropDownValue1,
                                              _model.dropDownValue2,
                                            );
                                            FFAppState().update(() {
                                              FFAppState().refSecondTextAction =
                                                  _model.actionText2!;
                                            });

                                            setState(() {});
                                          },
                                          width: 180.0,
                                          height: 50.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.black,
                                                  ),
                                          hintText: 'Hits/Off Target?',
                                          fillColor: Colors.white,
                                          elevation: 2.0,
                                          borderColor: Colors.black,
                                          borderWidth: 1.0,
                                          borderRadius: 0.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 4.0, 12.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 20.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            FFAppState().update(() {
                                              FFAppState().isSimultaneous =
                                                  true;
                                              FFAppState().nonAttackLabel =
                                                  'Simultaneous';
                                            });
                                            FFAppState().update(() {
                                              FFAppState().refSecondTextAction =
                                                  'Attacks are Simultaneous';
                                              FFAppState().refIsHit = false;
                                            });
                                          },
                                          text: 'Simultaneous',
                                          options: FFButtonOptions(
                                            width: 130.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.black,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            FFAppState().update(() {
                                              FFAppState().nonAttackLabel =
                                                  'Pause';
                                              FFAppState().refSecondTextAction =
                                                  ' called halt';
                                            });
                                            FFAppState().update(() {
                                              FFAppState().isSimultaneous =
                                                  false;
                                              FFAppState().refIsHit = false;
                                            });
                                          },
                                          text: 'Pause',
                                          options: FFButtonOptions(
                                            width: 130.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.black,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            FFAppState().update(() {
                                              FFAppState().refSecondTextAction =
                                                  'is awarded a Yellow Card';
                                              FFAppState().nonAttackLabel =
                                                  'Yellow Card';
                                            });
                                            FFAppState().update(() {
                                              FFAppState().isSimultaneous =
                                                  false;
                                              FFAppState().refIsHit = false;
                                            });
                                          },
                                          text: 'Yellow Card',
                                          options: FFButtonOptions(
                                            width: 130.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFFECD803),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            FFAppState().update(() {
                                              FFAppState().refSecondTextAction =
                                                  'is awarded a Red Card';
                                              FFAppState().nonAttackLabel =
                                                  'Red Card';
                                            });
                                            FFAppState().update(() {
                                              FFAppState().isSimultaneous =
                                                  false;
                                              FFAppState().refIsHit = false;
                                            });
                                          },
                                          text: 'Red Card',
                                          options: FFButtonOptions(
                                            width: 130.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFFFF0000),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 40.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: StreamBuilder<
                                              MatchstatslogDevRecord>(
                                            stream: MatchstatslogDevRecord
                                                .getDocument(widget
                                                    .currentMatchInProgress!
                                                    .matchStatsLog!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              final buttonMatchstatslogDevRecord =
                                                  snapshot.data!;
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  await actions
                                                      .awardPointIfApplicable(
                                                    FFAppState()
                                                        .isLeftFencerAction,
                                                    FFAppState().nonAttackLabel,
                                                    FFAppState()
                                                        .refereeweaponselect,
                                                    FFAppState().refIsHit,
                                                  );
                                                  _model.currentActionID =
                                                      await actions
                                                          .generateActionID(
                                                    FFAppState()
                                                        .isLeftFencerAction,
                                                    _model.dropDownValue1,
                                                    !FFAppState().refIsHit,
                                                    FFAppState().nonAttackLabel,
                                                  );
                                                  _model.newStatsSnapshot =
                                                      await actions.updateStats(
                                                    _model.currentActionID!,
                                                    _model.timerMilliseconds,
                                                    buttonMatchstatslogDevRecord
                                                        .matchStats.last,
                                                    FFAppState().currentPeriod,
                                                  );

                                                  await buttonMatchstatslogDevRecord
                                                      .reference
                                                      .update({
                                                    'MatchStats':
                                                        FieldValue.arrayUnion([
                                                      getMatchStatSnapshotFirestoreData(
                                                        updateMatchStatSnapshotStruct(
                                                          _model
                                                              .newStatsSnapshot,
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                        true,
                                                      )
                                                    ]),
                                                  });
                                                  _model.newMatchStatlines =
                                                      await actions
                                                          .generateStatlines(
                                                    _model.newStatsSnapshot!,
                                                  );

                                                  await widget
                                                      .currentMatchDetails!
                                                      .reference
                                                      .update({
                                                    ...createMatchdetailsDevRecordData(
                                                      overallStats:
                                                          updateMatchStatSnapshotStruct(
                                                        _model.newStatsSnapshot,
                                                        clearUnsetFields: false,
                                                      ),
                                                    ),
                                                    'MatchEvents':
                                                        FieldValue.arrayUnion([
                                                      getMatchEventFirestoreData(
                                                        createMatchEventStruct(
                                                          actionableFencer: FFAppState()
                                                                  .isLeftFencerAction
                                                              ? FFAppState()
                                                                  .leftFencerRef
                                                              : FFAppState()
                                                                  .rightFencerRef,
                                                          scoreLeft:
                                                              FFAppState()
                                                                  .refLeftScore,
                                                          scoreRight:
                                                              FFAppState()
                                                                  .refRightScore,
                                                          timeOfAction: _model
                                                              .timerMilliseconds,
                                                          periodOfAction:
                                                              FFAppState()
                                                                  .currentPeriod,
                                                          actionID: _model
                                                              .currentActionID,
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                        true,
                                                      )
                                                    ]),
                                                    'Statlines':
                                                        getStatlineListFirestoreData(
                                                      _model.newMatchStatlines,
                                                    ),
                                                  });
                                                  await actions
                                                      .flushMatchActionState();
                                                  FFAppState().update(() {
                                                    FFAppState().showActions =
                                                        false;
                                                    FFAppState()
                                                            .snapshotCounter =
                                                        FFAppState()
                                                                .snapshotCounter +
                                                            1;
                                                  });

                                                  setState(() {});
                                                },
                                                text: 'OK',
                                                options: FFButtonOptions(
                                                  width: 100.0,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFF00FF00),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await actions
                                                  .flushMatchActionState();
                                              FFAppState().update(() {
                                                FFAppState().showActions =
                                                    false;
                                              });
                                            },
                                            text: 'CANCEL',
                                            options: FFButtonOptions(
                                              width: 100.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFFFF0000),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (FFAppState().endOfBoutPopup)
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 230.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'You are about to end the bout. Do you wish to continue?',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().update(() {
                                            FFAppState().endOfBout = false;
                                            FFAppState().endOfBoutPopup = false;
                                          });
                                        },
                                        text: 'Cancel',
                                        options: FFButtonOptions(
                                          width: 250.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFFF0000),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await actions.flushLocalState();
                                          await widget
                                              .currentMatchDetails!.reference
                                              .delete();
                                          await widget
                                              .currentMatchInProgress!.reference
                                              .delete();
                                          Navigator.pop(context);
                                        },
                                        text: 'Continue without Saving',
                                        options: FFButtonOptions(
                                          width: 250.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFECD803),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      StreamBuilder<MatchstatslogDevRecord>(
                                        stream:
                                            MatchstatslogDevRecord.getDocument(
                                                widget.currentMatchInProgress!
                                                    .matchStatsLog!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final buttonMatchstatslogDevRecord =
                                              snapshot.data!;
                                          return FFButtonWidget(
                                            onPressed: () async {
                                              await widget
                                                  .currentMatchInProgress!
                                                  .reference
                                                  .update(
                                                      createMatchesDevRecordData(
                                                scoreLeft:
                                                    FFAppState().refLeftScore,
                                                scoreRight:
                                                    FFAppState().refRightScore,
                                                noOfPeriods:
                                                    FFAppState().currentPeriod,
                                              ));
                                              if (FFAppState().refLeftScore >
                                                  FFAppState().refRightScore) {
                                                setState(() {
                                                  _model.didLeftWin = true;
                                                });
                                              } else {
                                                setState(() {
                                                  _model.didLeftWin = false;
                                                });
                                              }

                                              await widget.currentMatchDetails!
                                                  .reference
                                                  .update({
                                                ...createMatchdetailsDevRecordData(
                                                  overallStats:
                                                      updateMatchStatSnapshotStruct(
                                                    buttonMatchstatslogDevRecord
                                                        .matchStats.last,
                                                    clearUnsetFields: false,
                                                  ),
                                                ),
                                                'MatchEvents':
                                                    FieldValue.arrayUnion([
                                                  getMatchEventFirestoreData(
                                                    createMatchEventStruct(
                                                      actionableFencer:
                                                          FFAppState()
                                                              .refereeReference,
                                                      scoreLeft: FFAppState()
                                                          .refLeftScore,
                                                      scoreRight: FFAppState()
                                                          .refRightScore,
                                                      timeOfAction: _model
                                                          .timerMilliseconds,
                                                      periodOfAction:
                                                          FFAppState()
                                                              .currentPeriod,
                                                      actionID: -2,
                                                      clearUnsetFields: false,
                                                    ),
                                                    true,
                                                  )
                                                ]),
                                              });
                                              if (widget.rankCode != 'U') {
                                                _model.eloDiff = await actions
                                                    .getEloDifference(
                                                  refViewUsersRecord.eloFA,
                                                  stackUsersRecord.eloFA,
                                                  _model.didLeftWin!,
                                                );
                                                if (_model.didLeftWin!) {
                                                  await refViewUsersRecord
                                                      .reference
                                                      .update({
                                                    'elo_FA':
                                                        FieldValue.increment(
                                                            _model.eloDiff!),
                                                    'numRankedFA':
                                                        FieldValue.increment(1),
                                                  });

                                                  await stackUsersRecord
                                                      .reference
                                                      .update({
                                                    'elo_FA':
                                                        FieldValue.increment(
                                                            -(_model.eloDiff!)),
                                                    'numRankedFA':
                                                        FieldValue.increment(1),
                                                  });
                                                } else {
                                                  await refViewUsersRecord
                                                      .reference
                                                      .update({
                                                    'elo_FA':
                                                        FieldValue.increment(
                                                            -(_model.eloDiff!)),
                                                    'numRankedFA':
                                                        FieldValue.increment(1),
                                                  });

                                                  await stackUsersRecord
                                                      .reference
                                                      .update({
                                                    'numRankedFA':
                                                        FieldValue.increment(1),
                                                  });
                                                }
                                              }
                                              if (refViewUsersRecord
                                                      .numRankedFA >=
                                                  10) {
                                                await refViewUsersRecord
                                                    .rankingsPage!
                                                    .update(
                                                        createRankingsRecordData(
                                                  fencerRankings:
                                                      createRankingStructStruct(
                                                    eloFA: refViewUsersRecord
                                                        .eloFA,
                                                    clearUnsetFields: false,
                                                  ),
                                                ));
                                              }
                                              if (stackUsersRecord
                                                      .numRankedFA >=
                                                  10) {
                                                await stackUsersRecord
                                                    .rankingsPage!
                                                    .update(
                                                        createRankingsRecordData(
                                                  fencerRankings:
                                                      createRankingStructStruct(
                                                    eloFA:
                                                        stackUsersRecord.eloFA,
                                                    clearUnsetFields: false,
                                                  ),
                                                ));
                                              }
                                              await actions.flushLocalState();
                                              Navigator.pop(context);

                                              setState(() {});
                                            },
                                            text: 'Save and Continue',
                                            options: FFButtonOptions(
                                              width: 250.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFF00FF00),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
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
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
