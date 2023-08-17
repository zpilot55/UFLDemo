import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'select_fencer_model.dart';
export 'select_fencer_model.dart';

class SelectFencerWidget extends StatefulWidget {
  const SelectFencerWidget({Key? key}) : super(key: key);

  @override
  _SelectFencerWidgetState createState() => _SelectFencerWidgetState();
}

class _SelectFencerWidgetState extends State<SelectFencerWidget> {
  late SelectFencerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectFencerModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<UsersRecord>>(
      future: queryUsersRecordOnce(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<UsersRecord> selectFencerUsersRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Fencer Select',
                        style: FlutterFlowTheme.of(context).displaySmall,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          _model.currentFencerID =
                              await FlutterBarcodeScanner.scanBarcode(
                            '#C62828', // scanning line color
                            'Cancel', // cancel button text
                            true, // whether to show the flash icon
                            ScanMode.QR,
                          );

                          setState(() {
                            _model.simpleSearchResults = TextSearch(
                              selectFencerUsersRecordList
                                  .map(
                                    (record) =>
                                        TextSearchItem(record, [record.uid!]),
                                  )
                                  .toList(),
                            )
                                .search(_model.currentFencerID!)
                                .map((r) => r.object)
                                .take(1)
                                .toList();
                            ;
                          });
                          _model.currentUserRecord =
                              await actions.getCurrentUserDocument(
                            _model.simpleSearchResults.toList(),
                          );
                          FFAppState().update(() {
                            FFAppState().scannedFencerRef =
                                _model.currentUserRecord?.reference;
                            FFAppState().currentFencerName =
                                _model.currentUserRecord!.displayName;
                          });
                          FFAppState().update(() {
                            FFAppState().currentFencerPicURL =
                                _model.currentUserRecord!.photoUrl;
                          });

                          setState(() {});
                        },
                        text: 'Click to Scan QR Code',
                        options: FFButtonOptions(
                          width: 300.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            'Name: ${FFAppState().currentFencerName}',
                            'Name: <Select Fencer>',
                          ),
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Profile Picture:',
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        valueOrDefault<String>(
                          FFAppState().currentFencerPicURL,
                          'https://firebasestorage.googleapis.com/v0/b/universalfencingleague.appspot.com/o/Fencer_silhouette.png?alt=media&token=7ae87fd2-6264-446f-abbf-c4a7d8d5b642',
                        ),
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 200.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                if (FFAppState().isRightFencer) {
                                  FFAppState().update(() {
                                    FFAppState().rightFencerRef =
                                        FFAppState().scannedFencerRef;
                                    FFAppState().refRightName =
                                        FFAppState().currentFencerName;
                                  });
                                  FFAppState().update(() {
                                    FFAppState().refRightPhoto =
                                        FFAppState().currentFencerPicURL;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState().leftFencerRef =
                                        FFAppState().scannedFencerRef;
                                    FFAppState().refLeftName =
                                        FFAppState().currentFencerName;
                                  });
                                  FFAppState().update(() {
                                    FFAppState().refLeftPhoto =
                                        FFAppState().currentFencerPicURL;
                                  });
                                }

                                FFAppState().update(() {
                                  FFAppState().scannedFencerRef =
                                      FirebaseFirestore.instance
                                          .doc('/users/2');
                                  FFAppState().currentFencerName = '';
                                });
                                FFAppState().update(() {
                                  FFAppState().currentFencerPicURL = '';
                                });
                                Navigator.pop(context);
                              },
                              text: 'Confirm',
                              options: FFButtonOptions(
                                width: 130.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF00FF00),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              text: 'Cancel',
                              options: FFButtonOptions(
                                width: 130.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFFFF0000),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
