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
import 'product_detail_model.dart';
export 'product_detail_model.dart';

class ProductDetailWidget extends StatefulWidget {
  const ProductDetailWidget({
    Key? key,
    required this.prodRef,
  }) : super(key: key);

  final ProductsRecord? prodRef;

  @override
  _ProductDetailWidgetState createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget>
    with TickerProviderStateMixin {
  late ProductDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 175.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 175.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 175.ms,
          duration: 600.ms,
          begin: Offset(0.0, 20.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 100.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 150.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().clearProdRateCache();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF018203),
          automaticallyImplyLeading: false,
          leading: Container(
            decoration: BoxDecoration(),
            child: FutureBuilder<int>(
              future: FFAppState().menuBadge(
                requestFn: () => queryNotificationRecordCount(
                  queryBuilder: (notificationRecord) => notificationRecord
                      .where(
                        'isRead',
                        isEqualTo: false,
                      )
                      .where(
                        'sellerRef',
                        isEqualTo: currentUserReference,
                      )
                      .where(
                        'isOrder',
                        isEqualTo: true,
                      ),
                ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                int stackCount = snapshot.data!;
                return Stack(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.00, 1.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 9.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (stackCount > 0)
                                Align(
                                  alignment: AlignmentDirectional(1.00, -1.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 5.0),
                                    child: badges.Badge(
                                      badgeContent: Text(
                                        ' ',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                            ),
                                      ),
                                      showBadge: true,
                                      shape: badges.BadgeShape.circle,
                                      badgeColor:
                                          FlutterFlowTheme.of(context).error,
                                      elevation: 4.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 6.0, 6.0, 6.0),
                                      position: badges.BadgePosition.topEnd(),
                                      animationType:
                                          badges.BadgeAnimationType.scale,
                                      toAnimate: true,
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.menu,
                                            color: Colors.black,
                                            size: 25.0,
                                          ),
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              useSafeArea: true,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: DropdownMenuWidget(),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (stackCount == 0)
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 5.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.menu,
                                        color: Colors.black,
                                        size: 25.0,
                                      ),
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          useSafeArea: true,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: DropdownMenuWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('Home');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/CIPHER_-_App_Logo.png',
                        width: 120.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
              child: Container(
                decoration: BoxDecoration(),
                child: FutureBuilder<int>(
                  future: FFAppState().cartBadge(
                    requestFn: () => queryCartRecordCount(
                      queryBuilder: (cartRecord) => cartRecord.where(
                        'userRef',
                        isEqualTo: currentUserReference,
                      ),
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 40.0,
                          height: 40.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    int stackCount = snapshot.data!;
                    return Stack(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.00, 1.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 9.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (stackCount > 0)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.00, -1.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 5.0, 0.0, 5.0),
                                        child: badges.Badge(
                                          badgeContent: Text(
                                            formatNumber(
                                              stackCount,
                                              formatType: FormatType.custom,
                                              format: '#',
                                              locale: '',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Colors.white,
                                                  fontSize: 10.0,
                                                ),
                                          ),
                                          showBadge: true,
                                          shape: badges.BadgeShape.circle,
                                          badgeColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                          elevation: 4.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 4.0, 4.0, 4.0),
                                          position:
                                              badges.BadgePosition.topEnd(),
                                          animationType:
                                              badges.BadgeAnimationType.scale,
                                          toAnimate: true,
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.shopping_cart_outlined,
                                                color: Color(0xFFFFD700),
                                                size: 28.0,
                                              ),
                                              onPressed: () async {
                                                context.pushNamed('cart');
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (stackCount == 0)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 5.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.shopping_cart_outlined,
                                            color: Color(0xFFFFD700),
                                            size: 28.0,
                                          ),
                                          onPressed: () async {
                                            context.pushNamed('cart');
                                          },
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 5.0, 5.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('Home');
                                          },
                                          child: wrapWithModel(
                                            model: _model.homeButtonModel1,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: HomeButtonWidget(
                                              action: () async {},
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Icon(
                                            Icons.chevron_right_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 16.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                widget.prodRef!.userref!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              final containerUsersRecord =
                                                  snapshot.data!;
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'ShopProducts',
                                                    queryParameters: {
                                                      'userRef': serializeParam(
                                                        containerUsersRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'productRef':
                                                          serializeParam(
                                                        widget
                                                            .prodRef?.reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Container(
                                                  height: 32.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: AutoSizeText(
                                                      containerUsersRecord
                                                          .shopName,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: Icon(
                                            Icons.chevron_right_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 16.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 16.0, 0.0),
                                          child: Container(
                                            height: 32.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                            ),
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Text(
                                                'Product Details',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                              ))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 5.0, 5.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 44.0,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('Home');
                                          },
                                          child: wrapWithModel(
                                            model: _model.homeButtonModel2,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: HomeButtonWidget(
                                              action: () async {},
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Icon(
                                            Icons.chevron_right_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 16.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                widget.prodRef!.userref!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              final containerUsersRecord =
                                                  snapshot.data!;
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'ShopProducts',
                                                    queryParameters: {
                                                      'userRef': serializeParam(
                                                        containerUsersRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'productRef':
                                                          serializeParam(
                                                        widget
                                                            .prodRef?.reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Container(
                                                  height: 32.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: AutoSizeText(
                                                      containerUsersRecord
                                                          .shopName,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Flexible(
                                          child: Icon(
                                            Icons.chevron_right_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 16.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: Container(
                                            height: 32.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                            ),
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Text(
                                                'Product Details',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 4.0, 140.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2.0,
                                        color: Color(0x520E151B),
                                        offset: Offset(0.0, 1.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 16.0, 16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Wrap(
                                                        spacing: 0.0,
                                                        runSpacing: 0.0,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                        direction:
                                                            Axis.horizontal,
                                                        runAlignment:
                                                            WrapAlignment.start,
                                                        verticalDirection:
                                                            VerticalDirection
                                                                .down,
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .fade,
                                                                        child:
                                                                            FlutterFlowExpandedImageView(
                                                                          image:
                                                                              Image.network(
                                                                            widget.prodRef!.image,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                          allowRotation:
                                                                              false,
                                                                          tag: widget
                                                                              .prodRef!
                                                                              .image,
                                                                          useHeroAnimation:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Hero(
                                                                    tag: widget
                                                                        .prodRef!
                                                                        .image,
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      child: Image
                                                                          .network(
                                                                        widget
                                                                            .prodRef!
                                                                            .image,
                                                                        width:
                                                                            300.0,
                                                                        height:
                                                                            300.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  AlignedTooltip(
                                                                    content:
                                                                        Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                4.0,
                                                                                4.0,
                                                                                4.0),
                                                                            child:
                                                                                Text(
                                                                              'The Average rating of this Product',
                                                                              style: FlutterFlowTheme.of(context).bodyLarge,
                                                                            )),
                                                                    offset: 4.0,
                                                                    preferredDirection:
                                                                        AxisDirection
                                                                            .down,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    elevation:
                                                                        4.0,
                                                                    tailBaseWidth:
                                                                        24.0,
                                                                    tailLength:
                                                                        12.0,
                                                                    waitDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                100),
                                                                    showDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                1500),
                                                                    triggerMode:
                                                                        TooltipTriggerMode
                                                                            .tap,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        AutoSizeText(
                                                                          formatNumber(
                                                                            widget.prodRef!.ratingStar,
                                                                            formatType:
                                                                                FormatType.decimal,
                                                                            decimalType:
                                                                                DecimalType.periodDecimal,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                fontSize: 20.0,
                                                                              ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.00,
                                                                              0.00),
                                                                          child:
                                                                              RatingBarIndicator(
                                                                            itemBuilder: (context, index) =>
                                                                                Icon(
                                                                              Icons.star_rounded,
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                            direction:
                                                                                Axis.horizontal,
                                                                            rating:
                                                                                widget.prodRef!.ratingStar,
                                                                            unratedColor:
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            itemCount:
                                                                                5,
                                                                            itemSize:
                                                                                25.0,
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 9.0)),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 7.0)),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        12.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                SingleChildScrollView(
                                                              primary: false,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            widget.prodRef?.name,
                                                                            'N/A',
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).headlineLarge,
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              FlutterFlowIconButton(
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            borderRadius:
                                                                                20.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            hoverColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            hoverIconColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.more_vert,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                enableDrag: false,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return GestureDetector(
                                                                                    onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                    child: Padding(
                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                      child: ReportAccountOptWidget(
                                                                                        prodRef: widget.prodRef!.reference,
                                                                                        userRef: widget.prodRef!.userref!,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() {}));
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            12.0),
                                                                    child: Text(
                                                                      formatNumber(
                                                                        widget
                                                                            .prodRef!
                                                                            .price,
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.periodDecimal,
                                                                        currency:
                                                                            '₱',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            24.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Stock: ${widget.prodRef?.stock?.toString()}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            24.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Shipping Fee: ${widget.prodRef?.shippingFee?.toString()}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge,
                                                                    ),
                                                                  ),
                                                                  if (widget
                                                                          .prodRef
                                                                          ?.paymentOpt ==
                                                                      'Cash On Pick-up')
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          24.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Pick Up Address: ${widget.prodRef?.pickUpAddress}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge,
                                                                      ),
                                                                    ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            24.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Payment: ${widget.prodRef?.paymentOpt}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              24.0,
                                                                              0.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            valueOrDefault<String>(
                                                                              widget.prodRef?.description,
                                                                              'N/A',
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).labelLarge,
                                                                          ),
                                                                        ),
                                                                        Wrap(
                                                                          spacing:
                                                                              0.0,
                                                                          runSpacing:
                                                                              0.0,
                                                                          alignment:
                                                                              WrapAlignment.start,
                                                                          crossAxisAlignment:
                                                                              WrapCrossAlignment.start,
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          runAlignment:
                                                                              WrapAlignment.start,
                                                                          verticalDirection:
                                                                              VerticalDirection.down,
                                                                          clipBehavior:
                                                                              Clip.none,
                                                                          children: [
                                                                            if (widget.prodRef?.isFood ==
                                                                                true)
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Theme(
                                                                                      data: ThemeData(
                                                                                        checkboxTheme: CheckboxThemeData(
                                                                                          visualDensity: VisualDensity.compact,
                                                                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                          shape: RoundedRectangleBorder(
                                                                                            borderRadius: BorderRadius.circular(4.0),
                                                                                          ),
                                                                                        ),
                                                                                        unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                      ),
                                                                                      child: Checkbox(
                                                                                        value: _model.isFoodDescValue ??= true,
                                                                                        onChanged: FFAppState().alwaysTrue
                                                                                            ? null
                                                                                            : (newValue) async {
                                                                                                setState(() => _model.isFoodDescValue = newValue!);
                                                                                              },
                                                                                        activeColor: FlutterFlowTheme.of(context).primary,
                                                                                        checkColor: FFAppState().alwaysTrue ? null : FlutterFlowTheme.of(context).info,
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        'Food',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            if (widget.prodRef?.isDrink ==
                                                                                true)
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Theme(
                                                                                      data: ThemeData(
                                                                                        checkboxTheme: CheckboxThemeData(
                                                                                          visualDensity: VisualDensity.compact,
                                                                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                          shape: RoundedRectangleBorder(
                                                                                            borderRadius: BorderRadius.circular(4.0),
                                                                                          ),
                                                                                        ),
                                                                                        unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                      ),
                                                                                      child: Checkbox(
                                                                                        value: _model.isDrinkDescValue ??= true,
                                                                                        onChanged: FFAppState().alwaysTrue
                                                                                            ? null
                                                                                            : (newValue) async {
                                                                                                setState(() => _model.isDrinkDescValue = newValue!);
                                                                                              },
                                                                                        activeColor: FlutterFlowTheme.of(context).primary,
                                                                                        checkColor: FFAppState().alwaysTrue ? null : FlutterFlowTheme.of(context).info,
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      'Drink',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            if (widget.prodRef?.isMerc ==
                                                                                true)
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Theme(
                                                                                          data: ThemeData(
                                                                                            checkboxTheme: CheckboxThemeData(
                                                                                              visualDensity: VisualDensity.compact,
                                                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                                              ),
                                                                                            ),
                                                                                            unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                          ),
                                                                                          child: Checkbox(
                                                                                            value: _model.isMercDescValue ??= true,
                                                                                            onChanged: FFAppState().alwaysTrue
                                                                                                ? null
                                                                                                : (newValue) async {
                                                                                                    setState(() => _model.isMercDescValue = newValue!);
                                                                                                  },
                                                                                            activeColor: FlutterFlowTheme.of(context).primary,
                                                                                            checkColor: FFAppState().alwaysTrue ? null : FlutterFlowTheme.of(context).info,
                                                                                          ),
                                                                                        ),
                                                                                        AutoSizeText(
                                                                                          'Merchandise',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      if (widget.prodRef?.isShirt == true)
                                                                                        Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Theme(
                                                                                                data: ThemeData(
                                                                                                  checkboxTheme: CheckboxThemeData(
                                                                                                    visualDensity: VisualDensity.compact,
                                                                                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                    shape: RoundedRectangleBorder(
                                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                  unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                ),
                                                                                                child: Checkbox(
                                                                                                  value: _model.isShirtDescValue ??= true,
                                                                                                  onChanged: FFAppState().alwaysTrue
                                                                                                      ? null
                                                                                                      : (newValue) async {
                                                                                                          setState(() => _model.isShirtDescValue = newValue!);
                                                                                                        },
                                                                                                  activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                  checkColor: FFAppState().alwaysTrue ? null : FlutterFlowTheme.of(context).info,
                                                                                                ),
                                                                                              ),
                                                                                              AutoSizeText(
                                                                                                'Shirt',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      if (widget.prodRef?.isShort == true)
                                                                                        Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Theme(
                                                                                                data: ThemeData(
                                                                                                  checkboxTheme: CheckboxThemeData(
                                                                                                    visualDensity: VisualDensity.compact,
                                                                                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                    shape: RoundedRectangleBorder(
                                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                  unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                ),
                                                                                                child: Checkbox(
                                                                                                  value: _model.isShortDescValue ??= true,
                                                                                                  onChanged: FFAppState().alwaysTrue
                                                                                                      ? null
                                                                                                      : (newValue) async {
                                                                                                          setState(() => _model.isShortDescValue = newValue!);
                                                                                                        },
                                                                                                  activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                  checkColor: FFAppState().alwaysTrue ? null : FlutterFlowTheme.of(context).info,
                                                                                                ),
                                                                                              ),
                                                                                              AutoSizeText(
                                                                                                'Short',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            if (widget.prodRef?.isItem ==
                                                                                true)
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Theme(
                                                                                      data: ThemeData(
                                                                                        checkboxTheme: CheckboxThemeData(
                                                                                          visualDensity: VisualDensity.compact,
                                                                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                          shape: RoundedRectangleBorder(
                                                                                            borderRadius: BorderRadius.circular(4.0),
                                                                                          ),
                                                                                        ),
                                                                                        unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                      ),
                                                                                      child: Checkbox(
                                                                                        value: _model.isItemsDescValue ??= true,
                                                                                        onChanged: FFAppState().alwaysTrue
                                                                                            ? null
                                                                                            : (newValue) async {
                                                                                                setState(() => _model.isItemsDescValue = newValue!);
                                                                                              },
                                                                                        activeColor: FlutterFlowTheme.of(context).primary,
                                                                                        checkColor: FFAppState().alwaysTrue ? null : FlutterFlowTheme.of(context).info,
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        'Item',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            if (widget.prodRef?.isOthers ==
                                                                                true)
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Theme(
                                                                                            data: ThemeData(
                                                                                              checkboxTheme: CheckboxThemeData(
                                                                                                visualDensity: VisualDensity.compact,
                                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                                ),
                                                                                              ),
                                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                            ),
                                                                                            child: Checkbox(
                                                                                              value: _model.othersDescValue ??= true,
                                                                                              onChanged: FFAppState().alwaysTrue
                                                                                                  ? null
                                                                                                  : (newValue) async {
                                                                                                      setState(() => _model.othersDescValue = newValue!);
                                                                                                    },
                                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                                              checkColor: FFAppState().alwaysTrue ? null : FlutterFlowTheme.of(context).info,
                                                                                            ),
                                                                                          ),
                                                                                          Flexible(
                                                                                            child: Text(
                                                                                              'Others',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 15.0)),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                        if (widget.prodRef?.haveSize ==
                                                                            true)
                                                                          Wrap(
                                                                            spacing:
                                                                                0.0,
                                                                            runSpacing:
                                                                                0.0,
                                                                            alignment:
                                                                                WrapAlignment.start,
                                                                            crossAxisAlignment:
                                                                                WrapCrossAlignment.start,
                                                                            direction:
                                                                                Axis.horizontal,
                                                                            runAlignment:
                                                                                WrapAlignment.start,
                                                                            verticalDirection:
                                                                                VerticalDirection.down,
                                                                            clipBehavior:
                                                                                Clip.none,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if (widget.prodRef?.isSmall == true)
                                                                                    Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Theme(
                                                                                            data: ThemeData(
                                                                                              checkboxTheme: CheckboxThemeData(
                                                                                                visualDensity: VisualDensity.compact,
                                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                                ),
                                                                                              ),
                                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                            ),
                                                                                            child: Checkbox(
                                                                                              value: _model.smallDescValue ??= true,
                                                                                              onChanged: FFAppState().alwaysTrue
                                                                                                  ? null
                                                                                                  : (newValue) async {
                                                                                                      setState(() => _model.smallDescValue = newValue!);
                                                                                                    },
                                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                                              checkColor: FFAppState().alwaysTrue ? null : FlutterFlowTheme.of(context).info,
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            'Small',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  if (widget.prodRef?.isMedium == true)
                                                                                    Flexible(
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Theme(
                                                                                              data: ThemeData(
                                                                                                checkboxTheme: CheckboxThemeData(
                                                                                                  visualDensity: VisualDensity.compact,
                                                                                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                  shape: RoundedRectangleBorder(
                                                                                                    borderRadius: BorderRadius.circular(4.0),
                                                                                                  ),
                                                                                                ),
                                                                                                unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                              ),
                                                                                              child: Checkbox(
                                                                                                value: _model.mediumDescValue ??= true,
                                                                                                onChanged: FFAppState().alwaysTrue
                                                                                                    ? null
                                                                                                    : (newValue) async {
                                                                                                        setState(() => _model.mediumDescValue = newValue!);
                                                                                                      },
                                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                checkColor: FFAppState().alwaysTrue ? null : FlutterFlowTheme.of(context).info,
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              'Medium',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                ].divide(SizedBox(width: 15.0)),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if (widget.prodRef?.isLarge == true)
                                                                                    Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Theme(
                                                                                            data: ThemeData(
                                                                                              checkboxTheme: CheckboxThemeData(
                                                                                                visualDensity: VisualDensity.compact,
                                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                                ),
                                                                                              ),
                                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                            ),
                                                                                            child: Checkbox(
                                                                                              value: _model.largeDescValue ??= true,
                                                                                              onChanged: FFAppState().alwaysTrue
                                                                                                  ? null
                                                                                                  : (newValue) async {
                                                                                                      setState(() => _model.largeDescValue = newValue!);
                                                                                                    },
                                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                                              checkColor: FFAppState().alwaysTrue ? null : FlutterFlowTheme.of(context).info,
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            'Large',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  if (widget.prodRef?.isExtraLarge == true)
                                                                                    Flexible(
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Theme(
                                                                                              data: ThemeData(
                                                                                                checkboxTheme: CheckboxThemeData(
                                                                                                  visualDensity: VisualDensity.compact,
                                                                                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                  shape: RoundedRectangleBorder(
                                                                                                    borderRadius: BorderRadius.circular(4.0),
                                                                                                  ),
                                                                                                ),
                                                                                                unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                              ),
                                                                                              child: Checkbox(
                                                                                                value: _model.extralargeDescValue ??= true,
                                                                                                onChanged: FFAppState().alwaysTrue
                                                                                                    ? null
                                                                                                    : (newValue) async {
                                                                                                        setState(() => _model.extralargeDescValue = newValue!);
                                                                                                      },
                                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                checkColor: FFAppState().alwaysTrue ? null : FlutterFlowTheme.of(context).info,
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              'Extra Large',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                ].divide(SizedBox(width: 15.0)),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    height:
                                                                        36.0,
                                                                    thickness:
                                                                        1.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.00,
                                                                            0.00),
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .orderQuantityModel,
                                                                      updateCallback:
                                                                          () =>
                                                                              setState(() {}),
                                                                      child:
                                                                          OrderQuantityWidget(),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        80.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Flexible(
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                if (valueOrDefault(currentUserDocument?.address, '') != null && valueOrDefault(currentUserDocument?.address, '') != '') {
                                                                                  if (_model.orderQuantityModel.countControllerValue! <= widget.prodRef!.stock) {
                                                                                    if (valueOrDefault(currentUserDocument?.cartLimit, 0) <= 9) {
                                                                                      var confirmDialogResponse = await showDialog<bool>(
                                                                                            context: context,
                                                                                            builder: (alertDialogContext) {
                                                                                              return AlertDialog(
                                                                                                title: Text('Notice'),
                                                                                                content: Text('Press Cofirm to continue adding this product to your Cart'),
                                                                                                actions: [
                                                                                                  TextButton(
                                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                    child: Text('Cancel'),
                                                                                                  ),
                                                                                                  TextButton(
                                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                    child: Text('Confirm'),
                                                                                                  ),
                                                                                                ],
                                                                                              );
                                                                                            },
                                                                                          ) ??
                                                                                          false;
                                                                                      if (confirmDialogResponse) {
                                                                                        await CartRecord.collection.doc().set(createCartRecordData(
                                                                                              userRef: currentUserReference,
                                                                                              products: widget.prodRef?.reference,
                                                                                              addedAt: getCurrentTimestamp,
                                                                                              productCount: _model.orderQuantityModel.countControllerValue,
                                                                                              totalPayment: functions.totalpayment(functions.increment(widget.prodRef!.price, _model.orderQuantityModel.countControllerValue!)!, widget.prodRef!.shippingFee),
                                                                                              subtotal: functions.increment(
                                                                                                  valueOrDefault<double>(
                                                                                                    widget.prodRef?.price,
                                                                                                    0.0,
                                                                                                  ),
                                                                                                  _model.orderQuantityModel.countControllerValue!),
                                                                                              shipping: widget.prodRef?.shippingFee,
                                                                                              sellerRef: widget.prodRef?.userref,
                                                                                              sellerName: widget.prodRef?.sellerName,
                                                                                              shopName: widget.prodRef?.shopName,
                                                                                              isShirt: widget.prodRef?.isShirt,
                                                                                              isShort: widget.prodRef?.isShort,
                                                                                              isFood: widget.prodRef?.isFood,
                                                                                              isItem: widget.prodRef?.isItem,
                                                                                              isMerc: widget.prodRef?.isMerc,
                                                                                              isOthers: widget.prodRef?.isOthers,
                                                                                              haveSize: widget.prodRef?.haveSize,
                                                                                              isSmall: widget.prodRef?.isSmall,
                                                                                              isLarge: widget.prodRef?.isLarge,
                                                                                              isMedium: widget.prodRef?.isMedium,
                                                                                              isExtraLarge: widget.prodRef?.isExtraLarge,
                                                                                              isDrink: widget.prodRef?.isDrink,
                                                                                              image: widget.prodRef?.image,
                                                                                            ));

                                                                                        await currentUserReference!.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'CartLimit': FieldValue.increment(1),
                                                                                            },
                                                                                          ),
                                                                                        });
                                                                                        FFAppState().clearCartBadgeCache();
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return AlertDialog(
                                                                                              title: Text('Notice!'),
                                                                                              content: Text('The product been added to your Cart'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                  child: Text('Ok'),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      }
                                                                                    } else {
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return AlertDialog(
                                                                                            title: Text('Cart Notice!'),
                                                                                            content: Text('You can only add product to cart 10 times'),
                                                                                            actions: [
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                child: Text('Ok'),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    }
                                                                                  } else {
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          title: Text('Notice'),
                                                                                          content: Text('The product stocks are insufficient.'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                              child: Text('Ok'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  }
                                                                                } else {
                                                                                  var confirmDialogResponse = await showDialog<bool>(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return AlertDialog(
                                                                                            title: Text('Missing address in your profile'),
                                                                                            content: Text('Please update your profile first before buying. Press Confirm to continue to update profile.'),
                                                                                            actions: [
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                child: Text('Cancel'),
                                                                                              ),
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                child: Text('Confirm'),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      ) ??
                                                                                      false;
                                                                                  if (confirmDialogResponse) {
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      enableDrag: false,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return GestureDetector(
                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: EditProfileWidget(),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));
                                                                                  }
                                                                                }
                                                                              },
                                                                              text: 'Add to Cart',
                                                                              options: FFButtonOptions(
                                                                                width: 150.0,
                                                                                height: 50.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                elevation: 2.0,
                                                                                borderSide: BorderSide(
                                                                                  color: Colors.transparent,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(50.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                if (valueOrDefault(currentUserDocument?.address, '') != null && valueOrDefault(currentUserDocument?.address, '') != '') {
                                                                                  if (_model.orderQuantityModel.countControllerValue! <= widget.prodRef!.stock) {
                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return AlertDialog(
                                                                                              title: Text('Notice'),
                                                                                              content: Text('Press Cofirm to continue buying this product directly.'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                  child: Text('Cancel'),
                                                                                                ),
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                  child: Text('Confirm'),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        ) ??
                                                                                        false;
                                                                                    if (confirmDialogResponse) {
                                                                                      await OrdersRecord.collection.doc().set(createOrdersRecordData(
                                                                                            userRef: currentUserReference,
                                                                                            productCount: _model.orderQuantityModel.countControllerValue,
                                                                                            subtotal: functions.increment(widget.prodRef!.price, _model.orderQuantityModel.countControllerValue!),
                                                                                            isOrdered: true,
                                                                                            shipping: widget.prodRef?.shippingFee,
                                                                                            totalPayment: functions.totalpayment(functions.increment(widget.prodRef!.price, _model.orderQuantityModel.countControllerValue!)!, widget.prodRef!.shippingFee),
                                                                                            products: widget.prodRef?.reference,
                                                                                            name: widget.prodRef?.name,
                                                                                            price: widget.prodRef?.price,
                                                                                            description: widget.prodRef?.description,
                                                                                            sellerRef: widget.prodRef?.userref,
                                                                                            isApproved: false,
                                                                                            orderedAt: getCurrentTimestamp,
                                                                                            isRejected: false,
                                                                                            isOrderComplete: false,
                                                                                            buyerConfirmation: false,
                                                                                            buyerAddress: valueOrDefault(currentUserDocument?.address, ''),
                                                                                            buyerName: currentUserDisplayName,
                                                                                            buyerShippingAddress: valueOrDefault(currentUserDocument?.address, ''),
                                                                                            buyerPhoneNumber: currentPhoneNumber,
                                                                                            buyerEmail: currentUserEmail,
                                                                                            buyerRef: currentUserReference,
                                                                                            paymentOpt: widget.prodRef?.paymentOpt,
                                                                                            pickUpAddress: widget.prodRef?.pickUpAddress,
                                                                                            sellerName: widget.prodRef?.sellerName,
                                                                                            shopName: widget.prodRef?.shopName,
                                                                                            isSmall: widget.prodRef?.isSmall,
                                                                                            isMedium: widget.prodRef?.isMedium,
                                                                                            isLarge: widget.prodRef?.isLarge,
                                                                                            isExtraLarge: widget.prodRef?.isExtraLarge,
                                                                                            isFood: widget.prodRef?.isFood,
                                                                                            isMerc: widget.prodRef?.isMerc,
                                                                                            isDrink: widget.prodRef?.isDrink,
                                                                                            isOthers: widget.prodRef?.isOthers,
                                                                                            isItem: widget.prodRef?.isItem,
                                                                                            isShirt: widget.prodRef?.isShirt,
                                                                                            isShort: widget.prodRef?.isShort,
                                                                                            haveSize: widget.prodRef?.haveSize,
                                                                                            image: widget.prodRef?.image,
                                                                                          ));
                                                                                      setState(() {
                                                                                        FFAppState().totalpayment = functions.totalpayment(functions.increment(widget.prodRef!.price, _model.orderQuantityModel.countControllerValue!)!, widget.prodRef!.shippingFee)!;
                                                                                        FFAppState().name = widget.prodRef!.name;
                                                                                        FFAppState().quantity = _model.orderQuantityModel.countControllerValue!.toString();
                                                                                        FFAppState().shipfee = widget.prodRef!.shippingFee;
                                                                                        FFAppState().price = widget.prodRef!.price;
                                                                                      });

                                                                                      await NotificationRecord.collection.doc().set(createNotificationRecordData(
                                                                                            title: 'Customer Orders!',
                                                                                            description: 'Successful order to your product!',
                                                                                            timeCreated: getCurrentTimestamp,
                                                                                            prodRef: widget.prodRef?.reference,
                                                                                            buyerRef: currentUserReference,
                                                                                            sellerRef: widget.prodRef?.userref,
                                                                                            displayName: '',
                                                                                            isReport: false,
                                                                                            isOrder: true,
                                                                                            isOrderAccepted: false,
                                                                                            isOrderRejected: false,
                                                                                            receivedBy: widget.prodRef?.userref,
                                                                                            isRead: false,
                                                                                          ));
                                                                                      await showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        enableDrag: false,
                                                                                        useSafeArea: true,
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return GestureDetector(
                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                            child: Padding(
                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                              child: ConfcheckoutWidget(),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => safeSetState(() {}));
                                                                                    }
                                                                                  } else {
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          title: Text('Notice'),
                                                                                          content: Text('The product stocks are insufficient.'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                              child: Text('Ok'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  }
                                                                                } else {
                                                                                  var confirmDialogResponse = await showDialog<bool>(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return AlertDialog(
                                                                                            title: Text('Missing address in your profile'),
                                                                                            content: Text('Please update your profile first before buying. Press Confirm to continue to update profile.'),
                                                                                            actions: [
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                child: Text('Cancel'),
                                                                                              ),
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                child: Text('Confirm'),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      ) ??
                                                                                      false;
                                                                                  if (confirmDialogResponse) {
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      enableDrag: false,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return GestureDetector(
                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: EditProfileWidget(),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));
                                                                                  }
                                                                                }
                                                                              },
                                                                              text: 'Buy Now',
                                                                              options: FFButtonOptions(
                                                                                width: 150.0,
                                                                                height: 50.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                elevation: 2.0,
                                                                                borderSide: BorderSide(
                                                                                  color: Colors.transparent,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(50.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 25.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'columnOnPageLoadAnimation']!),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                height: 36.0,
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 16.0),
                                                child:
                                                    StreamBuilder<UsersRecord>(
                                                  stream:
                                                      UsersRecord.getDocument(
                                                          widget.prodRef!
                                                              .userref!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final userList9UsersRecord =
                                                        snapshot.data!;
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'SellerDetails',
                                                          queryParameters: {
                                                            'userRef':
                                                                serializeParam(
                                                              userList9UsersRecord
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 0.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              offset: Offset(
                                                                  0.0, 1.0),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      8.0,
                                                                      12.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  userList9UsersRecord
                                                                      .photoUrl,
                                                                  width: 70.0,
                                                                  height: 70.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        userList9UsersRecord
                                                                            .displayName,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Icon(
                                                                Icons
                                                                    .chevron_right_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation']!);
                                                  },
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Ratings',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge,
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'textOnPageLoadAnimation1']!),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Read the ratings for this product below',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium,
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'textOnPageLoadAnimation2']!),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      unawaited(
                                                        () async {
                                                          _model.isBought =
                                                              await queryOrdersRecordCount(
                                                            queryBuilder:
                                                                (ordersRecord) =>
                                                                    ordersRecord
                                                                        .where(
                                                                          'BuyerRef',
                                                                          isEqualTo:
                                                                              currentUserReference,
                                                                        )
                                                                        .where(
                                                                          'products',
                                                                          isEqualTo: widget
                                                                              .prodRef
                                                                              ?.reference,
                                                                        )
                                                                        .where(
                                                                          'isOrderComplete',
                                                                          isEqualTo:
                                                                              true,
                                                                        )
                                                                        .where(
                                                                          'buyerConfirmation',
                                                                          isEqualTo:
                                                                              true,
                                                                        ),
                                                          );
                                                        }(),
                                                      );
                                                      if (_model.isBought! >
                                                          0) {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    CreateReviewWidget(
                                                                  prodRef: widget
                                                                      .prodRef!
                                                                      .reference,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Notice'),
                                                              content: Text(
                                                                  'You can only post a review on products you purchased and received.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }

                                                      setState(() {});
                                                    },
                                                    text: 'Leave Review',
                                                    options: FFButtonOptions(
                                                      height: 44.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      hoverTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      hoverElevation: 3.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: SingleChildScrollView(
                                                  primary: false,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                ReviewsRecord>>(
                                                          stream: FFAppState()
                                                              .prodRate(
                                                            requestFn: () =>
                                                                queryReviewsRecord(
                                                              queryBuilder: (reviewsRecord) =>
                                                                  reviewsRecord
                                                                      .where(
                                                                        'productRef',
                                                                        isEqualTo: widget
                                                                            .prodRef
                                                                            ?.reference,
                                                                      )
                                                                      .orderBy(
                                                                          'rating',
                                                                          descending:
                                                                              true),
                                                            ),
                                                          )..listen(
                                                                (snapshot) async {
                                                              List<ReviewsRecord>
                                                                  listViewReviewsRecordList =
                                                                  snapshot;
                                                              if (_model.listViewPreviousSnapshot !=
                                                                      null &&
                                                                  !const ListEquality(
                                                                          ReviewsRecordDocumentEquality())
                                                                      .equals(
                                                                          listViewReviewsRecordList,
                                                                          _model
                                                                              .listViewPreviousSnapshot)) {
                                                                unawaited(
                                                                  () async {
                                                                    await widget
                                                                        .prodRef!
                                                                        .reference
                                                                        .update(
                                                                            createProductsRecordData(
                                                                      ratingStar: functions.totalRating(listViewReviewsRecordList
                                                                          .map((e) =>
                                                                              e.rating)
                                                                          .toList()),
                                                                    ));
                                                                  }(),
                                                                );

                                                                setState(() {});
                                                              }
                                                              _model.listViewPreviousSnapshot =
                                                                  snapshot;
                                                            }),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<ReviewsRecord>
                                                                listViewReviewsRecordList =
                                                                snapshot.data!;
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  listViewReviewsRecordList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewReviewsRecord =
                                                                    listViewReviewsRecordList[
                                                                        listViewIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          4.0,
                                                                          4.0,
                                                                          12.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                8.0,
                                                                                12.0,
                                                                                8.0),
                                                                            child:
                                                                                StreamBuilder<UsersRecord>(
                                                                              stream: UsersRecord.getDocument(listViewReviewsRecord.userrefReviewer!),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      child: CircularProgressIndicator(
                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                final nameRatingUsersRecord = snapshot.data!;
                                                                                return Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                          child: Container(
                                                                                            width: 44.0,
                                                                                            height: 44.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                              shape: BoxShape.rectangle,
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                child: Image.network(
                                                                                                  nameRatingUsersRecord.photoUrl,
                                                                                                  width: 70.0,
                                                                                                  height: 70.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              AutoSizeText(
                                                                                                nameRatingUsersRecord.displayName,
                                                                                                maxLines: 1,
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                child: AutoSizeText(
                                                                                                  nameRatingUsersRecord.email,
                                                                                                  maxLines: 1,
                                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Rating',
                                                                                          style: FlutterFlowTheme.of(context).labelSmall,
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                              child: AutoSizeText(
                                                                                                listViewReviewsRecord.rating.toString(),
                                                                                                style: FlutterFlowTheme.of(context).headlineMedium,
                                                                                              ),
                                                                                            ),
                                                                                            Icon(
                                                                                              Icons.star_rounded,
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                AutoSizeText(
                                                                              valueOrDefault<String>(
                                                                                listViewReviewsRecord.reviewname,
                                                                                'N/A',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                AutoSizeText(
                                                                              valueOrDefault<String>(
                                                                                listViewReviewsRecord.reviewDesc,
                                                                                'N/A',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
