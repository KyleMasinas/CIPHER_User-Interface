import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/system/cart_order_transaction/order_quantity/order_quantity_widget.dart';
import '/system/confcheckout/confcheckout_widget.dart';
import '/system/create_review_function/create_review/create_review_widget.dart';
import '/system/menu/dropdown_menu/dropdown_menu_widget.dart';
import '/system/profile/edit_profile/edit_profile_widget.dart';
import '/system/report_account/report_account_opt/report_account_opt_widget.dart';
import '/system/welcome/home_button/home_button_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:badges/badges.dart' as badges;
import 'product_detail_widget.dart' show ProductDetailWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProductDetailModel extends FlutterFlowModel<ProductDetailWidget> {
  ///  Local state fields for this page.

  bool? ratingSet;

  bool seeMore = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HomeButton component.
  late HomeButtonModel homeButtonModel1;
  // Model for HomeButton component.
  late HomeButtonModel homeButtonModel2;
  // State field(s) for isFoodDesc widget.
  bool? isFoodDescValue;
  // State field(s) for isDrinkDesc widget.
  bool? isDrinkDescValue;
  // State field(s) for isMercDesc widget.
  bool? isMercDescValue;
  // State field(s) for IsShirtDesc widget.
  bool? isShirtDescValue;
  // State field(s) for IsShortDesc widget.
  bool? isShortDescValue;
  // State field(s) for isItemsDesc widget.
  bool? isItemsDescValue;
  // State field(s) for othersDesc widget.
  bool? othersDescValue;
  // State field(s) for smallDesc widget.
  bool? smallDescValue;
  // State field(s) for mediumDesc widget.
  bool? mediumDescValue;
  // State field(s) for largeDesc widget.
  bool? largeDescValue;
  // State field(s) for extralargeDesc widget.
  bool? extralargeDescValue;
  // Model for order_quantity component.
  late OrderQuantityModel orderQuantityModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? isBought;
  List<ReviewsRecord>? listViewPreviousSnapshot;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    homeButtonModel1 = createModel(context, () => HomeButtonModel());
    homeButtonModel2 = createModel(context, () => HomeButtonModel());
    orderQuantityModel = createModel(context, () => OrderQuantityModel());
  }

  void dispose() {
    unfocusNode.dispose();
    homeButtonModel1.dispose();
    homeButtonModel2.dispose();
    orderQuantityModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
