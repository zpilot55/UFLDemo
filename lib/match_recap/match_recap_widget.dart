import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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
  PagingController<DocumentSnapshot?, MatchEventsRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                            'Start Time: ${dateTimeFormat('MMMEd', widget.currentMatch!.scheduledTime)}',
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
                  Text(
                    'Match Events:',
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                ],
              ),
            ),
            PagedListView<DocumentSnapshot<Object?>?, MatchEventsRecord>(
              pagingController: () {
                final Query<Object?> Function(Query<Object?>) queryBuilder =
                    (matchEventsRecord) => matchEventsRecord
                        .orderBy('periodOfAction')
                        .orderBy('timeOfAction', descending: true);
                if (_pagingController != null) {
                  final query = queryBuilder(MatchEventsRecord.collection());
                  if (query != _pagingQuery) {
                    // The query has changed
                    _pagingQuery = query;
                    _streamSubscriptions.forEach((s) => s?.cancel());
                    _streamSubscriptions.clear();
                    _pagingController!.refresh();
                  }
                  return _pagingController!;
                }

                _pagingController = PagingController(firstPageKey: null);
                _pagingQuery = queryBuilder(MatchEventsRecord.collection());
                _pagingController!.addPageRequestListener((nextPageMarker) {
                  queryMatchEventsRecordPage(
                    parent: widget.currentMatch!.reference,
                    queryBuilder: (matchEventsRecord) => matchEventsRecord
                        .orderBy('periodOfAction')
                        .orderBy('timeOfAction', descending: true),
                    nextPageMarker: nextPageMarker,
                    pageSize: 25,
                    isStream: true,
                  ).then((page) {
                    _pagingController!.appendPage(
                      page.data,
                      page.nextPageMarker,
                    );
                    final streamSubscription = page.dataStream?.listen((data) {
                      final itemIndexes = _pagingController!.itemList!
                          .asMap()
                          .map((k, v) => MapEntry(v.reference.id, k));
                      data.forEach((item) {
                        final index = itemIndexes[item.reference.id];
                        final items = _pagingController!.itemList!;
                        if (index != null) {
                          items.replaceRange(index, index + 1, [item]);
                          _pagingController!.itemList = {
                            for (var item in items) item.reference: item
                          }.values.toList();
                        }
                      });
                      setState(() {});
                    });
                    _streamSubscriptions.add(streamSubscription);
                  });
                });
                return _pagingController!;
              }(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              builderDelegate: PagedChildBuilderDelegate<MatchEventsRecord>(
                // Customize what your widget looks like when it's loading the first page.
                firstPageProgressIndicatorBuilder: (_) => Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                ),

                itemBuilder: (context, _, listViewIndex) {
                  final listViewMatchEventsRecord =
                      _pagingController!.itemList![listViewIndex];
                  return Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Color(0xFFF5F5F5),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Fencer:',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    listViewMatchEventsRecord
                                        .actionableFencer!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  final textUsersRecord = snapshot.data!;
                                  return Text(
                                    valueOrDefault<String>(
                                      textUsersRecord.displayName,
                                      'A Fencer',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  );
                                },
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Time:',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Text(
                                listViewMatchEventsRecord.timeOfAction!
                                    .toString(),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Action:',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Text(
                                functions.getActionStringFromID(
                                    listViewMatchEventsRecord.actionID!),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Score:',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Text(
                                '${listViewMatchEventsRecord.scoreLeft?.toString()} - ${listViewMatchEventsRecord.scoreRight?.toString()}',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
