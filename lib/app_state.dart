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

  String leftFencerName = '';

  String rightFencerName = '';

  String leftFencerPic;

  String rightFencerPic;
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
