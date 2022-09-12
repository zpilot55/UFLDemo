import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

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

  SharedPreferences prefs;

  String refereeweaponselect = '';

  bool isRightFencer = false;

  DocumentReference scannedFencerRef;

  String currentFencerName = '';

  String currentFencerPicURL;

  int startPeriods = 1;

  int startTotalTouches = 5;

  int startTimePeriod = 3;

  DocumentReference leftFencerRef;

  DocumentReference rightFencerRef;

  String refLeftName = '';

  String refRightName = '';

  String refLeftPhoto;

  String refRightPhoto;

  bool isTimerRunning = false;

  int refLeftScore = 0;

  int refRightScore = 0;

  bool isLeftFencerAction = true;

  bool showActions = false;

  bool isActionArrives = false;
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
