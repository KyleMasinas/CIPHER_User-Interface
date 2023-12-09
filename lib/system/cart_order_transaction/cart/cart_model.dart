import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/system/menu/dropdown_menu/dropdown_menu_widget.dart';
import '/system/welcome/home_button/home_button_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'cart_widget.dart' show CartWidget;
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  Local state fields for this page.

  int loopCounter = 0;

  bool check = false;

  double total = 0.0;

  bool more = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HomeButton component.
  late HomeButtonModel homeButtonModel;
  // State field(s) for Checkbox widget.

  Map<CartRecord, bool> checkboxValueMap = {};
  List<CartRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for isFood widget.

  Map<CartRecord, bool> isFoodValueMap = {};
  List<CartRecord> get isFoodCheckedItems =>
      isFoodValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for isDrink widget.

  Map<CartRecord, bool> isDrinkValueMap = {};
  List<CartRecord> get isDrinkCheckedItems =>
      isDrinkValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for isMerc widget.

  Map<CartRecord, bool> isMercValueMap = {};
  List<CartRecord> get isMercCheckedItems =>
      isMercValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for IsShirt widget.

  Map<CartRecord, bool> isShirtValueMap = {};
  List<CartRecord> get isShirtCheckedItems =>
      isShirtValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for IsShort widget.

  Map<CartRecord, bool> isShortValueMap = {};
  List<CartRecord> get isShortCheckedItems =>
      isShortValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for isItems widget.

  Map<CartRecord, bool> isItemsValueMap = {};
  List<CartRecord> get isItemsCheckedItems =>
      isItemsValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for others widget.

  Map<CartRecord, bool> othersValueMap = {};
  List<CartRecord> get othersCheckedItems =>
      othersValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for small widget.

  Map<CartRecord, bool> smallValueMap = {};
  List<CartRecord> get smallCheckedItems =>
      smallValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for medium widget.

  Map<CartRecord, bool> mediumValueMap = {};
  List<CartRecord> get mediumCheckedItems =>
      mediumValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for large widget.

  Map<CartRecord, bool> largeValueMap = {};
  List<CartRecord> get largeCheckedItems =>
      largeValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for extralarge widget.

  Map<CartRecord, bool> extralargeValueMap = {};
  List<CartRecord> get extralargeCheckedItems => extralargeValueMap.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    homeButtonModel = createModel(context, () => HomeButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    homeButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
