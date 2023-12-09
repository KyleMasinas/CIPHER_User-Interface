import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/system/menu/dropdown_menu/dropdown_menu_widget.dart';
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
import 'order_history_model.dart';
export 'order_history_model.dart';

class OrderHistoryWidget extends StatefulWidget {
  const OrderHistoryWidget({Key? key}) : super(key: key);

  @override
  _OrderHistoryWidgetState createState() => _OrderHistoryWidgetState();
}

class _OrderHistoryWidgetState extends State<OrderHistoryWidget>
    with TickerProviderStateMixin {
  late OrderHistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
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
          begin: Offset(-60.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
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
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderHistoryModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
            mainAxisAlignment: MainAxisAlignment.start,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 1170.0,
                          ),
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 0.0, 0.0),
                                  child: AutoSizeText(
                                    'Order History',
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 0.0, 12.0),
                                  child: Text(
                                    'History of your orders.',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation']!),
                                ),
                                PagedListView<DocumentSnapshot<Object?>?,
                                    OrdersRecord>(
                                  pagingController:
                                      _model.setListViewController(
                                    OrdersRecord.collection
                                        .where(
                                          'userRef',
                                          isEqualTo: currentUserReference,
                                        )
                                        .orderBy('orderedAt', descending: true),
                                  ),
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  reverse: false,
                                  scrollDirection: Axis.vertical,
                                  builderDelegate:
                                      PagedChildBuilderDelegate<OrdersRecord>(
                                    // Customize what your widget looks like when it's loading the first page.
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Customize what your widget looks like when it's loading another page.
                                    newPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    ),

                                    itemBuilder: (context, _, listViewIndex) {
                                      final listViewOrdersRecord = _model
                                          .listViewPagingController!
                                          .itemList![listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 12.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x520E151B),
                                                offset: Offset(0.0, 2.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 12.0, 12.0, 12.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: AutoSizeText(
                                                          listViewOrdersRecord
                                                              .sellerName,
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 25.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'ShopProducts',
                                                              queryParameters: {
                                                                'userRef':
                                                                    serializeParam(
                                                                  listViewOrdersRecord
                                                                      .sellerRef,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'productRef':
                                                                    serializeParam(
                                                                  listViewOrdersRecord
                                                                      .products,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .storefront_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  AutoSizeText(
                                                    'Ordered on ${dateTimeFormat('M/d h:mm a', listViewOrdersRecord.orderedAt)}',
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await Navigator.push(
                                                            context,
                                                            PageTransition(
                                                              type:
                                                                  PageTransitionType
                                                                      .fade,
                                                              child:
                                                                  FlutterFlowExpandedImageView(
                                                                image: Image
                                                                    .network(
                                                                  listViewOrdersRecord
                                                                      .image,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                                allowRotation:
                                                                    false,
                                                                tag:
                                                                    listViewOrdersRecord
                                                                        .image,
                                                                useHeroAnimation:
                                                                    true,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Hero(
                                                          tag:
                                                              listViewOrdersRecord
                                                                  .image,
                                                          transitionOnUserGestures:
                                                              true,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              listViewOrdersRecord
                                                                  .image,
                                                              width: 300.0,
                                                              height: 300.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  AutoSizeText(
                                                    'Product:${listViewOrdersRecord.name}',
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium,
                                                  ),
                                                  if (listViewOrdersRecord
                                                          .paymentOpt ==
                                                      'Cash On Pick-up')
                                                    AutoSizeText(
                                                      'Pick Up Address:${listViewOrdersRecord.pickUpAddress}',
                                                      maxLines: 2,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                    ),
                                                  AutoSizeText(
                                                    'Price:${listViewOrdersRecord.price.toString()}',
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium,
                                                  ),
                                                  AutoSizeText(
                                                    'Quantity: ${listViewOrdersRecord.productCount.toString()}',
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium,
                                                  ),
                                                  AutoSizeText(
                                                    'Shipping Fee: ${listViewOrdersRecord.shipping.toString()}',
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium,
                                                  ),
                                                  AutoSizeText(
                                                    'Total: ${listViewOrdersRecord.totalPayment.toString()}',
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium,
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            setState(() {
                                                              _model.seemore =
                                                                  !_model
                                                                      .seemore;
                                                            });
                                                          },
                                                          child: AutoSizeText(
                                                            _model.seemore ==
                                                                    true
                                                                ? 'See more...'
                                                                : 'See less...',
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium,
                                                          ),
                                                        ),
                                                      ),
                                                      if (_model.seemore ==
                                                          false)
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Wrap(
                                                                spacing: 0.0,
                                                                runSpacing: 0.0,
                                                                alignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    WrapCrossAlignment
                                                                        .start,
                                                                direction: Axis
                                                                    .horizontal,
                                                                runAlignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                verticalDirection:
                                                                    VerticalDirection
                                                                        .down,
                                                                clipBehavior:
                                                                    Clip.none,
                                                                children: [
                                                                  if (listViewOrdersRecord
                                                                          .isFood ==
                                                                      true)
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Theme(
                                                                            data:
                                                                                ThemeData(
                                                                              checkboxTheme: CheckboxThemeData(
                                                                                visualDensity: VisualDensity.compact,
                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                            child:
                                                                                Checkbox(
                                                                              value: _model.isFoodValueMap[listViewOrdersRecord] ??= true,
                                                                              onChanged: FFAppState().alwaysTrue
                                                                                  ? null
                                                                                  : (newValue) async {
                                                                                      setState(() => _model.isFoodValueMap[listViewOrdersRecord] = newValue!);
                                                                                    },
                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                              checkColor: FFAppState().alwaysTrue ? null : FlutterFlowTheme.of(context).info,
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              'Food',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  if (listViewOrdersRecord
                                                                          .isDrink ==
                                                                      true)
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Theme(
                                                                            data:
                                                                                ThemeData(
                                                                              checkboxTheme: CheckboxThemeData(
                                                                                visualDensity: VisualDensity.compact,
                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                            child:
                                                                                Checkbox(
                                                                              value: _model.isDrinkValueMap[listViewOrdersRecord] ??= true,
                                                                              onChanged: FFAppState().alwaysTrue
                                                                                  ? null
                                                                                  : (newValue) async {
                                                                                      setState(() => _model.isDrinkValueMap[listViewOrdersRecord] = newValue!);
                                                                                    },
                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                              checkColor: FFAppState().alwaysTrue ? null : FlutterFlowTheme.of(context).info,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            'Drink',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  if (listViewOrdersRecord
                                                                          .isMerc ==
                                                                      true)
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Flexible(
                                                                          child:
                                                                              ClipRRect(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(),
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
                                                                                      value: _model.isMercValueMap[listViewOrdersRecord] ??= true,
                                                                                      onChanged: FFAppState().alwaysTrue
                                                                                          ? null
                                                                                          : (newValue) async {
                                                                                              setState(() => _model.isMercValueMap[listViewOrdersRecord] = newValue!);
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
                                                                          ),
                                                                        ),
                                                                        if (listViewOrdersRecord.isShirt ==
                                                                            true)
                                                                          Flexible(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(),
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
                                                                                      value: _model.isShirtValueMap[listViewOrdersRecord] ??= true,
                                                                                      onChanged: FFAppState().alwaysTrue
                                                                                          ? null
                                                                                          : (newValue) async {
                                                                                              setState(() => _model.isShirtValueMap[listViewOrdersRecord] = newValue!);
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
                                                                          ),
                                                                        if (listViewOrdersRecord.isShort ==
                                                                            true)
                                                                          Flexible(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(),
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
                                                                                      value: _model.isShortValueMap[listViewOrdersRecord] ??= true,
                                                                                      onChanged: FFAppState().alwaysTrue
                                                                                          ? null
                                                                                          : (newValue) async {
                                                                                              setState(() => _model.isShortValueMap[listViewOrdersRecord] = newValue!);
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
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  if (listViewOrdersRecord
                                                                          .isItem ==
                                                                      true)
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Theme(
                                                                            data:
                                                                                ThemeData(
                                                                              checkboxTheme: CheckboxThemeData(
                                                                                visualDensity: VisualDensity.compact,
                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                            child:
                                                                                Checkbox(
                                                                              value: _model.isItemsValueMap[listViewOrdersRecord] ??= true,
                                                                              onChanged: FFAppState().alwaysTrue
                                                                                  ? null
                                                                                  : (newValue) async {
                                                                                      setState(() => _model.isItemsValueMap[listViewOrdersRecord] = newValue!);
                                                                                    },
                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                              checkColor: FFAppState().alwaysTrue ? null : FlutterFlowTheme.of(context).info,
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              'Item',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  if (listViewOrdersRecord
                                                                          .isOthers ==
                                                                      true)
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Row(
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
                                                                                    value: _model.othersValueMap[listViewOrdersRecord] ??= true,
                                                                                    onChanged: FFAppState().alwaysTrue
                                                                                        ? null
                                                                                        : (newValue) async {
                                                                                            setState(() => _model.othersValueMap[listViewOrdersRecord] = newValue!);
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
                                                                      ].divide(SizedBox(
                                                                              width: 15.0)),
                                                                    ),
                                                                ],
                                                              ),
                                                              if (listViewOrdersRecord
                                                                      .haveSize ==
                                                                  true)
                                                                Wrap(
                                                                  spacing: 0.0,
                                                                  runSpacing:
                                                                      0.0,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      WrapCrossAlignment
                                                                          .start,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  runAlignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  verticalDirection:
                                                                      VerticalDirection
                                                                          .down,
                                                                  clipBehavior:
                                                                      Clip.none,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        if (listViewOrdersRecord.isSmall ==
                                                                            true)
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Row(
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
                                                                                    value: _model.smallValueMap[listViewOrdersRecord] ??= true,
                                                                                    onChanged: FFAppState().alwaysTrue
                                                                                        ? null
                                                                                        : (newValue) async {
                                                                                            setState(() => _model.smallValueMap[listViewOrdersRecord] = newValue!);
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
                                                                        if (listViewOrdersRecord.isMedium ==
                                                                            true)
                                                                          Flexible(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(),
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
                                                                                      value: _model.mediumValueMap[listViewOrdersRecord] ??= true,
                                                                                      onChanged: FFAppState().alwaysTrue
                                                                                          ? null
                                                                                          : (newValue) async {
                                                                                              setState(() => _model.mediumValueMap[listViewOrdersRecord] = newValue!);
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
                                                                      ].divide(SizedBox(
                                                                              width: 15.0)),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        if (listViewOrdersRecord.isLarge ==
                                                                            true)
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Row(
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
                                                                                    value: _model.largeValueMap[listViewOrdersRecord] ??= true,
                                                                                    onChanged: FFAppState().alwaysTrue
                                                                                        ? null
                                                                                        : (newValue) async {
                                                                                            setState(() => _model.largeValueMap[listViewOrdersRecord] = newValue!);
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
                                                                        if (listViewOrdersRecord.isExtraLarge ==
                                                                            true)
                                                                          Flexible(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(),
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
                                                                                      value: _model.extralargeValueMap[listViewOrdersRecord] ??= true,
                                                                                      onChanged: FFAppState().alwaysTrue
                                                                                          ? null
                                                                                          : (newValue) async {
                                                                                              setState(() => _model.extralargeValueMap[listViewOrdersRecord] = newValue!);
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
                                                                      ].divide(SizedBox(
                                                                              width: 15.0)),
                                                                    ),
                                                                  ],
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    thickness: 1.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                  StreamBuilder<UsersRecord>(
                                                    stream:
                                                        UsersRecord.getDocument(
                                                            listViewOrdersRecord
                                                                .sellerRef!),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      final rowUsersRecord =
                                                          snapshot.data!;
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              AutoSizeText(
                                                                'Shop: ${rowUsersRecord.shopName}',
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                              ),
                                                            ],
                                                          ),
                                                          Flexible(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if ((listViewOrdersRecord.buyerConfirmation == false) &&
                                                                    (listViewOrdersRecord
                                                                            .isApproved ==
                                                                        true) &&
                                                                    (listViewOrdersRecord
                                                                            .isOrderComplete ==
                                                                        true))
                                                                  Flexible(
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await listViewOrdersRecord
                                                                            .reference
                                                                            .update(createOrdersRecordData(
                                                                          buyerConfirmation:
                                                                              true,
                                                                        ));
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFF018203),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                        alignment: AlignmentDirectional(
                                                                            0.00,
                                                                            0.00),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              0.0,
                                                                              4.0,
                                                                              0.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            'Confirm Recieval',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
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
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.00,
                                                                            0.00),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        () {
                                                                          if ((listViewOrdersRecord.isApproved == true) &&
                                                                              (listViewOrdersRecord.isRejected ==
                                                                                  false) &&
                                                                              (listViewOrdersRecord.isOrderComplete ==
                                                                                  false) &&
                                                                              (listViewOrdersRecord.buyerConfirmation ==
                                                                                  false)) {
                                                                            return 'Order Confirmed';
                                                                          } else if ((listViewOrdersRecord.isApproved == false) &&
                                                                              (listViewOrdersRecord.isRejected ==
                                                                                  true) &&
                                                                              (listViewOrdersRecord.isOrderComplete ==
                                                                                  false) &&
                                                                              (listViewOrdersRecord.buyerConfirmation ==
                                                                                  false)) {
                                                                            return 'Order Canceled';
                                                                          } else if ((listViewOrdersRecord.isApproved == true) &&
                                                                              (listViewOrdersRecord.isRejected ==
                                                                                  false) &&
                                                                              (listViewOrdersRecord.isOrderComplete ==
                                                                                  true) &&
                                                                              (listViewOrdersRecord.buyerConfirmation ==
                                                                                  false)) {
                                                                            return 'Order Received';
                                                                          } else if ((listViewOrdersRecord.isApproved == true) &&
                                                                              (listViewOrdersRecord.isRejected == false) &&
                                                                              (listViewOrdersRecord.isOrderComplete == true) &&
                                                                              (listViewOrdersRecord.buyerConfirmation == true)) {
                                                                            return 'COMPLETE';
                                                                          } else {
                                                                            return 'Pending';
                                                                          }
                                                                        }(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 5.0)),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 15.0)),
                                                      );
                                                    },
                                                  ),
                                                ].divide(SizedBox(height: 7.0)),
                                              ),
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation']!),
                                      );
                                    },
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
            ],
          ),
        ),
      ),
    );
  }
}
