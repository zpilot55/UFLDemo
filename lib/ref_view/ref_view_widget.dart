import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../ref_match_recap_events/ref_match_recap_events_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:camera/camera.dart';
import 'package:ffmpeg_kit_flutter_https_gpl/return_code.dart';
import 'package:ffmpeg_kit_flutter_https_gpl/ffmpeg_kit.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

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
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
  );
  StopWatchTimer timerController =
      StopWatchTimer(mode: StopWatchMode.countDown);

  String? actionText1;
  String? dropDownValue1;
  String? actionText2;
  String? dropDownValue2;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isLoading = true;
  bool _isRecording = false;
  bool _isUploading = false;

  late String uploadURL;
  late CameraController _cameraController;

  @override
  void initState() {
    super.initState();
    _initCamera();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    timerController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  _initCamera() async {
    final cameras = await availableCameras();
    final backCamera = cameras.firstWhere((camera) =>
    camera.lensDirection == CameraLensDirection.back);
    _cameraController = CameraController(backCamera, ResolutionPreset.medium);
    await _cameraController.initialize();
    //_cameraController.lockCaptureOrientation([DeviceOrientation.landscapeLeft]);
    setState(() => _isLoading = false);
  }

  _startRecording() async {
    await _cameraController.prepareForVideoRecording();
    await _cameraController.startVideoRecording();
    setState(() => _isRecording = true);
  }

  Future<XFile> _stopRecording() async {
    final file = await _cameraController.stopVideoRecording();
    setState(() => _isRecording = false);
    return file;
  }

  Future<String> _trimAndUpload(XFile localFile) async {

    int cutOffEndTime = -3; //Hardcoded cutoff time
    String newFilePath = '${localFile.path.split('.mp4')[0]}-s.mp4';
    await FFmpegKit.executeAsync('-encoders');
    await FFmpegKit.execute('-sseof $cutOffEndTime -i ${localFile.path} -f mp4 $newFilePath').then((session) async {

      // Return code for completed sessions. Will be undefined if session is still running or FFmpegKit fails to run it
      final returnCode = await session.getReturnCode();

      // The list of logs generated for this execution
      final logs = await session.getLogs();

      if (ReturnCode.isSuccess(returnCode)) {

        print("Video Chop Success!");

      } else if (ReturnCode.isCancel(returnCode)) {

        print("Video Chop CANCEL!");

      } else {

        print("Video Chop ERROR!");

      }
    });

    setState(() => _isUploading = true);
    final newFile = File(newFilePath);
    String matchID = widget.currentMatchInProgress!.reference.id;
    String fileName = newFilePath.split('/').last;
    String newPath = 'matches/$matchID/$fileName';

// Create the file metadata
    final metadata = SettableMetadata(contentType: "video/mp4");

// Create a reference to the Firebase Storage bucket
    final storageRef = FirebaseStorage.instance.ref();

// Upload file and metadata to the path 'images/mountains.jpg'
    final uploadTask = storageRef
        .child(newPath)
        .putFile(newFile, metadata);

// Listen for state changes, errors, and completion of the upload.
    uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
      switch (taskSnapshot.state) {
        case TaskState.running:
          final progress =
              100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
          print("Upload is $progress% complete.");
          break;
        case TaskState.paused:
          print("Upload is paused.");
          break;
        case TaskState.canceled:
          print("Upload was canceled");
          break;
        case TaskState.error:
        // Handle unsuccessful uploads
          break;
        case TaskState.success:
          print("Uploaded Succeeded!");
          break;
      }

    });

    String uploadedURL = await (await uploadTask).ref.getDownloadURL();
    setState(() => _isUploading = false);
    return uploadedURL;
  }

 /* Future<String> _uploadVideo(String localFilePath) async {
    setState(() => _isUploading = true);
    final newFile = File(localFilePath);
    String matchID = widget.currentMatchInProgress!.reference.id;
    String fileName = localFilePath
        .split('/')
        .last;
    String newPath = 'matches/$matchID/$fileName';

// Create the file metadata
    final metadata = SettableMetadata(contentType: "video/mp4");

// Create a reference to the Firebase Storage bucket
    final storageRef = FirebaseStorage.instance.ref();

// Upload file and metadata to the path 'images/mountains.jpg'
    final uploadTask = storageRef
        .child(newPath)
        .putFile(newFile, metadata);

// Listen for state changes, errors, and completion of the upload.
    uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
      switch (taskSnapshot.state) {
        case TaskState.running:
          final progress =
              100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
          print("Upload is $progress% complete.");
          break;
        case TaskState.paused:
          print("Upload is paused.");
          break;
        case TaskState.canceled:
          print("Upload was canceled");
          break;
        case TaskState.error:
        // Handle unsuccessful uploads
          break;
        case TaskState.success:
          print("Uploaded Succeeded!");
          setState(() => _isUploading = false);
          break;
      }
    });
    Future<String> uploadedURL = uploadTask.snapshot.ref.getDownloadURL();

    return uploadedURL;
  }*/

/*  _stopRecording() async {
    final file = await _cameraController.stopVideoRecording();
    setState(() => _isRecording = false);
    int cutOffEndTime = -3; //Hardcoded cutoff time
    String newFilePath = '${file.path.split('.mp4')[0]}-s.mp4';
    await FFmpegKit.executeAsync('-encoders');
    await FFmpegKit.execute('-sseof $cutOffEndTime -i ${file.path} -f mp4 $newFilePath').then((session) async {

      // Return code for completed sessions. Will be undefined if session is still running or FFmpegKit fails to run it
      final returnCode = await session.getReturnCode();

      // The list of logs generated for this execution
      final logs = await session.getLogs();

      if (ReturnCode.isSuccess(returnCode)) {

        print("Video Chop Success!");

      } else if (ReturnCode.isCancel(returnCode)) {

        print("Video Chop CANCEL!");

      } else {

        print("Video Chop ERROR!");

      }
    });
    setState(() => _isRecording = false);

    setState(() => _isUploading = true);
    final newFile = File(newFilePath);
    String matchID = widget.currentMatchInProgress!.reference.id;
    String fileName = newFilePath.split('/').last;
    String newPath = 'matches/$matchID/$fileName';

// Create the file metadata
    final metadata = SettableMetadata(contentType: "video/mp4");

// Create a reference to the Firebase Storage bucket
    final storageRef = FirebaseStorage.instance.ref();

// Upload file and metadata to the path 'images/mountains.jpg'
    final uploadTask = storageRef
        .child(newPath)
        .putFile(newFile, metadata);

// Listen for state changes, errors, and completion of the upload.
    uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
      switch (taskSnapshot.state) {
        case TaskState.running:
          final progress =
              100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
          print("Upload is $progress% complete.");
          break;
        case TaskState.paused:
          print("Upload is paused.");
          break;
        case TaskState.canceled:
          print("Upload was canceled");
          break;
        case TaskState.error:
        // Handle unsuccessful uploads
          break;
        case TaskState.success:
          print("Uploaded Succeeded!");
          break;
      }

    });
    uploadedURL = await uploadTask.snapshot.ref.getDownloadURL();
    _isUploading = false;
  }*/

  /* _uploadVideo(String filePath) async {
    setState(() => _isUploading = true);
    final file = File(filePath);
    String matchID = widget.currentMatchInProgress!.reference.id;
    String fileName = filePath.split('/').last;
    String newPath = 'matches/$matchID/$fileName';

// Create the file metadata
    final metadata = SettableMetadata(contentType: "video/mp4");

// Create a reference to the Firebase Storage bucket
    final storageRef = FirebaseStorage.instance.ref();

// Upload file and metadata to the path 'images/mountains.jpg'
    final uploadTask = storageRef
        .child(newPath)
        .putFile(file, metadata);

// Listen for state changes, errors, and completion of the upload.
    uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
      switch (taskSnapshot.state) {
        case TaskState.running:
          final progress =
              100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
          print("Upload is $progress% complete.");
          break;
        case TaskState.paused:
          print("Upload is paused.");
          break;
        case TaskState.canceled:
          print("Upload was canceled");
          break;
        case TaskState.error:
        // Handle unsuccessful uploads
          break;
        case TaskState.success:
          break;
      }
    });

    uploadedURL = await uploadTask.snapshot.ref.getDownloadURL();
    _isUploading = false;
  }*/

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0x00FFFFFF),
      endDrawer: Drawer(
        elevation: 16,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectionArea(
                    child: Text(
                      'Match Options',
                      style: FlutterFlowTheme.of(context).title3,
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectionArea(
                      child: Text(
                        'Replay Last Action',
                        style: FlutterFlowTheme.of(context).subtitle1,
                      )),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 24,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RefMatchRecapEventsWidget(
                        currentMatch: widget.currentMatchInProgress,
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SelectionArea(
                        child: Text(
                          'View Match Timeline',
                          style: FlutterFlowTheme.of(context).subtitle1,
                        )),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectionArea(
                      child: Text(
                        'Undo Last Action',
                        style: FlutterFlowTheme.of(context).subtitle1,
                      )),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 24,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectionArea(
                      child: Text(
                        'Issue Black Card',
                        style: FlutterFlowTheme.of(context).subtitle1,
                      )),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 24,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CameraPreview(_cameraController),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Color(0x80FFFFFF),
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
                              initialTime:
                                  functions.minutesToMS(widget.initStartTime!),
                              getDisplayTime: (value) =>
                                  StopWatchTimer.getDisplayTime(
                                    value,
                                    hours: false,
                                  ),
                              timer: timerController,
                              onChanged: (value, displayTime, shouldUpdate) {
                                timerMilliseconds = value;
                                timerValue = displayTime;
                                if (shouldUpdate) setState(() {});
                              },
                              onEnded: () async {
                                FFAppState().update(() {
                                  FFAppState().isTimerRunning = false;
                                });
                                if (FFAppState().currentPeriod ==
                                    FFAppState().startPeriods) {
                                  FFAppState().update(() {
                                    FFAppState().endOfBout = true;
                                    FFAppState().startStopText = 'END OF BOUT';
                                  });
                                } else {
                                  if (FFAppState().onBreak) {
                                    FFAppState().update(() {
                                      FFAppState().onBreak = false;
                                    });
                                    await Future.delayed(
                                        const Duration(milliseconds: 100));
                                    FFAppState().update(() {
                                      FFAppState().beginNextPer = true;
                                      FFAppState().startStopText = 'NEXT PER';
                                    });
                                  } else {
                                    FFAppState().update(() {
                                      FFAppState().beginBreak = true;
                                      FFAppState().startStopText =
                                          'BEGIN BREAK';
                                    });
                                  }
                                }
                              },
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).title3,
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
                                  FFAppState().update(() {
                                    FFAppState().endOfBout = true;
                                    FFAppState().endOfBoutPopup = true;
                                  });
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0x80FFFFFF),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (FFAppState().isTimerRunning == false)
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().update(() {
                                    FFAppState().isLeftFencerAction = true;
                                    FFAppState().showActions = true;
                                  });
                                  FFAppState().update(() {
                                    FFAppState().currentFencerName =
                                        FFAppState().refLeftName;
                                  });
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
                          Spacer(),
                          if (!FFAppState().showActions)
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (FFAppState().endOfBout) {
                                    FFAppState().update(() {
                                      FFAppState().endOfBoutPopup = true;
                                    });
                                  } else {
                                    if (FFAppState().beginBreak) {
                                      FFAppState().update(() {
                                        FFAppState().beginBreak = false;
                                        FFAppState().onBreak = true;
                                      });
                                      FFAppState().update(() {
                                        FFAppState().timerStartTime =
                                            functions.minutesToMS(
                                                FFAppState().breakDuration);
                                      });
                                      await Future.delayed(
                                          const Duration(milliseconds: 100));
                                      timerController.onExecute
                                          .add(StopWatchExecute.reset);

                                      timerController.onExecute
                                          .add(StopWatchExecute.start);
                                      FFAppState().update(() {
                                        FFAppState().showActions = false;
                                        FFAppState().startStopText = 'ON BREAK';
                                      });
                                    } else {
                                      if (!FFAppState().onBreak) {
                                        if (FFAppState().beginNextPer) {
                                          FFAppState().update(() {
                                            FFAppState().timerStartTime =
                                                functions.minutesToMS(
                                                    FFAppState()
                                                        .startTimePeriod);
                                          });
                                          await Future.delayed(const Duration(
                                              milliseconds: 100));
                                          timerController.onExecute
                                              .add(StopWatchExecute.reset);

                                          FFAppState().update(() {
                                            FFAppState().startStopText =
                                                'START';
                                            FFAppState().currentPeriod =
                                                FFAppState().currentPeriod + 1;
                                          });
                                        } else {
                                          if (FFAppState().isTimerRunning) {
                                            timerController.onExecute.add(
                                              StopWatchExecute.stop,
                                            );

                                            var currFile = await _stopRecording();
                                            uploadURL = await _trimAndUpload(currFile);

                                            FFAppState().update(() {
                                              FFAppState().isTimerRunning =
                                              false;
                                              FFAppState().startStopText =
                                              'START';
                                            });
                                          } else {
                                            timerController.onExecute
                                                .add(StopWatchExecute.start);

                                            _startRecording();

                                            FFAppState().update(() {
                                              FFAppState().isTimerRunning =
                                              true;
                                              FFAppState().startStopText =
                                              'STOP';
                                            });
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
                          Spacer(),
                          if (FFAppState().isTimerRunning == false)
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().update(() {
                                    FFAppState().isLeftFencerAction = false;
                                    FFAppState().showActions = true;
                                  });
                                  FFAppState().update(() {
                                    FFAppState().currentFencerName =
                                        FFAppState().refRightName;
                                  });
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
                    ),
                  ),
                ],
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
                              FlutterFlowDropDown<String>(
                                options: [
                                  'Simple Attack',
                                  'Compound',
                                  'Parry/Riposte',
                                  'Remise',
                                  'Counterattack',
                                  'Point in Line'
                                ],
                                onChanged: (val) async {
                                  setState(() => dropDownValue1 = val);
                                  actionText1 =
                                  await actions.setActionFromDropdown(
                                    dropDownValue1,
                                    dropDownValue2,
                                  );
                                  FFAppState().update(() {
                                    FFAppState().refSecondTextAction =
                                        actionText1!;
                                    FFAppState().isSimultaneous = false;
                                  });

                                  setState(() {});
                                },
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
                              FlutterFlowDropDown<String>(
                                options: ['HITS', 'OFF TARGET'],
                                onChanged: (val) async {
                                  setState(() => dropDownValue2 = val);
                                  actionText2 =
                                  await actions.setActionFromDropdown(
                                    dropDownValue1,
                                    dropDownValue2,
                                  );
                                  FFAppState().update(() {
                                    FFAppState().refSecondTextAction =
                                        actionText2!;
                                  });

                                  setState(() {});
                                },
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
                                  FFAppState().update(() {
                                    FFAppState().isSimultaneous = true;
                                    FFAppState().nonAttackLabel =
                                        'Simultaneous';
                                  });
                                  FFAppState().update(() {
                                    FFAppState().refSecondTextAction =
                                        'Attacks are Simultaneous';
                                    FFAppState().refIsHit = false;
                                  });
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
                                  FFAppState().update(() {
                                    FFAppState().nonAttackLabel = 'Pause';
                                    FFAppState().refSecondTextAction =
                                        ' called halt';
                                  });
                                  FFAppState().update(() {
                                    FFAppState().isSimultaneous = false;
                                    FFAppState().refIsHit = false;
                                  });
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
                                  FFAppState().update(() {
                                    FFAppState().refSecondTextAction =
                                        'is awarded a Yellow Card';
                                    FFAppState().nonAttackLabel = 'Yellow Card';
                                  });
                                  FFAppState().update(() {
                                    FFAppState().isSimultaneous = false;
                                    FFAppState().refIsHit = false;
                                  });
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
                                  FFAppState().update(() {
                                    FFAppState().refSecondTextAction =
                                        'is awarded a Red Card';
                                    FFAppState().nonAttackLabel = 'Red Card';
                                  });
                                  FFAppState().update(() {
                                    FFAppState().isSimultaneous = false;
                                    FFAppState().refIsHit = false;
                                  });
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
                                    if(!_isUploading) {
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
                                                  !FFAppState().refIsHit,
                                                  FFAppState()
                                                      .nonAttackLabel),
                                              videoURL: uploadURL,
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
                                      FFAppState().update(() {
                                        FFAppState().showActions = false;
                                      });
                                    }
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
                                    FFAppState().update(() {
                                      FFAppState().showActions = false;
                                    });
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
                                FFAppState().update(() {
                                  FFAppState().endOfBout = false;
                                  FFAppState().endOfBoutPopup = false;
                                });
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
            ],
          ),
        ),
      ),
    );
  }
}
