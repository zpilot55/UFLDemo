import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EndBoutContainerWidget extends StatefulWidget {
  const EndBoutContainerWidget({
    Key? key,
    this.currentMatchInProgress,
    this.currentTimerTime,
  }) : super(key: key);

  final MatchesRecord? currentMatchInProgress;
  final int? currentTimerTime;

  @override
  _EndBoutContainerWidgetState createState() => _EndBoutContainerWidgetState();
}

class _EndBoutContainerWidgetState extends State<EndBoutContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: FFAppState().endOfBoutPopup,
      child: Container(
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
                      setState(() => FFAppState().endOfBoutPopup = false);
                    },
                    text: 'Cancel',
                    options: FFButtonOptions(
                      width: 250,
                      height: 40,
                      color: Color(0xFFFF0000),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
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
                      await widget.currentMatchInProgress!.reference.delete();
                      Navigator.pop(context);
                    },
                    text: 'Continue without Saving',
                    options: FFButtonOptions(
                      width: 250,
                      height: 40,
                      color: Color(0xFFECD803),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
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
                              actionableFencer: FFAppState().refereeReference,
                              scoreLeft: FFAppState().refLeftScore,
                              scoreRight: FFAppState().refRightScore,
                              timeOfAction: widget.currentTimerTime,
                              periodOfAction: FFAppState().currentPeriod,
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
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
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
    );
  }
}
