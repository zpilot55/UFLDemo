import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  late SharedPreferences prefs;

  String refereeweaponselect = '';

  bool isRightFencer = false;

  DocumentReference? scannedFencerRef;

  String currentFencerName = '';

  String currentFencerPicURL = '';

  int startPeriods = 1;

  int startTotalTouches = 5;

  int startTimePeriod = 1;

  DocumentReference? leftFencerRef;

  DocumentReference? rightFencerRef;

  String refLeftName = 'Left Fencer';

  String refRightName = 'Right Fencer';

  String refLeftPhoto = '';

  String refRightPhoto = '';

  bool isTimerRunning = false;

  int refLeftScore = 0;

  int refRightScore = 0;

  bool isLeftFencerAction = true;

  bool showActions = false;

  bool isActionArrives = false;

  String startStopText = 'START';

  int currentPeriod = 1;

  bool endOfBout = false;

  bool onBreak = false;

  int timerStartTime = 60000;

  int breakDuration = 10000;

  bool beginNextPer = false;

  bool beginBreak = false;

  List<DocumentReference> refFencers = [];

  bool endOfBoutPopup = false;

  DocumentReference? refereeReference =
      FirebaseFirestore.instance.doc('/users/0');

  List<dynamic> currentMatchEvents = [];

  String nonAttackLabel = '';

  String refSecondTextAction = '';

  bool isSimultaneous = false;
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
