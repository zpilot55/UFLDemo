import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
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

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _refereeweaponselect = '';
  String get refereeweaponselect => _refereeweaponselect;
  set refereeweaponselect(String _value) {
    _refereeweaponselect = _value;
  }

  bool _isRightFencer = false;
  bool get isRightFencer => _isRightFencer;
  set isRightFencer(bool _value) {
    _isRightFencer = _value;
  }

  DocumentReference? _scannedFencerRef =
      FirebaseFirestore.instance.doc('/users/2');
  DocumentReference? get scannedFencerRef => _scannedFencerRef;
  set scannedFencerRef(DocumentReference? _value) {
    _scannedFencerRef = _value;
  }

  String _currentFencerName = '';
  String get currentFencerName => _currentFencerName;
  set currentFencerName(String _value) {
    _currentFencerName = _value;
  }

  String _currentFencerPicURL = '';
  String get currentFencerPicURL => _currentFencerPicURL;
  set currentFencerPicURL(String _value) {
    _currentFencerPicURL = _value;
  }

  DocumentReference? _leftFencerRef =
      FirebaseFirestore.instance.doc('/users/2');
  DocumentReference? get leftFencerRef => _leftFencerRef;
  set leftFencerRef(DocumentReference? _value) {
    _leftFencerRef = _value;
  }

  DocumentReference? _rightFencerRef =
      FirebaseFirestore.instance.doc('/users/2');
  DocumentReference? get rightFencerRef => _rightFencerRef;
  set rightFencerRef(DocumentReference? _value) {
    _rightFencerRef = _value;
  }

  String _refLeftName = 'Left Fencer';
  String get refLeftName => _refLeftName;
  set refLeftName(String _value) {
    _refLeftName = _value;
  }

  String _refRightName = 'Right Fencer';
  String get refRightName => _refRightName;
  set refRightName(String _value) {
    _refRightName = _value;
  }

  String _refLeftPhoto = '';
  String get refLeftPhoto => _refLeftPhoto;
  set refLeftPhoto(String _value) {
    _refLeftPhoto = _value;
  }

  String _refRightPhoto = '';
  String get refRightPhoto => _refRightPhoto;
  set refRightPhoto(String _value) {
    _refRightPhoto = _value;
  }

  bool _isTimerRunning = false;
  bool get isTimerRunning => _isTimerRunning;
  set isTimerRunning(bool _value) {
    _isTimerRunning = _value;
  }

  int _refLeftScore = 0;
  int get refLeftScore => _refLeftScore;
  set refLeftScore(int _value) {
    _refLeftScore = _value;
  }

  int _refRightScore = 0;
  int get refRightScore => _refRightScore;
  set refRightScore(int _value) {
    _refRightScore = _value;
  }

  bool _isLeftFencerAction = true;
  bool get isLeftFencerAction => _isLeftFencerAction;
  set isLeftFencerAction(bool _value) {
    _isLeftFencerAction = _value;
  }

  bool _showActions = false;
  bool get showActions => _showActions;
  set showActions(bool _value) {
    _showActions = _value;
  }

  String _startStopText = 'START';
  String get startStopText => _startStopText;
  set startStopText(String _value) {
    _startStopText = _value;
  }

  int _currentPeriod = 1;
  int get currentPeriod => _currentPeriod;
  set currentPeriod(int _value) {
    _currentPeriod = _value;
  }

  bool _endOfBout = false;
  bool get endOfBout => _endOfBout;
  set endOfBout(bool _value) {
    _endOfBout = _value;
  }

  bool _onBreak = false;
  bool get onBreak => _onBreak;
  set onBreak(bool _value) {
    _onBreak = _value;
  }

  int _timerStartTime = 60000;
  int get timerStartTime => _timerStartTime;
  set timerStartTime(int _value) {
    _timerStartTime = _value;
  }

  int _breakDuration = 10000;
  int get breakDuration => _breakDuration;
  set breakDuration(int _value) {
    _breakDuration = _value;
  }

  bool _beginNextPer = false;
  bool get beginNextPer => _beginNextPer;
  set beginNextPer(bool _value) {
    _beginNextPer = _value;
  }

  bool _beginBreak = false;
  bool get beginBreak => _beginBreak;
  set beginBreak(bool _value) {
    _beginBreak = _value;
  }

  List<DocumentReference> _refFencers = [];
  List<DocumentReference> get refFencers => _refFencers;
  set refFencers(List<DocumentReference> _value) {
    _refFencers = _value;
  }

  void addToRefFencers(DocumentReference _value) {
    _refFencers.add(_value);
  }

  void removeFromRefFencers(DocumentReference _value) {
    _refFencers.remove(_value);
  }

  bool _endOfBoutPopup = false;
  bool get endOfBoutPopup => _endOfBoutPopup;
  set endOfBoutPopup(bool _value) {
    _endOfBoutPopup = _value;
  }

  DocumentReference? _refereeReference =
      FirebaseFirestore.instance.doc('/users/0');
  DocumentReference? get refereeReference => _refereeReference;
  set refereeReference(DocumentReference? _value) {
    _refereeReference = _value;
  }

  List<dynamic> _currentMatchEvents = [];
  List<dynamic> get currentMatchEvents => _currentMatchEvents;
  set currentMatchEvents(List<dynamic> _value) {
    _currentMatchEvents = _value;
  }

  void addToCurrentMatchEvents(dynamic _value) {
    _currentMatchEvents.add(_value);
  }

  void removeFromCurrentMatchEvents(dynamic _value) {
    _currentMatchEvents.remove(_value);
  }

  String _nonAttackLabel = '';
  String get nonAttackLabel => _nonAttackLabel;
  set nonAttackLabel(String _value) {
    _nonAttackLabel = _value;
  }

  String _refSecondTextAction = '';
  String get refSecondTextAction => _refSecondTextAction;
  set refSecondTextAction(String _value) {
    _refSecondTextAction = _value;
  }

  bool _isSimultaneous = false;
  bool get isSimultaneous => _isSimultaneous;
  set isSimultaneous(bool _value) {
    _isSimultaneous = _value;
  }

  bool _refIsHit = false;
  bool get refIsHit => _refIsHit;
  set refIsHit(bool _value) {
    _refIsHit = _value;
  }

  String _curentActionVideoURL = '';
  String get curentActionVideoURL => _curentActionVideoURL;
  set curentActionVideoURL(String _value) {
    _curentActionVideoURL = _value;
  }

  String _refereemodeselect = '';
  String get refereemodeselect => _refereemodeselect;
  set refereemodeselect(String _value) {
    _refereemodeselect = _value;
  }

  DocumentReference? _SelectFencerReference =
      FirebaseFirestore.instance.doc('/users/2');
  DocumentReference? get SelectFencerReference => _SelectFencerReference;
  set SelectFencerReference(DocumentReference? _value) {
    _SelectFencerReference = _value;
  }

  bool _isWeaponSelected = false;
  bool get isWeaponSelected => _isWeaponSelected;
  set isWeaponSelected(bool _value) {
    _isWeaponSelected = _value;
  }
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
