import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/system/menu/dropdown_menu/dropdown_menu_widget.dart';
import '/system/welcome/new_user/new_user_widget.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  bool isHome = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Carousel widget.
  CarouselController? carouselController1;

  int carouselCurrentIndex1 = 0;

  // State field(s) for Carousel widget.
  CarouselController? carouselController2;

  int carouselCurrentIndex2 = 0;

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for GridView widget.

  PagingController<DocumentSnapshot?, ProductsRecord>?
      gridViewPagingController1;
  Query? gridViewPagingQuery1;
  List<StreamSubscription?> gridViewStreamSubscriptions1 = [];

  // State field(s) for GridView widget.

  PagingController<DocumentSnapshot?, ProductsRecord>?
      gridViewPagingController2;
  Query? gridViewPagingQuery2;
  List<StreamSubscription?> gridViewStreamSubscriptions2 = [];

  // State field(s) for GridView widget.

  PagingController<DocumentSnapshot?, ProductsRecord>?
      gridViewPagingController3;
  Query? gridViewPagingQuery3;
  List<StreamSubscription?> gridViewStreamSubscriptions3 = [];

  // State field(s) for GridView widget.

  PagingController<DocumentSnapshot?, ProductsRecord>?
      gridViewPagingController4;
  Query? gridViewPagingQuery4;
  List<StreamSubscription?> gridViewStreamSubscriptions4 = [];

  // State field(s) for GridView widget.

  PagingController<DocumentSnapshot?, ProductsRecord>?
      gridViewPagingController5;
  Query? gridViewPagingQuery5;
  List<StreamSubscription?> gridViewStreamSubscriptions5 = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
    gridViewStreamSubscriptions1.forEach((s) => s?.cancel());
    gridViewPagingController1?.dispose();

    gridViewStreamSubscriptions2.forEach((s) => s?.cancel());
    gridViewPagingController2?.dispose();

    gridViewStreamSubscriptions3.forEach((s) => s?.cancel());
    gridViewPagingController3?.dispose();

    gridViewStreamSubscriptions4.forEach((s) => s?.cancel());
    gridViewPagingController4?.dispose();

    gridViewStreamSubscriptions5.forEach((s) => s?.cancel());
    gridViewPagingController5?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, ProductsRecord> setGridViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    gridViewPagingController1 ??= _createGridViewController1(query, parent);
    if (gridViewPagingQuery1 != query) {
      gridViewPagingQuery1 = query;
      gridViewPagingController1?.refresh();
    }
    return gridViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, ProductsRecord>
      _createGridViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProductsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProductsRecordPage(
          queryBuilder: (_) => gridViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: gridViewStreamSubscriptions1,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ProductsRecord> setGridViewController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    gridViewPagingController2 ??= _createGridViewController2(query, parent);
    if (gridViewPagingQuery2 != query) {
      gridViewPagingQuery2 = query;
      gridViewPagingController2?.refresh();
    }
    return gridViewPagingController2!;
  }

  PagingController<DocumentSnapshot?, ProductsRecord>
      _createGridViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProductsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProductsRecordPage(
          queryBuilder: (_) => gridViewPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: gridViewStreamSubscriptions2,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ProductsRecord> setGridViewController3(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    gridViewPagingController3 ??= _createGridViewController3(query, parent);
    if (gridViewPagingQuery3 != query) {
      gridViewPagingQuery3 = query;
      gridViewPagingController3?.refresh();
    }
    return gridViewPagingController3!;
  }

  PagingController<DocumentSnapshot?, ProductsRecord>
      _createGridViewController3(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProductsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProductsRecordPage(
          queryBuilder: (_) => gridViewPagingQuery3 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: gridViewStreamSubscriptions3,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ProductsRecord> setGridViewController4(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    gridViewPagingController4 ??= _createGridViewController4(query, parent);
    if (gridViewPagingQuery4 != query) {
      gridViewPagingQuery4 = query;
      gridViewPagingController4?.refresh();
    }
    return gridViewPagingController4!;
  }

  PagingController<DocumentSnapshot?, ProductsRecord>
      _createGridViewController4(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProductsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProductsRecordPage(
          queryBuilder: (_) => gridViewPagingQuery4 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: gridViewStreamSubscriptions4,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ProductsRecord> setGridViewController5(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    gridViewPagingController5 ??= _createGridViewController5(query, parent);
    if (gridViewPagingQuery5 != query) {
      gridViewPagingQuery5 = query;
      gridViewPagingController5?.refresh();
    }
    return gridViewPagingController5!;
  }

  PagingController<DocumentSnapshot?, ProductsRecord>
      _createGridViewController5(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProductsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProductsRecordPage(
          queryBuilder: (_) => gridViewPagingQuery5 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: gridViewStreamSubscriptions5,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }
}
