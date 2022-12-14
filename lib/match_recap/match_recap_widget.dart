import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../match_recap_events/match_recap_events_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchRecapWidget extends StatefulWidget {
  const MatchRecapWidget({
    Key? key,
    this.currentMatch,
  }) : super(key: key);

  final MatchesRecord? currentMatch;

  @override
  _MatchRecapWidgetState createState() => _MatchRecapWidgetState();
}

class _MatchRecapWidgetState extends State<MatchRecapWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Match Recap',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FutureBuilder<UsersRecord>(
                        future: UsersRecord.getDocumentOnce(
                            widget.currentMatch!.user1!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final imageUsersRecord = snapshot.data!;
                          return Image.network(
                            valueOrDefault<String>(
                              imageUsersRecord.photoUrl,
                              'https://firebasestorage.googleapis.com/v0/b/universalfencingleague.appspot.com/o/Fencer_silhouette.png?alt=media&token=7ae87fd2-6264-446f-abbf-c4a7d8d5b642',
                            ),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      FutureBuilder<UsersRecord>(
                        future: UsersRecord.getDocumentOnce(
                            widget.currentMatch!.user1!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final textUsersRecord = snapshot.data!;
                          return Text(
                            valueOrDefault<String>(
                              textUsersRecord.displayName,
                              'Left Fencer',
                            ),
                            style: FlutterFlowTheme.of(context).subtitle1,
                          );
                        },
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
                            valueOrDefault<String>(
                              widget.currentMatch!.scoreLeft?.toString(),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                          Text(
                            '-',
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.currentMatch!.scoreRight?.toString(),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FutureBuilder<UsersRecord>(
                        future: UsersRecord.getDocumentOnce(
                            widget.currentMatch!.user2!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final imageUsersRecord = snapshot.data!;
                          return Image.network(
                            valueOrDefault<String>(
                              imageUsersRecord.photoUrl,
                              'https://firebasestorage.googleapis.com/v0/b/universalfencingleague.appspot.com/o/Fencer_silhouette.png?alt=media&token=7ae87fd2-6264-446f-abbf-c4a7d8d5b642',
                            ),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(
                            widget.currentMatch!.user2!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final textUsersRecord = snapshot.data!;
                          return Text(
                            valueOrDefault<String>(
                              textUsersRecord.displayName,
                              'Right Fencer',
                            ),
                            style: FlutterFlowTheme.of(context).subtitle1,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Match Details:',
                    style: FlutterFlowTheme.of(context).subtitle1,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Weapon: ${widget.currentMatch!.weapon}',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Number of Periods: ${widget.currentMatch!.noOfPeriods?.toString()}',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Start Time: ${dateTimeFormat(
                              'MMMEd',
                              widget.currentMatch!.scheduledTime,
                              locale: FFLocalizations.of(context).languageCode,
                            )}',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Location: ${widget.currentMatch!.location?.toString()}',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MatchRecapEventsWidget(
                            currentMatch: widget.currentMatch,
                          ),
                        ),
                      );
                    },
                    text: 'Detailed Match Events',
                    options: FFButtonOptions(
                      width: 250,
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
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Match Statistics:',
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
