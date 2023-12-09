import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/system/menu/dropdown_menu/dropdown_menu_widget.dart';
import 'order_history_widget.dart' show OrderHistoryWidget;
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class OrderHistoryModel extends FlutterFlowModel<OrderHistoryWidget> {
  ///  Local state fields for this page.

  bool seemore = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, OrdersRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // State field(s) for isFood widget.

  Map<OrdersRecord, bool> isFoodValueMap = {};
  List<OrdersRecord> get isFoodCheckedItems =>
      isFoodValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for isDrink widget.

  Map<OrdersRecord, bool> isDrinkValueMap = {};
  List<OrdersRecord> get isDrinkCheckedItems =>
      isDrinkValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for isMerc widget.

  Map<OrdersRecord, bool> isMercValueMap = {};
  List<OrdersRecord> get isMercCheckedItems =>
      isMercValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for IsShirt widget.

  Map<OrdersRecord, bool> isShirtValueMap = {};
  List<OrdersRecord> get isShirtCheckedItems =>
      isShirtValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for IsShort widget.

  Map<OrdersRecord, bool> isShortValueMap = {};
  List<OrdersRecord> get isShortCheckedItems =>
      isShortValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for isItems widget.

  Map<OrdersRecord, bool> isItemsValueMap = {};
  List<OrdersRecord> get isItemsCheckedItems =>
      isItemsValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for others widget.

  Map<OrdersRecord, bool> othersValueMap = {};
  List<OrdersRecord> get othersCheckedItems =>
      othersValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for small widget.

  Map<OrdersRecord, bool> smallValueMap = {};
  List<OrdersRecord> get smallCheckedItems =>
      smallValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for medium widget.

  Map<OrdersRecord, bool> mediumValueMap = {};
  List<OrdersRecord> get mediumCheckedItems =>
      mediumValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for large widget.

  Map<OrdersRecord, bool> largeValueMap = {};
  List<OrdersRecord> get largeCheckedItems =>
      largeValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for extralarge widget.

  Map<OrdersRecord, bool> extralargeValueMap = {};
  List<OrdersRecord> get extralargeCheckedItems => extralargeValueMap.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, OrdersRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, OrdersRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, OrdersRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryOrdersRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
