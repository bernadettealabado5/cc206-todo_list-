import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_com/flutter_com_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _ondayselected = prefs
              .getStringList('ff_ondayselected')
              ?.map((path) => path.ref)
              .toList() ??
          _ondayselected;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? _value) {
    _selectedDate = _value;
  }

  List<DocumentReference> _ondayselected = [];
  List<DocumentReference> get ondayselected => _ondayselected;
  set ondayselected(List<DocumentReference> _value) {
    _ondayselected = _value;
    prefs.setStringList('ff_ondayselected', _value.map((x) => x.path).toList());
  }

  void addToOndayselected(DocumentReference _value) {
    _ondayselected.add(_value);
    prefs.setStringList(
        'ff_ondayselected', _ondayselected.map((x) => x.path).toList());
  }

  void removeFromOndayselected(DocumentReference _value) {
    _ondayselected.remove(_value);
    prefs.setStringList(
        'ff_ondayselected', _ondayselected.map((x) => x.path).toList());
  }

  void removeAtIndexFromOndayselected(int _index) {
    _ondayselected.removeAt(_index);
    prefs.setStringList(
        'ff_ondayselected', _ondayselected.map((x) => x.path).toList());
  }

  void updateOndayselectedAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _ondayselected[_index] = updateFn(_ondayselected[_index]);
    prefs.setStringList(
        'ff_ondayselected', _ondayselected.map((x) => x.path).toList());
  }

  void insertAtIndexInOndayselected(int _index, DocumentReference _value) {
    _ondayselected.insert(_index, _value);
    prefs.setStringList(
        'ff_ondayselected', _ondayselected.map((x) => x.path).toList());
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

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
