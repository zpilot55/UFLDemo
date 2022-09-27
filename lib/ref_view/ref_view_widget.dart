import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RefViewWidget extends StatefulWidget {
  const RefViewWidget({
    Key? key,
    this.initStartTime,
    this.currentMatchInProgress,
  }) : super(key: key);

  final int? initStartTime;
  final MatchesRecord? currentMatchInProgress;

  @override
  _RefViewWidgetState createState() => _RefViewWidgetState();
}

class _RefViewWidgetState extends State<RefViewWidget> {
  late final StopWatchTimer timerController;
  late String timerValue;
  late int timerMilliseconds;
  String? dropDownValue1;
  String? dropDownValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    timerMilliseconds = functions.minutesToMS(widget.initStartTime!);
    timerValue = StopWatchTimer.getDisplayTime(
      0,
      hours: false,
      minute: true,
      second: true,
      milliSecond: true,
    );
    timerController = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: functions.minutesToMS(widget.initStartTime!),
      onChange: (value) {
        setState(() {
          timerMilliseconds = value;
          timerValue = StopWatchTimer.getDisplayTime(
            value,
            hours: false,
            minute: true,
            second: true,
            milliSecond: true,
          );
        });
      },
    );
  }

  @override
  void dispose() {
    timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 160,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Time: ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                  ),
                            ),
                            FlutterFlowTimer(
                              timerValue: timerValue,
                              timer: timerController,
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).title3,
                              onEnded: () async {
                                setState(
                                    () => FFAppState().isTimerRunning = false);
                                if (FFAppState().currentPeriod ==
                                    FFAppState().startPeriods) {
                                  setState(() => FFAppState().endOfBout = true);
                                  setState(() => FFAppState().startStopText =
                                      'END OF BOUT');
                                } else {
                                  if (FFAppState().onBreak) {
                                    setState(
                                        () => FFAppState().onBreak = false);
                                    await Future.delayed(
                                        const Duration(milliseconds: 100));
                                    setState(
                                        () => FFAppState().beginNextPer = true);
                                    setState(() => FFAppState().startStopText =
                                        'NEXT PER');
                                  } else {
                                    setState(
                                        () => FFAppState().beginBreak = true);
                                    setState(() => FFAppState().startStopText =
                                        'BEGIN BREAK');
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.network(
                                    valueOrDefault<String>(
                                      FFAppState().refLeftPhoto,
                                      'https://firebasestorage.googleapis.com/v0/b/universalfencingleague.appspot.com/o/Fencer_silhouette.png?alt=media&token=7ae87fd2-6264-446f-abbf-c4a7d8d5b642',
                                    ),
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      FFAppState().refLeftName,
                                      'Left Fencer',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
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
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          FFAppState().currentPeriod.toString(),
                                          '1',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          FFAppState().refLeftScore.toString(),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      Text(
                                        '-',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          FFAppState().refRightScore.toString(),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
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
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      FFAppState().refRightName,
                                      'Right Fencer',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (!FFAppState().isTimerRunning)
                              FFButtonWidget(
                                onPressed: () async {
                                  setState(() => FFAppState().endOfBout = true);
                                  setState(
                                      () => FFAppState().endOfBoutPopup = true);
                                },
                                text: 'END BOUT',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: Color(0xFFFF0000),
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
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (FFAppState().isTimerRunning == false)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  setState(() =>
                                      FFAppState().isLeftFencerAction = true);
                                  setState(
                                      () => FFAppState().showActions = true);
                                  setState(() =>
                                      FFAppState().currentFencerName =
                                          FFAppState().refLeftName);
                                },
                                text: 'L',
                                options: FFButtonOptions(
                                  width: 50,
                                  height: 40,
                                  color: Color(0xFFFF0000),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          if (FFAppState().isTimerRunning == false)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  setState(() =>
                                      FFAppState().isLeftFencerAction = false);
                                  setState(
                                      () => FFAppState().showActions = true);
                                  setState(() =>
                                      FFAppState().currentFencerName =
                                          FFAppState().refRightName);
                                },
                                text: 'R',
                                options: FFButtonOptions(
                                  width: 50,
                                  height: 40,
                                  color: Color(0xFF00FF00),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (FFAppState().endOfBout) {
                                  setState(
                                      () => FFAppState().endOfBoutPopup = true);
                                } else {
                                  if (FFAppState().beginBreak) {
                                    setState(
                                        () => FFAppState().beginBreak = false);
                                    setState(() => FFAppState().onBreak = true);
                                    setState(() => FFAppState().timerStartTime =
                                        functions.minutesToMS(
                                            FFAppState().breakDuration));
                                    await Future.delayed(
                                        const Duration(milliseconds: 100));
                                    timerController.onExecute.add(
                                      StopWatchExecute.reset,
                                    );

                                    timerController.onExecute.add(
                                      StopWatchExecute.start,
                                    );

                                    setState(
                                        () => FFAppState().showActions = false);
                                    setState(() => FFAppState().startStopText =
                                        'ON BREAK');
                                  } else {
                                    if (!FFAppState().onBreak) {
                                      if (FFAppState().beginNextPer) {
                                        setState(() => FFAppState()
                                                .timerStartTime =
                                            functions.minutesToMS(
                                                FFAppState().startTimePeriod));
                                        await Future.delayed(
                                            const Duration(milliseconds: 100));
                                        timerController.onExecute.add(
                                          StopWatchExecute.reset,
                                        );

                                        setState(() => FFAppState()
                                            .startStopText = 'START');
                                        setState(() =>
                                            FFAppState().currentPeriod =
                                                FFAppState().currentPeriod + 1);
                                      } else {
                                        if (FFAppState().isTimerRunning) {
                                          timerController.onExecute.add(
                                            StopWatchExecute.stop,
                                          );

                                          setState(() => FFAppState()
                                              .isTimerRunning = false);
                                          setState(() => FFAppState()
                                              .startStopText = 'START');
                                        } else {
                                          timerController.onExecute.add(
                                            StopWatchExecute.start,
                                          );

                                          setState(() => FFAppState()
                                              .isTimerRunning = true);
                                          setState(() => FFAppState()
                                              .startStopText = 'STOP');
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
                                width: 200,
                                height: 60,
                                color: Colors.black,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.black,
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
                ],
              ),
              if (FFAppState().endOfBoutPopup)
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 230,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'You are about to end the bout. Do you wish to continue?',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                setState(() => FFAppState().endOfBout = false);
                                setState(
                                    () => FFAppState().endOfBoutPopup = false);
                              },
                              text: 'Cancel',
                              options: FFButtonOptions(
                                width: 250,
                                height: 40,
                                color: Color(0xFFFF0000),
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
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                await actions.flushLocalState();
                                await widget.currentMatchInProgress!.reference
                                    .delete();
                                Navigator.pop(context);
                              },
                              text: 'Continue without Saving',
                              options: FFButtonOptions(
                                width: 250,
                                height: 40,
                                color: Color(0xFFECD803),
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
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                final matchesUpdateData = {
                                  ...createMatchesRecordData(
                                    scoreLeft: FFAppState().refLeftScore,
                                    scoreRight: FFAppState().refRightScore,
                                    noOfPeriods: FFAppState().currentPeriod,
                                  ),
                                  'MatchEvents': FieldValue.arrayUnion([
                                    getMatchEventFirestoreData(
                                      createMatchEventStruct(
                                        actionableFencer:
                                            FFAppState().refereeReference,
                                        scoreLeft: FFAppState().refLeftScore,
                                        scoreRight: FFAppState().refRightScore,
                                        timeOfAction: timerMilliseconds,
                                        periodOfAction:
                                            FFAppState().currentPeriod,
                                        actionID: -2,
                                        clearUnsetFields: false,
                                      ),
                                      true,
                                    )
                                  ]),
                                };
                                await widget.currentMatchInProgress!.reference
                                    .update(matchesUpdateData);
                                await actions.flushLocalState();
                                Navigator.pop(context);
                              },
                              text: 'Save and Continue',
                              options: FFButtonOptions(
                                width: 250,
                                height: 40,
                                color: Color(0xFF00FF00),
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
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              if (FFAppState().showActions)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Action: ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                    ),
                              ),
                              if (!FFAppState().isSimultaneous)
                                Text(
                                  FFAppState().currentFencerName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                      ),
                                ),
                              Text(
                                FFAppState().refSecondTextAction,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FlutterFlowDropDown(
                                options: [
                                  'Simple Attack',
                                  'Compound',
                                  'Parry/Riposte',
                                  'Remise',
                                  'Counterattack',
                                  'Point in Line'
                                ],
                                onChanged: (val) =>
                                    setState(() => dropDownValue1 = val),
                                width: 180,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                hintText: 'Type of Attack?',
                                fillColor: Colors.white,
                                elevation: 2,
                                borderColor: Colors.black,
                                borderWidth: 1,
                                borderRadius: 0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                hidesUnderline: true,
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  setState(() => FFAppState()
                                          .refSecondTextAction =
                                      '\'s ${dropDownValue1}${dropDownValue2 == 'HITS' ? ' HITS' : ' IS OFF TARGET'}');
                                  setState(() =>
                                      FFAppState().isSimultaneous = false);
                                  setState(
                                      () => FFAppState().nonAttackLabel = '');
                                  if (dropDownValue2 == 'HITS') {
                                    setState(
                                        () => FFAppState().refIsHit = true);
                                  } else {
                                    setState(
                                        () => FFAppState().refIsHit = false);
                                  }
                                },
                                text: 'CONFIRM ATTACK',
                                options: FFButtonOptions(
                                  width: 170,
                                  height: 40,
                                  color: Color(0xFFFF0000),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              FlutterFlowDropDown(
                                options: ['HITS', 'OFF TARGET'],
                                onChanged: (val) =>
                                    setState(() => dropDownValue2 = val),
                                width: 180,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                hintText: 'Hits/Off Target?',
                                fillColor: Colors.white,
                                elevation: 2,
                                borderColor: Colors.black,
                                borderWidth: 1,
                                borderRadius: 0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                hidesUnderline: true,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  setState(
                                      () => FFAppState().isSimultaneous = true);
                                  setState(() => FFAppState().nonAttackLabel =
                                      'Simultaneous');
                                  setState(() =>
                                      FFAppState().refSecondTextAction =
                                          'Attacks are Simultaneous');
                                  setState(() => FFAppState().refIsHit = false);
                                },
                                text: 'Simultaneous',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: Colors.black,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  setState(() =>
                                      FFAppState().nonAttackLabel = 'Pause');
                                  setState(() => FFAppState()
                                      .refSecondTextAction = ' called halt');
                                  setState(() =>
                                      FFAppState().isSimultaneous = false);
                                  setState(() => FFAppState().refIsHit = false);
                                },
                                text: 'Pause',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: Colors.black,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  setState(() =>
                                      FFAppState().refSecondTextAction =
                                          'is awarded a Yellow Card');
                                  setState(() => FFAppState().nonAttackLabel =
                                      'Yellow Card');
                                  setState(() =>
                                      FFAppState().isSimultaneous = false);
                                  setState(() => FFAppState().refIsHit = false);
                                },
                                text: 'Yellow Card',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: Color(0xFFECD803),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  setState(() =>
                                      FFAppState().refSecondTextAction =
                                          'is awarded a Red Card');
                                  setState(() =>
                                      FFAppState().nonAttackLabel = 'Red Card');
                                  setState(() =>
                                      FFAppState().isSimultaneous = false);
                                  setState(() => FFAppState().refIsHit = false);
                                },
                                text: 'Red Card',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: Color(0xFFFF0000),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await actions.awardPointIfApplicable(
                                      FFAppState().isLeftFencerAction,
                                      FFAppState().nonAttackLabel,
                                      FFAppState().refereeweaponselect,
                                      FFAppState().refIsHit,
                                    );

                                    final matchesUpdateData = {
                                      'MatchEvents': FieldValue.arrayUnion([
                                        getMatchEventFirestoreData(
                                          createMatchEventStruct(
                                            actionableFencer: FFAppState()
                                                    .isLeftFencerAction
                                                ? FFAppState().leftFencerRef
                                                : FFAppState().rightFencerRef,
                                            scoreLeft:
                                                FFAppState().refLeftScore,
                                            scoreRight:
                                                FFAppState().refRightScore,
                                            timeOfAction: timerMilliseconds,
                                            periodOfAction:
                                                FFAppState().currentPeriod,
                                            actionID: functions
                                                .getActionIDfromRefState(
                                                    FFAppState()
                                                        .isLeftFencerAction,
                                                    dropDownValue1,
                                                    dropDownValue2,
                                                    FFAppState()
                                                        .nonAttackLabel),
                                            clearUnsetFields: false,
                                          ),
                                          true,
                                        )
                                      ]),
                                    };
                                    await widget
                                        .currentMatchInProgress!.reference
                                        .update(matchesUpdateData);
                                    await actions.flushMatchActionState();
                                    setState(
                                        () => FFAppState().showActions = false);
                                  },
                                  text: 'OK',
                                  options: FFButtonOptions(
                                    width: 100,
                                    height: 40,
                                    color: Color(0xFF00FF00),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await actions.flushMatchActionState();
                                    setState(
                                        () => FFAppState().showActions = false);
                                  },
                                  text: 'CANCEL',
                                  options: FFButtonOptions(
                                    width: 100,
                                    height: 40,
                                    color: Color(0xFFFF0000),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
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
            ],
          ),
        ),
      ),
    );
  }
}
