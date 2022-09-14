import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RefViewWidget extends StatefulWidget {
  const RefViewWidget({
    Key? key,
    this.initStartTime,
  }) : super(key: key);

  final int? initStartTime;

  @override
  _RefViewWidgetState createState() => _RefViewWidgetState();
}

class _RefViewWidgetState extends State<RefViewWidget> {
  late final StopWatchTimer timerController;
  late String timerValue;
  late int timerMilliseconds;
  String? radioButtonValue1;
  String? radioButtonValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    timerMilliseconds = widget.initStartTime!;
    timerValue = StopWatchTimer.getDisplayTime(
      0,
      hours: false,
      minute: true,
      second: true,
      milliSecond: true,
    );
    timerController = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: widget.initStartTime!,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
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
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
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
                            setState(() => FFAppState().isTimerRunning = false);
                            if (FFAppState().currentPeriod ==
                                FFAppState().startPeriods) {
                              setState(() => FFAppState().endOfBout = true);
                              setState(() =>
                                  FFAppState().startStopText = 'END OF BOUT');
                            } else {
                              if (FFAppState().onBreak) {
                                setState(() => FFAppState().onBreak = false);
                                await Future.delayed(
                                    const Duration(milliseconds: 100));
                                setState(
                                    () => FFAppState().beginNextPer = true);
                                setState(() =>
                                    FFAppState().startStopText = 'NEXT PER');
                              } else {
                                setState(() => FFAppState().beginBreak = true);
                                setState(() =>
                                    FFAppState().startStopText = 'BEGIN BREAK');
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
                                style: FlutterFlowTheme.of(context).bodyText1,
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
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
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
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  Text(
                                    '-',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      FFAppState().refRightScore.toString(),
                                      '0',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
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
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Action - ${FFAppState().currentFencerName}',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlutterFlowRadioButton(
                                  options: [
                                    'Simple Attack',
                                    'Compound',
                                    'Parry/Riposte',
                                    'Remise',
                                    'Counter',
                                    'Point in Line',
                                    'Not ROW',
                                    'Simultaneous'
                                  ].toList(),
                                  onChanged: (value) {
                                    setState(() => radioButtonValue1 = value);
                                  },
                                  optionHeight: 25,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor: Colors.blue,
                                  inactiveRadioButtonColor: Color(0x8A000000),
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FlutterFlowRadioButton(
                                  options: ['HIT', 'Off Target'].toList(),
                                  onChanged: (value) {
                                    setState(() => radioButtonValue2 = value);
                                  },
                                  optionHeight: 25,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor: Colors.blue,
                                  inactiveRadioButtonColor: Color(0x8A000000),
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 5, 20),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (FFAppState().isLeftFencerAction) {
                                        if (radioButtonValue2 == 'HIT') {
                                          setState(() => FFAppState()
                                                  .refLeftScore =
                                              FFAppState().refLeftScore + 1);
                                        }
                                      } else {
                                        if (radioButtonValue2 == 'HIT') {
                                          setState(() => FFAppState()
                                                  .refRightScore =
                                              FFAppState().refRightScore + 1);
                                        }
                                      }

                                      setState(() =>
                                          FFAppState().showActions = false);
                                      setState(() =>
                                          FFAppState().currentFencerName = '');
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 5, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      setState(() =>
                                          FFAppState().showActions = false);
                                      setState(() =>
                                          FFAppState().currentFencerName = '');
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
                          ],
                        ),
                      ],
                    ),
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
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              setState(
                                  () => FFAppState().isLeftFencerAction = true);
                              setState(() => FFAppState().showActions = true);
                              setState(() => FFAppState().currentFencerName =
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              setState(() =>
                                  FFAppState().isLeftFencerAction = false);
                              setState(() => FFAppState().showActions = true);
                              setState(() => FFAppState().currentFencerName =
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
                              Navigator.pop(context);
                            } else {
                              if (FFAppState().beginBreak) {
                                setState(() => FFAppState().beginBreak = false);
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
                                setState(() =>
                                    FFAppState().startStopText = 'ON BREAK');
                              } else {
                                if (!FFAppState().onBreak) {
                                  if (FFAppState().beginNextPer) {
                                    setState(() => FFAppState().timerStartTime =
                                        functions.minutesToMS(
                                            FFAppState().startTimePeriod));
                                    await Future.delayed(
                                        const Duration(milliseconds: 100));
                                    timerController.onExecute.add(
                                      StopWatchExecute.reset,
                                    );

                                    setState(() =>
                                        FFAppState().startStopText = 'START');
                                    setState(() => FFAppState().currentPeriod =
                                        FFAppState().currentPeriod + 1);
                                  } else {
                                    if (FFAppState().isTimerRunning) {
                                      timerController.onExecute.add(
                                        StopWatchExecute.stop,
                                      );

                                      setState(() =>
                                          FFAppState().isTimerRunning = false);
                                      setState(() =>
                                          FFAppState().startStopText = 'START');
                                    } else {
                                      timerController.onExecute.add(
                                        StopWatchExecute.start,
                                      );

                                      setState(() =>
                                          FFAppState().isTimerRunning = true);
                                      setState(() =>
                                          FFAppState().startStopText = 'STOP');
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
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
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
        ),
      ),
    );
  }
}
