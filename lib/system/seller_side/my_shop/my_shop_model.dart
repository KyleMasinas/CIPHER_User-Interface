import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/system/menu/dropdown_menu/dropdown_menu_widget.dart';
import '/system/report_account/report_account_opt/report_account_opt_widget.dart';
import '/system/seller_side/product_opt/product_opt_widget.dart';
import '/system/seller_side/shop_setting/shop_setting_widget.dart';
import '/system/welcome/home_button/home_button_widget.dart';
import 'my_shop_widget.dart' show MyShopWidget;
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class MyShopModel extends FlutterFlowModel<MyShopWidget> {
  ///  Local state fields for this page.

  bool more = true;

  bool disablecheck = true;

  bool seemoreInProd = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HomeButton component.
  late HomeButtonModel homeButtonModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, OrdersRecord>? listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  // State field(s) for isFood widget.

  Map<OrdersRecord, bool> isFoodValueMap1 = {};
  List<OrdersRecord> get isFoodCheckedItems1 =>
      isFoodValueMap1.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for isDrink widget.

  Map<OrdersRecord, bool> isDrinkValueMap1 = {};
  List<OrdersRecord> get isDrinkCheckedItems1 =>
      isDrinkValueMap1.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for isMerc widget.

  Map<OrdersRecord, bool> isMercValueMap1 = {};
  List<OrdersRecord> get isMercCheckedItems1 =>
      isMercValueMap1.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for IsShirt widget.

  Map<OrdersRecord, bool> isShirtValueMap1 = {};
  List<OrdersRecord> get isShirtCheckedItems1 =>
      isShirtValueMap1.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for IsShort widget.

  Map<OrdersRecord, bool> isShortValueMap1 = {};
  List<OrdersRecord> get isShortCheckedItems1 =>
      isShortValueMap1.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for isItems widget.

  Map<OrdersRecord, bool> isItemsValueMap1 = {};
  List<OrdersRecord> get isItemsCheckedItems1 =>
      isItemsValueMap1.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for others widget.

  Map<OrdersRecord, bool> othersValueMap1 = {};
  List<OrdersRecord> get othersCheckedItems1 =>
      othersValueMap1.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for small widget.

  Map<OrdersRecord, bool> smallValueMap1 = {};
  List<OrdersRecord> get smallCheckedItems1 =>
      smallValueMap1.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for medium widget.

  Map<OrdersRecord, bool> mediumValueMap1 = {};
  List<OrdersRecord> get mediumCheckedItems1 =>
      mediumValueMap1.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for large widget.

  Map<OrdersRecord, bool> largeValueMap1 = {};
  List<OrdersRecord> get largeCheckedItems1 =>
      largeValueMap1.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for extralarge widget.

  Map<OrdersRecord, bool> extralargeValueMap1 = {};
  List<OrdersRecord> get extralargeCheckedItems1 => extralargeValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ProductsRecord>?
      listViewPagingController2;
  Query? listViewPagingQuery2;
  List<StreamSubscription?> listViewStreamSubscriptions2 = [];

  // State field(s) for isFood widget.

  Map<ProductsRecord, bool> isFoodValueMap2 = {};
  List<ProductsRecord> get isFoodCheckedItems2 =>
      isFoodValueMap2.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for isDrink widget.

  Map<ProductsRecord, bool> isDrinkValueMap2 = {};
  List<ProductsRecord> get isDrinkCheckedItems2 =>
      isDrinkValueMap2.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for isMerc widget.

  Map<ProductsRecord, bool> isMercValueMap2 = {};
  List<ProductsRecord> get isMercCheckedItems2 =>
      isMercValueMap2.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for IsShirt widget.

  Map<ProductsRecord, bool> isShirtValueMap2 = {};
  List<ProductsRecord> get isShirtCheckedItems2 =>
      isShirtValueMap2.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for IsShort widget.

  Map<ProductsRecord, bool> isShortValueMap2 = {};
  List<ProductsRecord> get isShortCheckedItems2 =>
      isShortValueMap2.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for isItems widget.

  Map<ProductsRecord, bool> isItemsValueMap2 = {};
  List<ProductsRecord> get isItemsCheckedItems2 =>
      isItemsValueMap2.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for others widget.

  Map<ProductsRecord, bool> othersValueMap2 = {};
  List<ProductsRecord> get othersCheckedItems2 =>
      othersValueMap2.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for small widget.

  Map<ProductsRecord, bool> smallValueMap2 = {};
  List<ProductsRecord> get smallCheckedItems2 =>
      smallValueMap2.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for medium widget.

  Map<ProductsRecord, bool> mediumValueMap2 = {};
  List<ProductsRecord> get mediumCheckedItems2 =>
      mediumValueMap2.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for large widget.

  Map<ProductsRecord, bool> largeValueMap2 = {};
  List<ProductsRecord> get largeCheckedItems2 =>
      largeValueMap2.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for extralarge widget.

  Map<ProductsRecord, bool> extralargeValueMap2 = {};
  List<ProductsRecord> get extralargeCheckedItems2 =>
      extralargeValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ProductsRecord>?
      listViewPagingController3;
  Query? listViewPagingQuery3;
  List<StreamSubscription?> listViewStreamSubscriptions3 = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    homeButtonModel = createModel(context, () => HomeButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    homeButtonModel.dispose();
    tabBarController?.dispose();
    listViewStreamSubscriptions1.forEach((s) => s?.cancel());
    listViewPagingController1?.dispose();

    listViewStreamSubscriptions2.forEach((s) => s?.cancel());
    listViewPagingController2?.dispose();

    listViewStreamSubscriptions3.forEach((s) => s?.cancel());
    listViewPagingController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, OrdersRecord> setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, OrdersRecord> _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, OrdersRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryOrdersRecordPage(
          queryBuilder: (_) => listViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions1,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ProductsRecord> setListViewController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController2 ??= _createListViewController2(query, parent);
    if (listViewPagingQuery2 != query) {
      listViewPagingQuery2 = query;
      listViewPagingController2?.refresh();
    }
    return listViewPagingController2!;
  }

  PagingController<DocumentSnapshot?, ProductsRecord>
      _createListViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProductsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProductsRecordPage(
          queryBuilder: (_) => listViewPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions2,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ProductsRecord> setListViewController3(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController3 ??= _createListViewController3(query, parent);
    if (listViewPagingQuery3 != query) {
      listViewPagingQuery3 = query;
      listViewPagingController3?.refresh();
    }
    return listViewPagingController3!;
  }

  PagingController<DocumentSnapshot?, ProductsRecord>
      _createListViewController3(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProductsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProductsRecordPage(
          queryBuilder: (_) => listViewPagingQuery3 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions3,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
