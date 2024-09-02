import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _refereeweaponselect = '';
  String get refereeweaponselect => _refereeweaponselect;
  set refereeweaponselect(String value) {
    _refereeweaponselect = value;
  }

  bool _isRightFencer = false;
  bool get isRightFencer => _isRightFencer;
  set isRightFencer(bool value) {
    _isRightFencer = value;
  }

  DocumentReference? _scannedFencerRef =
      FirebaseFirestore.instance.doc('/users/2');
  DocumentReference? get scannedFencerRef => _scannedFencerRef;
  set scannedFencerRef(DocumentReference? value) {
    _scannedFencerRef = value;
  }

  String _currentFencerName = '';
  String get currentFencerName => _currentFencerName;
  set currentFencerName(String value) {
    _currentFencerName = value;
  }

  String _currentFencerPicURL = '';
  String get currentFencerPicURL => _currentFencerPicURL;
  set currentFencerPicURL(String value) {
    _currentFencerPicURL = value;
  }

  DocumentReference? _leftFencerRef =
      FirebaseFirestore.instance.doc('/users/2');
  DocumentReference? get leftFencerRef => _leftFencerRef;
  set leftFencerRef(DocumentReference? value) {
    _leftFencerRef = value;
  }

  DocumentReference? _rightFencerRef =
      FirebaseFirestore.instance.doc('/users/2');
  DocumentReference? get rightFencerRef => _rightFencerRef;
  set rightFencerRef(DocumentReference? value) {
    _rightFencerRef = value;
  }

  String _refLeftName = 'Left Fencer';
  String get refLeftName => _refLeftName;
  set refLeftName(String value) {
    _refLeftName = value;
  }

  String _refRightName = 'Right Fencer';
  String get refRightName => _refRightName;
  set refRightName(String value) {
    _refRightName = value;
  }

  String _refLeftPhoto = '';
  String get refLeftPhoto => _refLeftPhoto;
  set refLeftPhoto(String value) {
    _refLeftPhoto = value;
  }

  String _refRightPhoto = '';
  String get refRightPhoto => _refRightPhoto;
  set refRightPhoto(String value) {
    _refRightPhoto = value;
  }

  bool _isTimerRunning = false;
  bool get isTimerRunning => _isTimerRunning;
  set isTimerRunning(bool value) {
    _isTimerRunning = value;
  }

  int _refLeftScore = 0;
  int get refLeftScore => _refLeftScore;
  set refLeftScore(int value) {
    _refLeftScore = value;
  }

  int _refRightScore = 0;
  int get refRightScore => _refRightScore;
  set refRightScore(int value) {
    _refRightScore = value;
  }

  bool _isLeftFencerAction = true;
  bool get isLeftFencerAction => _isLeftFencerAction;
  set isLeftFencerAction(bool value) {
    _isLeftFencerAction = value;
  }

  bool _showActions = false;
  bool get showActions => _showActions;
  set showActions(bool value) {
    _showActions = value;
  }

  String _startStopText = 'START';
  String get startStopText => _startStopText;
  set startStopText(String value) {
    _startStopText = value;
  }

  int _currentPeriod = 1;
  int get currentPeriod => _currentPeriod;
  set currentPeriod(int value) {
    _currentPeriod = value;
  }

  bool _endOfBout = false;
  bool get endOfBout => _endOfBout;
  set endOfBout(bool value) {
    _endOfBout = value;
  }

  bool _onBreak = false;
  bool get onBreak => _onBreak;
  set onBreak(bool value) {
    _onBreak = value;
  }

  int _timerStartTime = 60000;
  int get timerStartTime => _timerStartTime;
  set timerStartTime(int value) {
    _timerStartTime = value;
  }

  int _breakDuration = 1;
  int get breakDuration => _breakDuration;
  set breakDuration(int value) {
    _breakDuration = value;
  }

  bool _beginNextPer = false;
  bool get beginNextPer => _beginNextPer;
  set beginNextPer(bool value) {
    _beginNextPer = value;
  }

  bool _beginBreak = false;
  bool get beginBreak => _beginBreak;
  set beginBreak(bool value) {
    _beginBreak = value;
  }

  List<DocumentReference> _refFencers = [];
  List<DocumentReference> get refFencers => _refFencers;
  set refFencers(List<DocumentReference> value) {
    _refFencers = value;
  }

  void addToRefFencers(DocumentReference value) {
    refFencers.add(value);
  }

  void removeFromRefFencers(DocumentReference value) {
    refFencers.remove(value);
  }

  void removeAtIndexFromRefFencers(int index) {
    refFencers.removeAt(index);
  }

  void updateRefFencersAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    refFencers[index] = updateFn(_refFencers[index]);
  }

  void insertAtIndexInRefFencers(int index, DocumentReference value) {
    refFencers.insert(index, value);
  }

  bool _endOfBoutPopup = false;
  bool get endOfBoutPopup => _endOfBoutPopup;
  set endOfBoutPopup(bool value) {
    _endOfBoutPopup = value;
  }

  DocumentReference? _refereeReference =
      FirebaseFirestore.instance.doc('/users/0');
  DocumentReference? get refereeReference => _refereeReference;
  set refereeReference(DocumentReference? value) {
    _refereeReference = value;
  }

  List<dynamic> _currentMatchEvents = [];
  List<dynamic> get currentMatchEvents => _currentMatchEvents;
  set currentMatchEvents(List<dynamic> value) {
    _currentMatchEvents = value;
  }

  void addToCurrentMatchEvents(dynamic value) {
    currentMatchEvents.add(value);
  }

  void removeFromCurrentMatchEvents(dynamic value) {
    currentMatchEvents.remove(value);
  }

  void removeAtIndexFromCurrentMatchEvents(int index) {
    currentMatchEvents.removeAt(index);
  }

  void updateCurrentMatchEventsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    currentMatchEvents[index] = updateFn(_currentMatchEvents[index]);
  }

  void insertAtIndexInCurrentMatchEvents(int index, dynamic value) {
    currentMatchEvents.insert(index, value);
  }

  String _nonAttackLabel = '';
  String get nonAttackLabel => _nonAttackLabel;
  set nonAttackLabel(String value) {
    _nonAttackLabel = value;
  }

  String _refSecondTextAction = '';
  String get refSecondTextAction => _refSecondTextAction;
  set refSecondTextAction(String value) {
    _refSecondTextAction = value;
  }

  bool _isSimultaneous = false;
  bool get isSimultaneous => _isSimultaneous;
  set isSimultaneous(bool value) {
    _isSimultaneous = value;
  }

  bool _refIsHit = false;
  bool get refIsHit => _refIsHit;
  set refIsHit(bool value) {
    _refIsHit = value;
  }

  String _curentActionVideoURL = '';
  String get curentActionVideoURL => _curentActionVideoURL;
  set curentActionVideoURL(String value) {
    _curentActionVideoURL = value;
  }

  String _refereemodeselect = '';
  String get refereemodeselect => _refereemodeselect;
  set refereemodeselect(String value) {
    _refereemodeselect = value;
  }

  DocumentReference? _SelectFencerReference =
      FirebaseFirestore.instance.doc('/users/2');
  DocumentReference? get SelectFencerReference => _SelectFencerReference;
  set SelectFencerReference(DocumentReference? value) {
    _SelectFencerReference = value;
  }

  bool _isWeaponSelected = false;
  bool get isWeaponSelected => _isWeaponSelected;
  set isWeaponSelected(bool value) {
    _isWeaponSelected = value;
  }

  int _snapshotCounter = 0;
  int get snapshotCounter => _snapshotCounter;
  set snapshotCounter(int value) {
    _snapshotCounter = value;
  }
}
