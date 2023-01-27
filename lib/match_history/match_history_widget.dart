import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/col_main_drawer_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../match_recap/match_recap_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class MatchHistoryWidget extends StatefulWidget {
  const MatchHistoryWidget({Key? key}) : super(key: key);

  @override
  _MatchHistoryWidgetState createState() => _MatchHistoryWidgetState();
}

class _MatchHistoryWidgetState extends State<MatchHistoryWidget> {
  PagingController<DocumentSnapshot?, MatchesDevRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  String? dropDownValue1;
  String? dropDownValue2;
  String? dropDownValue3;
  String? dropDownValue4;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Drawer(
        elevation: 16,
        child: ColMainDrawerWidget(),
      ),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Match History',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlutterFlowDropDown<String>(
                      options: ['Option 1'],
                      onChanged: (val) => setState(() => dropDownValue1 = val),
                      width: 180,
                      height: 50,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                      hintText: 'Opponent',
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: FlutterFlowTheme.of(context).black600,
                      borderWidth: 0,
                      borderRadius: 0,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                    FlutterFlowDropDown<String>(
                      options: ['Option 1'],
                      onChanged: (val) => setState(() => dropDownValue2 = val),
                      width: 180,
                      height: 50,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                      hintText: 'Weapon',
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: FlutterFlowTheme.of(context).black600,
                      borderWidth: 0,
                      borderRadius: 0,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                    FlutterFlowDropDown<String>(
                      options: ['Option 1'],
                      onChanged: (val) => setState(() => dropDownValue3 = val),
                      width: 180,
                      height: 50,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                      hintText: 'Date',
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: FlutterFlowTheme.of(context).black600,
                      borderWidth: 0,
                      borderRadius: 0,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                    FlutterFlowDropDown<String>(
                      options: ['Option 1'],
                      onChanged: (val) => setState(() => dropDownValue4 = val),
                      width: 180,
                      height: 50,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                      hintText: 'Ranking',
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: FlutterFlowTheme.of(context).black600,
                      borderWidth: 0,
                      borderRadius: 0,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: PagedListView<DocumentSnapshot<Object?>?,
                          MatchesDevRecord>(
                        pagingController: () {
                          final Query<Object?> Function(Query<Object?>)
                              queryBuilder =
                              (matchesDevRecord) => matchesDevRecord
                                  .where('fencers',
                                      arrayContains: currentUserReference)
                                  .orderBy('scheduled_time', descending: true);
                          if (_pagingController != null) {
                            final query =
                                queryBuilder(MatchesDevRecord.collection);
                            if (query != _pagingQuery) {
                              // The query has changed
                              _pagingQuery = query;
                              _streamSubscriptions.forEach((s) => s?.cancel());
                              _streamSubscriptions.clear();
                              _pagingController!.refresh();
                            }
                            return _pagingController!;
                          }

                          _pagingController =
                              PagingController(firstPageKey: null);
                          _pagingQuery =
                              queryBuilder(MatchesDevRecord.collection);
                          _pagingController!
                              .addPageRequestListener((nextPageMarker) {
                            queryMatchesDevRecordPage(
                              queryBuilder: (matchesDevRecord) =>
                                  matchesDevRecord
                                      .where('fencers',
                                          arrayContains: currentUserReference)
                                      .orderBy('scheduled_time',
                                          descending: true),
                              nextPageMarker: nextPageMarker,
                              pageSize: 25,
                              isStream: true,
                            ).then((page) {
                              _pagingController!.appendPage(
                                page.data,
                                page.nextPageMarker,
                              );
                              final streamSubscription =
                                  page.dataStream?.listen((data) {
                                data.forEach((item) {
                                  final itemIndexes = _pagingController!
                                      .itemList!
                                      .asMap()
                                      .map((k, v) =>
                                          MapEntry(v.reference.id, k));
                                  final index = itemIndexes[item.reference.id];
                                  final items = _pagingController!.itemList!;
                                  if (index != null) {
                                    items
                                        .replaceRange(index, index + 1, [item]);
                                    _pagingController!.itemList = {
                                      for (var item in items)
                                        item.reference: item
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
                        scrollDirection: Axis.vertical,
                        builderDelegate:
                            PagedChildBuilderDelegate<MatchesDevRecord>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          ),

                          itemBuilder: (context, _, listViewIndex) {
                            final listViewMatchesDevRecord =
                                _pagingController!.itemList![listViewIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MatchRecapWidget(
                                        currentMatch: listViewMatchesDevRecord,
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Color(0xFFF5F5F5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 220,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                StreamBuilder<UsersRecord>(
                                                  stream: UsersRecord.getDocument(
                                                      listViewMatchesDevRecord
                                                          .user1!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final imageUsersRecord =
                                                        snapshot.data!;
                                                    return Image.network(
                                                      valueOrDefault<String>(
                                                        imageUsersRecord
                                                            .photoUrl,
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
                                                      listViewMatchesDevRecord
                                                          .user1!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final textUsersRecord =
                                                        snapshot.data!;
                                                    return Text(
                                                      valueOrDefault<String>(
                                                        textUsersRecord
                                                            .displayName,
                                                        'Fencer 1',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1,
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'vs',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1,
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                StreamBuilder<UsersRecord>(
                                                  stream: UsersRecord.getDocument(
                                                      listViewMatchesDevRecord
                                                          .user2!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final imageUsersRecord =
                                                        snapshot.data!;
                                                    return Image.network(
                                                      valueOrDefault<String>(
                                                        imageUsersRecord
                                                            .photoUrl,
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
                                                      listViewMatchesDevRecord
                                                          .user2!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final textUsersRecord =
                                                        snapshot.data!;
                                                    return Text(
                                                      valueOrDefault<String>(
                                                        textUsersRecord
                                                            .displayName,
                                                        'Fencer 2',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1,
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                listViewMatchesDevRecord.weapon,
                                                'Weapon',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              () {
                                                if (listViewMatchesDevRecord
                                                        .matchRanking ==
                                                    'A') {
                                                  return 'Ranked - Adult';
                                                } else if (listViewMatchesDevRecord
                                                        .matchRanking ==
                                                    'Y') {
                                                  return 'Ranked - Youth';
                                                } else {
                                                  return 'Unranked';
                                                }
                                              }(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              dateTimeFormat(
                                                'MMMEd',
                                                listViewMatchesDevRecord
                                                    .scheduledTime!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              listViewMatchesDevRecord.location!
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
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
