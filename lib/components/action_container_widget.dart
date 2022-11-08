import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionContainerWidget extends StatefulWidget {
  const ActionContainerWidget({
    Key? key,
    this.currentMatchInProgress,
    this.currentTimerTime,
  }) : super(key: key);

  final MatchesRecord? currentMatchInProgress;
  final int? currentTimerTime;

  @override
  _ActionContainerWidgetState createState() => _ActionContainerWidgetState();
}

class _ActionContainerWidgetState extends State<ActionContainerWidget> {
  String? dropDownValue1;
  String? dropDownValue2;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: FFAppState().showActions,
      child: Padding(
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
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                    ),
                    if (!FFAppState().isSimultaneous)
                      Text(
                        FFAppState().currentFencerName,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                            ),
                      ),
                    Text(
                      FFAppState().refSecondTextAction,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
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
                      onChanged: (val) => setState(() => dropDownValue1 = val),
                      width: 180,
                      height: 50,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                      hintText: 'Type of Attack?',
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.black,
                      borderWidth: 1,
                      borderRadius: 0,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        setState(() => FFAppState().refSecondTextAction =
                            '\'s ${dropDownValue1}${dropDownValue2 == 'HITS' ? ' HITS' : ' IS OFF TARGET'}');
                        setState(() => FFAppState().isSimultaneous = false);
                        setState(() => FFAppState().nonAttackLabel = '');
                        if (dropDownValue2 == 'HITS') {
                          setState(() => FFAppState().refIsHit = true);
                        } else {
                          setState(() => FFAppState().refIsHit = false);
                        }
                      },
                      text: 'CONFIRM ATTACK',
                      options: FFButtonOptions(
                        width: 170,
                        height: 40,
                        color: Color(0xFFFF0000),
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
                    FlutterFlowDropDown(
                      options: ['HITS', 'OFF TARGET'],
                      onChanged: (val) => setState(() => dropDownValue2 = val),
                      width: 180,
                      height: 50,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                      hintText: 'Hits/Off Target?',
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.black,
                      borderWidth: 1,
                      borderRadius: 0,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        setState(() => FFAppState().isSimultaneous = true);
                        setState(
                            () => FFAppState().nonAttackLabel = 'Simultaneous');
                        setState(() => FFAppState().refSecondTextAction =
                            'Attacks are Simultaneous');
                        setState(() => FFAppState().refIsHit = false);
                      },
                      text: 'Simultaneous',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: Colors.black,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
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
                        setState(() => FFAppState().nonAttackLabel = 'Pause');
                        setState(() =>
                            FFAppState().refSecondTextAction = ' called halt');
                        setState(() => FFAppState().isSimultaneous = false);
                        setState(() => FFAppState().refIsHit = false);
                      },
                      text: 'Pause',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: Colors.black,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
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
                        setState(() => FFAppState().refSecondTextAction =
                            'is awarded a Yellow Card');
                        setState(
                            () => FFAppState().nonAttackLabel = 'Yellow Card');
                        setState(() => FFAppState().isSimultaneous = false);
                        setState(() => FFAppState().refIsHit = false);
                      },
                      text: 'Yellow Card',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: Color(0xFFECD803),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
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
                        setState(() => FFAppState().refSecondTextAction =
                            'is awarded a Red Card');
                        setState(
                            () => FFAppState().nonAttackLabel = 'Red Card');
                        setState(() => FFAppState().isSimultaneous = false);
                        setState(() => FFAppState().refIsHit = false);
                      },
                      text: 'Red Card',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: Color(0xFFFF0000),
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
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
                                  actionableFencer:
                                      FFAppState().isLeftFencerAction
                                          ? FFAppState().leftFencerRef
                                          : FFAppState().rightFencerRef,
                                  scoreLeft: FFAppState().refLeftScore,
                                  scoreRight: FFAppState().refRightScore,
                                  timeOfAction: widget.currentTimerTime,
                                  periodOfAction: FFAppState().currentPeriod,
                                  actionID: functions.getActionIDfromRefState(
                                      FFAppState().isLeftFencerAction,
                                      dropDownValue1,
                                      dropDownValue2,
                                      FFAppState().nonAttackLabel),
                                  clearUnsetFields: false,
                                ),
                                true,
                              )
                            ]),
                          };
                          await widget.currentMatchInProgress!.reference
                              .update(matchesUpdateData);
                          await actions.flushMatchActionState();
                          setState(() => FFAppState().showActions = false);
                        },
                        text: 'OK',
                        options: FFButtonOptions(
                          width: 100,
                          height: 40,
                          color: Color(0xFF00FF00),
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await actions.flushMatchActionState();
                          setState(() => FFAppState().showActions = false);
                        },
                        text: 'CANCEL',
                        options: FFButtonOptions(
                          width: 100,
                          height: 40,
                          color: Color(0xFFFF0000),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
