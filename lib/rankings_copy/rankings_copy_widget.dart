import '/backend/backend.dart';
import '/components/col_main_drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rankings_copy_model.dart';
export 'rankings_copy_model.dart';

class RankingsCopyWidget extends StatefulWidget {
  const RankingsCopyWidget({Key? key}) : super(key: key);

  @override
  _RankingsCopyWidgetState createState() => _RankingsCopyWidgetState();
}

class _RankingsCopyWidgetState extends State<RankingsCopyWidget> {
  late RankingsCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RankingsCopyModel());
  }

  @override
  void dispose() {
    _model.dispose();

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
        elevation: 16.0,
        child: wrapWithModel(
          model: _model.colMainDrawerModel,
          updateCallback: () => setState(() {}),
          child: ColMainDrawerWidget(),
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: DefaultTabController(
            length: 4,
            initialIndex: 0,
            child: Column(
              children: [
                TabBar(
                  labelColor: FlutterFlowTheme.of(context).primaryColor,
                  labelStyle: FlutterFlowTheme.of(context).bodyText1,
                  indicatorColor: FlutterFlowTheme.of(context).secondaryColor,
                  tabs: [
                    Tab(
                      text: 'Foil',
                    ),
                    Tab(
                      text: 'Epee',
                    ),
                    Tab(
                      text: 'Sabre',
                    ),
                    Tab(
                      text: 'Noodle',
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      StreamBuilder<List<UsersRecord>>(
                        stream: queryUsersRecord(
                          queryBuilder: (usersRecord) => usersRecord
                              .where('numRankedFA', isGreaterThanOrEqualTo: 10),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          List<UsersRecord> rowUsersRecordList = snapshot.data!;
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(rowUsersRecordList.length,
                                (rowIndex) {
                              final rowUsersRecord =
                                  rowUsersRecordList[rowIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Text(
                                          'Club Ranking:',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.7,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: ListView(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      children: [],
                                    ),
                                  ),
                                ],
                              );
                            }),
                          );
                        },
                      ),
                      Container(),
                      Container(),
                      Container(),
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
