import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
      _sum = prefs.getDouble('ff_sum') ?? _sum;
    });
    _safeInit(() {
      _myAddress = prefs.getString('ff_myAddress') ?? _myAddress;
    });
    _safeInit(() {
      _inPage = prefs.getStringList('ff_inPage') ?? _inPage;
    });
    _safeInit(() {
      _userRating = prefs.getDouble('ff_userRating') ?? _userRating;
    });
    _safeInit(() {
      _alwaysTrue = prefs.getBool('ff_alwaysTrue') ?? _alwaysTrue;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isShowFullList = false;
  bool get isShowFullList => _isShowFullList;
  set isShowFullList(bool _value) {
    _isShowFullList = _value;
  }

  double _sum = 0;
  double get sum => _sum;
  set sum(double _value) {
    _sum = _value;
    prefs.setDouble('ff_sum', _value);
  }

  int _increment = 0;
  int get increment => _increment;
  set increment(int _value) {
    _increment = _value;
  }

  double _totalpayment = 0;
  double get totalpayment => _totalpayment;
  set totalpayment(double _value) {
    _totalpayment = _value;
  }

  String _name = '';
  String get name => _name;
  set name(String _value) {
    _name = _value;
  }

  String _quantity = '';
  String get quantity => _quantity;
  set quantity(String _value) {
    _quantity = _value;
  }

  double _shipfee = 0;
  double get shipfee => _shipfee;
  set shipfee(double _value) {
    _shipfee = _value;
  }

  double _price = 0;
  double get price => _price;
  set price(double _value) {
    _price = _value;
  }

  String _myAddress = '';
  String get myAddress => _myAddress;
  set myAddress(String _value) {
    _myAddress = _value;
    prefs.setString('ff_myAddress', _value);
  }

  List<String> _menuItems = [
    'Home',
    'Shops',
    'Message',
    'Notification',
    'Profile'
  ];
  List<String> get menuItems => _menuItems;
  set menuItems(List<String> _value) {
    _menuItems = _value;
  }

  void addToMenuItems(String _value) {
    _menuItems.add(_value);
  }

  void removeFromMenuItems(String _value) {
    _menuItems.remove(_value);
  }

  void removeAtIndexFromMenuItems(int _index) {
    _menuItems.removeAt(_index);
  }

  void updateMenuItemsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _menuItems[_index] = updateFn(_menuItems[_index]);
  }

  void insertAtIndexInMenuItems(int _index, String _value) {
    _menuItems.insert(_index, _value);
  }

  String _menuActiveitem = 'Home';
  String get menuActiveitem => _menuActiveitem;
  set menuActiveitem(String _value) {
    _menuActiveitem = _value;
  }

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool _value) {
    _isLoggedIn = _value;
  }

  List<String> _inPage = ['Home', 'Shop', 'Message', 'Notification', 'Profile'];
  List<String> get inPage => _inPage;
  set inPage(List<String> _value) {
    _inPage = _value;
    prefs.setStringList('ff_inPage', _value);
  }

  void addToInPage(String _value) {
    _inPage.add(_value);
    prefs.setStringList('ff_inPage', _inPage);
  }

  void removeFromInPage(String _value) {
    _inPage.remove(_value);
    prefs.setStringList('ff_inPage', _inPage);
  }

  void removeAtIndexFromInPage(int _index) {
    _inPage.removeAt(_index);
    prefs.setStringList('ff_inPage', _inPage);
  }

  void updateInPageAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _inPage[_index] = updateFn(_inPage[_index]);
    prefs.setStringList('ff_inPage', _inPage);
  }

  void insertAtIndexInInPage(int _index, String _value) {
    _inPage.insert(_index, _value);
    prefs.setStringList('ff_inPage', _inPage);
  }

  double _userRating = 0;
  double get userRating => _userRating;
  set userRating(double _value) {
    _userRating = _value;
    prefs.setDouble('ff_userRating', _value);
  }

  bool _alwaysTrue = true;
  bool get alwaysTrue => _alwaysTrue;
  set alwaysTrue(bool _value) {
    _alwaysTrue = _value;
    prefs.setBool('ff_alwaysTrue', _value);
  }

  final _menuBadgeManager = FutureRequestManager<int>();
  Future<int> menuBadge({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _menuBadgeManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMenuBadgeCache() => _menuBadgeManager.clear();
  void clearMenuBadgeCacheKey(String? uniqueKey) =>
      _menuBadgeManager.clearRequest(uniqueKey);

  final _prodRateManager = StreamRequestManager<List<ReviewsRecord>>();
  Stream<List<ReviewsRecord>> prodRate({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ReviewsRecord>> Function() requestFn,
  }) =>
      _prodRateManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProdRateCache() => _prodRateManager.clear();
  void clearProdRateCacheKey(String? uniqueKey) =>
      _prodRateManager.clearRequest(uniqueKey);

  final _cartBadgeManager = FutureRequestManager<int>();
  Future<int> cartBadge({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _cartBadgeManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCartBadgeCache() => _cartBadgeManager.clear();
  void clearCartBadgeCacheKey(String? uniqueKey) =>
      _cartBadgeManager.clearRequest(uniqueKey);
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
