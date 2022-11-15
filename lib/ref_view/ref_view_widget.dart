import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:camera/camera.dart';
import 'package:ffmpeg_kit_flutter_https_gpl/return_code.dart';
import 'package:ffmpeg_kit_flutter_https_gpl/ffmpeg_kit.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import '../flutter_flow/upload_media.dart';

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
  StopWatchTimer? timerController;
  String? timerValue;
  int? timerMilliseconds;
  String? actionText1;
  String? dropDownValue1;
  String? actionText2;
  String? dropDownValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isLoading = true;
  bool _isRecording = false;
  bool _isUploading = false;
  late CameraController _cameraController;
  String? uploadedURL;
  UploadTask? uploadTask;

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
    timerController?.dispose();
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
    final backCamera = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.back);
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

  _stopRecording() async {
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
      print(logs);

      if (ReturnCode.isSuccess(returnCode)) {

        print("Success!");

      } else if (ReturnCode.isCancel(returnCode)) {

        print("CANCEL!");

      } else {

        print("ERROR!");

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
    uploadTask = storageRef
        .child(newPath)
        .putFile(newFile, metadata);

// Listen for state changes, errors, and completion of the upload.
    uploadTask!.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
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
    _isUploading = false;
  }

//   _uploadVideo(String filePath) async {
//     setState(() => _isUploading = true);
//     final file = File(filePath);
//     String matchID = widget.currentMatchInProgress!.reference.id;
//     String fileName = filePath.split('/').last;
//     String newPath = 'matches/$matchID/$fileName';
//
// // Create the file metadata
//     final metadata = SettableMetadata(contentType: "video/mp4");
//
// // Create a reference to the Firebase Storage bucket
//     final storageRef = FirebaseStorage.instance.ref();
//
// // Upload file and metadata to the path 'images/mountains.jpg'
//     final uploadTask = storageRef
//         .child(newPath)
//         .putFile(file, metadata);
//
// // Listen for state changes, errors, and completion of the upload.
//     uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
//       switch (taskSnapshot.state) {
//         case TaskState.running:
//           final progress =
//               100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
//           print("Upload is $progress% complete.");
//           break;
//         case TaskState.paused:
//           print("Upload is paused.");
//           break;
//         case TaskState.canceled:
//           print("Upload was canceled");
//           break;
//         case TaskState.error:
//         // Handle unsuccessful uploads
//           break;
//         case TaskState.success:
//           break;
//       }
//     });
//
//     uploadedURL = await uploadTask.snapshot.ref.getDownloadURL();
//     _isUploading = false;
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0x00FFFFFF),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
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
                      color: Color(0x1AF1F4F8),
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
                              timerValue: timerValue ??=
                                  StopWatchTimer.getDisplayTime(
                                timerMilliseconds ??= functions
                                    .minutesToMS(widget.initStartTime!),
                                hours: false,
                                minute: true,
                                second: true,
                                milliSecond: true,
                              ),
                              timer: timerController ??= StopWatchTimer(
                                mode: StopWatchMode.countDown,
                                presetMillisecond: timerMilliseconds ??=
                                    functions
                                        .minutesToMS(widget.initStartTime!),
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
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).title3,
                              onEnded: () async {
                                setState(
                                    () => FFAppState().isTimerRunning = false);
                                if (FFAppState().currentPeriod ==
                                    FFAppState().startPeriods) {
                                  setState(() => FFAppState().endOfBout = true);
                                  setState(() => FFAppState().startStopText =
                                      'END OF BOUT');
                                } else {
                                  if (FFAppState().onBreak) {
                                    setState(
                                        () => FFAppState().onBreak = false);
                                    await Future.delayed(
                                        const Duration(milliseconds: 100));
                                    setState(
                                        () => FFAppState().beginNextPer = true);
                                    setState(() => FFAppState().startStopText =
                                        'NEXT PER');
                                  } else {
                                    setState(
                                        () => FFAppState().beginBreak = true);
                                    setState(() => FFAppState().startStopText =
                                        'BEGIN BREAK');
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
                                  setState(() => FFAppState().endOfBout = true);
                                  setState(
                                      () => FFAppState().endOfBoutPopup = true);
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
                      color: Color(0x1AF1F4F8),
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
                                  setState(() =>
                                      FFAppState().isLeftFencerAction = true);
                                  setState(
                                      () => FFAppState().showActions = true);
                                  setState(() =>
                                      FFAppState().currentFencerName =
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
                          Spacer(),
                          if (!FFAppState().showActions)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (FFAppState().endOfBout) {
                                    setState(() =>
                                        FFAppState().endOfBoutPopup = true);
                                  } else {
                                    if (FFAppState().beginBreak) {
                                      setState(() =>
                                          FFAppState().beginBreak = false);
                                      setState(
                                          () => FFAppState().onBreak = true);
                                      setState(() =>
                                          FFAppState().timerStartTime =
                                              functions.minutesToMS(
                                                  FFAppState().breakDuration));
                                      await Future.delayed(
                                          const Duration(milliseconds: 100));
                                      timerController?.onExecute.add(
                                        StopWatchExecute.reset,
                                      );

                                      timerController?.onExecute.add(
                                        StopWatchExecute.start,
                                      );

                                      setState(() =>
                                          FFAppState().showActions = false);
                                      setState(() => FFAppState()
                                          .startStopText = 'ON BREAK');
                                    } else {
                                      if (!FFAppState().onBreak) {
                                        if (FFAppState().beginNextPer) {
                                          setState(() => FFAppState()
                                                  .timerStartTime =
                                              functions.minutesToMS(FFAppState()
                                                  .startTimePeriod));
                                          await Future.delayed(const Duration(
                                              milliseconds: 100));
                                          timerController?.onExecute.add(
                                            StopWatchExecute.reset,
                                          );

                                          setState(() => FFAppState()
                                              .startStopText = 'START');
                                          setState(() => FFAppState()
                                                  .currentPeriod =
                                              FFAppState().currentPeriod + 1);
                                        } else {
                                          if (FFAppState().isTimerRunning) {
                                            timerController?.onExecute.add(
                                              StopWatchExecute.stop,
                                            );

                                            _stopRecording();

                                            setState(() => FFAppState()
                                                .isTimerRunning = false);
                                            setState(() => FFAppState()
                                                .startStopText = 'START');
                                          } else {

                                            timerController?.onExecute.add(
                                              StopWatchExecute.start,
                                            );
                                            _startRecording();

                                            setState(() => FFAppState()
                                                .isTimerRunning = true);
                                            setState(() => FFAppState()
                                                .startStopText = 'STOP');
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
                                  setState(() =>
                                      FFAppState().isLeftFencerAction = false);
                                  setState(
                                      () => FFAppState().showActions = true);
                                  setState(() =>
                                      FFAppState().currentFencerName =
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
                    ),
                  ),
                ],
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
                                setState(() => FFAppState().endOfBout = false);
                                setState(
                                    () => FFAppState().endOfBoutPopup = false);
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
                              FlutterFlowDropDown(
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
                                  setState(() => FFAppState()
                                      .refSecondTextAction = actionText1!);
                                  setState(() =>
                                      FFAppState().isSimultaneous = false);

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
                              FlutterFlowDropDown(
                                options: ['HITS', 'OFF TARGET'],
                                onChanged: (val) async {
                                  setState(() => dropDownValue2 = val);
                                  actionText2 =
                                      await actions.setActionFromDropdown(
                                    dropDownValue1,
                                    dropDownValue2,
                                  );
                                  setState(() => FFAppState()
                                      .refSecondTextAction = actionText2!);
                                  setState(() => FFAppState().refIsHit = true);
                                  setState(() =>
                                      FFAppState().isSimultaneous = false);

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
                                  setState(
                                      () => FFAppState().isSimultaneous = true);
                                  setState(() => FFAppState().nonAttackLabel =
                                      'Simultaneous');
                                  setState(() =>
                                      FFAppState().refSecondTextAction =
                                          'Attacks are Simultaneous');
                                  setState(() => FFAppState().refIsHit = false);
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
                                  setState(() =>
                                      FFAppState().nonAttackLabel = 'Pause');
                                  setState(() => FFAppState()
                                      .refSecondTextAction = ' called halt');
                                  setState(() =>
                                      FFAppState().isSimultaneous = false);
                                  setState(() => FFAppState().refIsHit = false);
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
                                  setState(() =>
                                      FFAppState().refSecondTextAction =
                                          'is awarded a Yellow Card');
                                  setState(() => FFAppState().nonAttackLabel =
                                      'Yellow Card');
                                  setState(() =>
                                      FFAppState().isSimultaneous = false);
                                  setState(() => FFAppState().refIsHit = false);
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
                                  setState(() =>
                                      FFAppState().refSecondTextAction =
                                          'is awarded a Red Card');
                                  setState(() =>
                                      FFAppState().nonAttackLabel = 'Red Card');
                                  setState(() =>
                                      FFAppState().isSimultaneous = false);
                                  setState(() => FFAppState().refIsHit = false);
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

                                      uploadedURL = await uploadTask!.snapshot.ref.getDownloadURL();

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
                                                  dropDownValue2,
                                                  FFAppState()
                                                      .nonAttackLabel),
                                              videoURL: uploadedURL,
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
                                      setState(
                                              () =>
                                          FFAppState().showActions = false);
                                    }
                                    else {
                                      showUploadMessage(
                                        context,
                                        'Please wait for video to upload...',
                                        showLoading: true,
                                      );
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
                                    setState(
                                        () => FFAppState().showActions = false);
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
            ],
          ),
        ),
      ),
    );
  }
}
