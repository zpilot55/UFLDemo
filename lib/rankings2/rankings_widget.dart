import '/backend/backend.dart';
import '/components/col_main_drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rankings_model.dart';
export 'rankings_model.dart';

class RankingsWidget extends StatefulWidget {
  const RankingsWidget({Key? key}) : super(key: key);

  @override
  _RankingsWidgetState createState() => _RankingsWidgetState();
}

class _RankingsWidgetState extends State<RankingsWidget>
    with TickerProviderStateMixin {
  late RankingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RankingsModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
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
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          actions: [],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              Align(
                alignment: Alignment(0.0, 0),
                child: TabBar(
                  labelColor: FlutterFlowTheme.of(context).primary,
                  labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                  unselectedLabelStyle: TextStyle(),
                  indicatorColor: FlutterFlowTheme.of(context).secondary,
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
                  controller: _model.tabBarController,
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _model.tabBarController,
                  children: [
                    getTabPage('elo_FA'),
                    getTabPage('elo_EA'),
                    getTabPage('elo_SA'),
                    getTabPage('elo_NA'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DataColumn2 getDataColumn2(String name) {
    return DataColumn2(
      label: Container(
        alignment: Alignment.center,
        child: DefaultTextStyle.merge(
            softWrap: true,
            child: Text(
              name,
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
            )),
      ),
    );
  }

  Widget getDataCell(String content, bool show) {
    return Container(
      alignment: show ? Alignment.center : Alignment.centerLeft,
      padding:
          EdgeInsets.only(left: show ? 0 : 20, top: 0, bottom: 0, right: 0),
      child: DefaultTextStyle.merge(
          softWrap: true,
          child: Text(
            content,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
          )),
    );
  }

  Widget getTabPage(String order) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: StreamBuilder<List<UsersRecord>>(
            stream: queryUsersRecord(
              queryBuilder: (userRecord) =>
                  userRecord.orderBy(order, descending: true),
            ),
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
              List<UsersRecord> dataTableRankingsRecordList = snapshot.data!;
              return DataTable2(
                horizontalMargin: 10,
                columnSpacing: 0,
                columns: [
                  getDataColumn2('Rank'),
                  getDataColumn2('Name'),
                  getDataColumn2('Club'),
                  getDataColumn2('Elo'),
                ],
                // rows:[
                //   DataRow2(cells: [DataCell(Text('11')), DataCell(Text('11')), DataCell(Text('11')), DataCell(Text('11'))])
                // ],
                rows: dataTableRankingsRecordList
                    .mapIndexed((index, record) => [
                          getDataCell(functions.addOne(index).toString(), true),
                          getDataCell(record.displayName.toString(), false),
                          getDataCell('A Club', false),
                          getDataCell(changeData(order, record), true),
                        ].map((c) => DataCell(c)).toList())
                    .map((e) => DataRow(cells: e))
                    .toList(),
                headingRowColor: MaterialStateProperty.all(
                  FlutterFlowTheme.of(context).primaryBackground,
                ),
                headingRowHeight: 56.0,
                dataRowColor: MaterialStateProperty.all(
                  FlutterFlowTheme.of(context).secondaryBackground,
                ),
                dataRowHeight: 56.0,
                border: TableBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                dividerThickness: 1.0,
                showBottomBorder: false,
                minWidth: 49.0,
              );
            },
          ),
        ),
      ],
    );
  }

  String changeData(String order, UsersRecord record){
    if(order == 'elo_FA'){
      return record.eloFA.toString();
    }
    if(order == 'elo_EA'){
      return record.eloEA.toString();
    }
    if(order == 'elo_SA'){
      return record.eloSA.toString();
    }
    if(order == 'elo_NA'){
      return record.eloNA.toString();
    }
    return '';
  }
}
