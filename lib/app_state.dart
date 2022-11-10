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

  DocumentReference? scannedFencerRef =
      FirebaseFirestore.instance.doc('/users/2');

  String currentFencerName = '';

  String currentFencerPicURL = '';

  int startPeriods = 1;

  int startTotalTouches = 5;

  int startTimePeriod = 1;

  DocumentReference? leftFencerRef = FirebaseFirestore.instance.doc('/users/2');

  DocumentReference? rightFencerRef =
      FirebaseFirestore.instance.doc('/users/2');

  String refLeftName = 'Left Fencer';

  String refRightName = 'Right Fencer';

  String refLeftPhoto = '';

  String refRightPhoto = '';

  bool isTimerRunning = false;

  int refLeftScore = 0;

  int refRightScore = 0;

  bool isLeftFencerAction = true;

  bool showActions = false;

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

  bool refIsHit = false;

  String tempVideoURL =
      'https://firebasestorage.googleapis.com/v0/b/universalfencingleague.appspot.com/o/matches%2F7gV34Hk9G3BXNKAu8GQ3%2FREC8439795998652433271.mp4-s?alt=media&token=56c0477b-8eb6-4e06-a539-3816f081bcda';
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
