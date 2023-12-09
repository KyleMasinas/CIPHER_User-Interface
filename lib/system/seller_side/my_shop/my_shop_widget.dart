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
import 'my_shop_model.dart';
export 'my_shop_model.dart';

class MyShopWidget extends StatefulWidget {
  const MyShopWidget({Key? key}) : super(key: key);

  @override
  _MyShopWidgetState createState() => _MyShopWidgetState();
}

class _MyShopWidgetState extends State<MyShopWidget>
    with TickerProviderStateMixin {
  late MyShopModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyShopModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Container(
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 5.0, 5.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 44.0,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed('Home');
                                                  },
                                                  child: wrapWithModel(
                                                    model:
                                                        _model.homeButtonModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: HomeButtonWidget(
                                                      action: () async {},
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Icon(
                                                    Icons.chevron_right_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 16.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 16.0, 0.0),
                                                  child: Container(
                                                    height: 32.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Text(
                                                        'My Shop',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
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
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
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
                                                                  ShopSettingWidget(),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Icon(
                                                      Icons.settings_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.9,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment(0.0, 0),
                                                child: FlutterFlowButtonTabBar(
                                                  useToggleButtonStyle: true,
                                                  isScrollable: true,
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge,
                                                  unselectedLabelStyle:
                                                      TextStyle(),
                                                  labelColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  unselectedLabelColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  unselectedBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  unselectedBorderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  borderWidth: 2.0,
                                                  borderRadius: 12.0,
                                                  elevation: 0.0,
                                                  labelPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(16.0, 0.0,
                                                              16.0, 0.0),
                                                  buttonMargin:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(16.0, 8.0,
                                                              0.0, 8.0),
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 12.0),
                                                  tabs: [
                                                    Tab(
                                                      text: 'Orders',
                                                    ),
                                                    Tab(
                                                      text: 'Products',
                                                    ),
                                                    Tab(
                                                      text: 'History',
                                                    ),
                                                  ],
                                                  controller:
                                                      _model.tabBarController,
                                                ),
                                              ),
                                              Expanded(
                                                child: TabBarView(
                                                  controller:
                                                      _model.tabBarController,
                                                  children: [
                                                    KeepAliveWidgetWrapper(
                                                      builder: (context) =>
                                                          SingleChildScrollView(
                                                        primary: false,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.00,
                                                                      -1.00),
                                                              child: Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      1400.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    width: 2.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
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
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            16.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Orders',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).displaySmall,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              9.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child: PagedListView<
                                                                              DocumentSnapshot<Object?>?,
                                                                              OrdersRecord>(
                                                                            pagingController:
                                                                                _model.setListViewController1(
                                                                              OrdersRecord.collection
                                                                                  .where(
                                                                                    'sellerRef',
                                                                                    isEqualTo: currentUserReference,
                                                                                  )
                                                                                  .where(
                                                                                    'isRejected',
                                                                                    isEqualTo: false,
                                                                                  )
                                                                                  .orderBy('orderedAt', descending: true)
                                                                                  .orderBy('isOrderComplete', descending: true),
                                                                            ),
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            primary:
                                                                                false,
                                                                            shrinkWrap:
                                                                                true,
                                                                            reverse:
                                                                                false,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            builderDelegate:
                                                                                PagedChildBuilderDelegate<OrdersRecord>(
                                                                              // Customize what your widget looks like when it's loading the first page.
                                                                              firstPageProgressIndicatorBuilder: (_) => Center(
                                                                                child: SizedBox(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  child: CircularProgressIndicator(
                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              // Customize what your widget looks like when it's loading another page.
                                                                              newPageProgressIndicatorBuilder: (_) => Center(
                                                                                child: SizedBox(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  child: CircularProgressIndicator(
                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),

                                                                              itemBuilder: (context, _, listViewIndex) {
                                                                                final listViewOrdersRecord = _model.listViewPagingController1!.itemList![listViewIndex];
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                                                                                  child: StreamBuilder<ProductsRecord>(
                                                                                    stream: ProductsRecord.getDocument(listViewOrdersRecord.products!),
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
                                                                                      final containerProductsRecord = snapshot.data!;
                                                                                      return Container(
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 3.0,
                                                                                              color: Color(0x33000000),
                                                                                              offset: Offset(0.0, 1.0),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                                                                          child: SingleChildScrollView(
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: AutoSizeText(
                                                                                                        'Total Payment',
                                                                                                        maxLines: 1,
                                                                                                        style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                              fontFamily: 'Readex Pro',
                                                                                                              fontSize: 24.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    AutoSizeText(
                                                                                                      formatNumber(
                                                                                                        listViewOrdersRecord.totalPayment,
                                                                                                        formatType: FormatType.decimal,
                                                                                                        decimalType: DecimalType.periodDecimal,
                                                                                                        currency: '₱',
                                                                                                      ),
                                                                                                      maxLines: 1,
                                                                                                      style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 8.0),
                                                                                                  child: AutoSizeText(
                                                                                                    'Added on ${dateTimeFormat('relative', listViewOrdersRecord.orderedAt)}',
                                                                                                    maxLines: 1,
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                  child: Container(
                                                                                                    width: double.infinity,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      AutoSizeText(
                                                                                                                        'Buyer Profile:',
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                      ),
                                                                                                                      Flexible(
                                                                                                                        child: Align(
                                                                                                                          alignment: AlignmentDirectional(1.00, 0.00),
                                                                                                                          child: FlutterFlowIconButton(
                                                                                                                            borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                                                            borderRadius: 20.0,
                                                                                                                            borderWidth: 1.0,
                                                                                                                            buttonSize: 40.0,
                                                                                                                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                            hoverColor: FlutterFlowTheme.of(context).alternate,
                                                                                                                            hoverIconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            icon: Icon(
                                                                                                                              Icons.more_vert,
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                              size: 24.0,
                                                                                                                            ),
                                                                                                                            onPressed: () async {
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
                                                                                                                                        prodRef: listViewOrdersRecord.products!,
                                                                                                                                        userRef: listViewOrdersRecord.userRef!,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                },
                                                                                                                              ).then((value) => safeSetState(() {}));
                                                                                                                            },
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ].divide(SizedBox(width: 9.0)),
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      AutoSizeText(
                                                                                                                        'Name: ${listViewOrdersRecord.buyerName}',
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                      ),
                                                                                                                    ].divide(SizedBox(width: 9.0)),
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      AutoSizeText(
                                                                                                                        'Email: ${listViewOrdersRecord.buyerEmail}',
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                      ),
                                                                                                                    ].divide(SizedBox(width: 9.0)),
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      AutoSizeText(
                                                                                                                        'Phone Number: ${listViewOrdersRecord.buyerPhoneNumber}',
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                      ),
                                                                                                                    ].divide(SizedBox(width: 9.0)),
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      AutoSizeText(
                                                                                                                        'Shipping Address: ${listViewOrdersRecord.buyerShippingAddress}',
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                      ),
                                                                                                                    ].divide(SizedBox(width: 9.0)),
                                                                                                                  ),
                                                                                                                  Divider(
                                                                                                                    thickness: 1.0,
                                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    decoration: BoxDecoration(),
                                                                                                                    child: Align(
                                                                                                                      alignment: AlignmentDirectional(0.00, 0.00),
                                                                                                                      child: InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          await Navigator.push(
                                                                                                                            context,
                                                                                                                            PageTransition(
                                                                                                                              type: PageTransitionType.fade,
                                                                                                                              child: FlutterFlowExpandedImageView(
                                                                                                                                image: Image.network(
                                                                                                                                  listViewOrdersRecord.image,
                                                                                                                                  fit: BoxFit.contain,
                                                                                                                                ),
                                                                                                                                allowRotation: false,
                                                                                                                                tag: listViewOrdersRecord.image,
                                                                                                                                useHeroAnimation: true,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          );
                                                                                                                        },
                                                                                                                        child: Hero(
                                                                                                                          tag: listViewOrdersRecord.image,
                                                                                                                          transitionOnUserGestures: true,
                                                                                                                          child: ClipRRect(
                                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                                            child: Image.network(
                                                                                                                              listViewOrdersRecord.image,
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
                                                                                                                    listViewOrdersRecord.name,
                                                                                                                    maxLines: 2,
                                                                                                                    style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                                                  ),
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                    child: AutoSizeText(
                                                                                                                      'Count: ${listViewOrdersRecord.productCount.toString()}',
                                                                                                                      maxLines: 1,
                                                                                                                      style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  if (listViewOrdersRecord.paymentOpt == 'Cash On Pick-up')
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                      child: AutoSizeText(
                                                                                                                        'Pick Up Address: ${listViewOrdersRecord.pickUpAddress}',
                                                                                                                        maxLines: 1,
                                                                                                                        style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                    child: AutoSizeText(
                                                                                                                      'Shipping Fee: ${containerProductsRecord.shippingFee.toString()}',
                                                                                                                      maxLines: 1,
                                                                                                                      style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                    child: AutoSizeText(
                                                                                                                      'Payment Method: ${containerProductsRecord.paymentOpt}',
                                                                                                                      maxLines: 1,
                                                                                                                      style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                    child: AutoSizeText(
                                                                                                                      'Price:  ${containerProductsRecord.price.toString()}',
                                                                                                                      maxLines: 1,
                                                                                                                      style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                    child: InkWell(
                                                                                                                      splashColor: Colors.transparent,
                                                                                                                      focusColor: Colors.transparent,
                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                      onTap: () async {
                                                                                                                        setState(() {
                                                                                                                          _model.more = !_model.more;
                                                                                                                        });
                                                                                                                      },
                                                                                                                      child: AutoSizeText(
                                                                                                                        _model.more == true ? 'See more...' : 'See less...',
                                                                                                                        maxLines: 1,
                                                                                                                        style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  if (_model.more == false)
                                                                                                                    Container(
                                                                                                                      decoration: BoxDecoration(),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Wrap(
                                                                                                                            spacing: 0.0,
                                                                                                                            runSpacing: 0.0,
                                                                                                                            alignment: WrapAlignment.start,
                                                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                            direction: Axis.horizontal,
                                                                                                                            runAlignment: WrapAlignment.start,
                                                                                                                            verticalDirection: VerticalDirection.down,
                                                                                                                            clipBehavior: Clip.none,
                                                                                                                            children: [
                                                                                                                              if (listViewOrdersRecord.isFood == true)
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
                                                                                                                                          value: _model.isFoodValueMap1[listViewOrdersRecord] ??= true,
                                                                                                                                          onChanged: _model.disablecheck
                                                                                                                                              ? null
                                                                                                                                              : (newValue) async {
                                                                                                                                                  setState(() => _model.isFoodValueMap1[listViewOrdersRecord] = newValue!);
                                                                                                                                                },
                                                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                          checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
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
                                                                                                                              if (listViewOrdersRecord.isDrink == true)
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
                                                                                                                                          value: _model.isDrinkValueMap1[listViewOrdersRecord] ??= true,
                                                                                                                                          onChanged: _model.disablecheck
                                                                                                                                              ? null
                                                                                                                                              : (newValue) async {
                                                                                                                                                  setState(() => _model.isDrinkValueMap1[listViewOrdersRecord] = newValue!);
                                                                                                                                                },
                                                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                          checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      Text(
                                                                                                                                        'Drink',
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              if (listViewOrdersRecord.isMerc == true)
                                                                                                                                Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: [
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
                                                                                                                                              value: _model.isMercValueMap1[listViewOrdersRecord] ??= true,
                                                                                                                                              onChanged: _model.disablecheck
                                                                                                                                                  ? null
                                                                                                                                                  : (newValue) async {
                                                                                                                                                      setState(() => _model.isMercValueMap1[listViewOrdersRecord] = newValue!);
                                                                                                                                                    },
                                                                                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                              checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
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
                                                                                                                                        if (listViewOrdersRecord.isShirt == true)
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
                                                                                                                                                    value: _model.isShirtValueMap1[listViewOrdersRecord] ??= true,
                                                                                                                                                    onChanged: _model.disablecheck
                                                                                                                                                        ? null
                                                                                                                                                        : (newValue) async {
                                                                                                                                                            setState(() => _model.isShirtValueMap1[listViewOrdersRecord] = newValue!);
                                                                                                                                                          },
                                                                                                                                                    activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                                    checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                                AutoSizeText(
                                                                                                                                                  'Shirt',
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                                ),
                                                                                                                                              ],
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        if (listViewOrdersRecord.isShort == true)
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
                                                                                                                                                    value: _model.isShortValueMap1[listViewOrdersRecord] ??= true,
                                                                                                                                                    onChanged: _model.disablecheck
                                                                                                                                                        ? null
                                                                                                                                                        : (newValue) async {
                                                                                                                                                            setState(() => _model.isShortValueMap1[listViewOrdersRecord] = newValue!);
                                                                                                                                                          },
                                                                                                                                                    activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                                    checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
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
                                                                                                                              if (listViewOrdersRecord.isItem == true)
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
                                                                                                                                          value: _model.isItemsValueMap1[listViewOrdersRecord] ??= true,
                                                                                                                                          onChanged: _model.disablecheck
                                                                                                                                              ? null
                                                                                                                                              : (newValue) async {
                                                                                                                                                  setState(() => _model.isItemsValueMap1[listViewOrdersRecord] = newValue!);
                                                                                                                                                },
                                                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                          checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
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
                                                                                                                              if (listViewOrdersRecord.isOthers == true)
                                                                                                                                Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: [
                                                                                                                                    Expanded(
                                                                                                                                      child: Container(
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
                                                                                                                                                value: _model.othersValueMap1[listViewOrdersRecord] ??= true,
                                                                                                                                                onChanged: _model.disablecheck
                                                                                                                                                    ? null
                                                                                                                                                    : (newValue) async {
                                                                                                                                                        setState(() => _model.othersValueMap1[listViewOrdersRecord] = newValue!);
                                                                                                                                                      },
                                                                                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                                checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
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
                                                                                                                          if (listViewOrdersRecord.haveSize == true)
                                                                                                                            Wrap(
                                                                                                                              spacing: 0.0,
                                                                                                                              runSpacing: 0.0,
                                                                                                                              alignment: WrapAlignment.start,
                                                                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                              direction: Axis.horizontal,
                                                                                                                              runAlignment: WrapAlignment.start,
                                                                                                                              verticalDirection: VerticalDirection.down,
                                                                                                                              clipBehavior: Clip.none,
                                                                                                                              children: [
                                                                                                                                Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: [
                                                                                                                                    if (listViewOrdersRecord.isSmall == true)
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
                                                                                                                                                value: _model.smallValueMap1[listViewOrdersRecord] ??= true,
                                                                                                                                                onChanged: _model.disablecheck
                                                                                                                                                    ? null
                                                                                                                                                    : (newValue) async {
                                                                                                                                                        setState(() => _model.smallValueMap1[listViewOrdersRecord] = newValue!);
                                                                                                                                                      },
                                                                                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                                checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                            Text(
                                                                                                                                              'Small',
                                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                            ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    if (listViewOrdersRecord.isMedium == true)
                                                                                                                                      Flexible(
                                                                                                                                        child: Container(
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
                                                                                                                                                  value: _model.mediumValueMap1[listViewOrdersRecord] ??= true,
                                                                                                                                                  onChanged: _model.disablecheck
                                                                                                                                                      ? null
                                                                                                                                                      : (newValue) async {
                                                                                                                                                          setState(() => _model.mediumValueMap1[listViewOrdersRecord] = newValue!);
                                                                                                                                                        },
                                                                                                                                                  activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                                  checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
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
                                                                                                                                    if (listViewOrdersRecord.isLarge == true)
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
                                                                                                                                                value: _model.largeValueMap1[listViewOrdersRecord] ??= true,
                                                                                                                                                onChanged: _model.disablecheck
                                                                                                                                                    ? null
                                                                                                                                                    : (newValue) async {
                                                                                                                                                        setState(() => _model.largeValueMap1[listViewOrdersRecord] = newValue!);
                                                                                                                                                      },
                                                                                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                                checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                            Text(
                                                                                                                                              'Large',
                                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                            ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    if (listViewOrdersRecord.isExtraLarge == true)
                                                                                                                                      Flexible(
                                                                                                                                        child: Container(
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
                                                                                                                                                  value: _model.extralargeValueMap1[listViewOrdersRecord] ??= true,
                                                                                                                                                  onChanged: _model.disablecheck
                                                                                                                                                      ? null
                                                                                                                                                      : (newValue) async {
                                                                                                                                                          setState(() => _model.extralargeValueMap1[listViewOrdersRecord] = newValue!);
                                                                                                                                                        },
                                                                                                                                                  activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                                  checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
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
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                    child: AutoSizeText(
                                                                                                                      'Status: ${() {
                                                                                                                        if ((listViewOrdersRecord.buyerConfirmation == false) && (listViewOrdersRecord.isApproved == true) && (listViewOrdersRecord.isOrderComplete == false)) {
                                                                                                                          return 'To be Deliver/PickUp';
                                                                                                                        } else if ((listViewOrdersRecord.buyerConfirmation == false) && (listViewOrdersRecord.isApproved == true) && (listViewOrdersRecord.isOrderComplete == true)) {
                                                                                                                          return 'Waiting for Buyer Confirmation';
                                                                                                                        } else if ((listViewOrdersRecord.buyerConfirmation == true) && (listViewOrdersRecord.isApproved == true) && (listViewOrdersRecord.isOrderComplete == true)) {
                                                                                                                          return 'SUCCESS';
                                                                                                                        } else {
                                                                                                                          return 'Pending';
                                                                                                                        }
                                                                                                                      }()}',
                                                                                                                      maxLines: 1,
                                                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                            fontFamily: 'Inter',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            fontSize: 17.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                      children: [
                                                                                                                        Flexible(
                                                                                                                          child: InkWell(
                                                                                                                            splashColor: Colors.transparent,
                                                                                                                            focusColor: Colors.transparent,
                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                            onTap: () async {
                                                                                                                              if ((listViewOrdersRecord.buyerConfirmation == false) && (listViewOrdersRecord.isApproved == false) && (listViewOrdersRecord.isOrderComplete == false)) {
                                                                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                      context: context,
                                                                                                                                      builder: (alertDialogContext) {
                                                                                                                                        return AlertDialog(
                                                                                                                                          title: Text('Notice'),
                                                                                                                                          content: Text('Confirmation to approve the order.'),
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
                                                                                                                                  if (containerProductsRecord.stock >= listViewOrdersRecord.productCount) {
                                                                                                                                    await listViewOrdersRecord.reference.update(createOrdersRecordData(
                                                                                                                                      isApproved: true,
                                                                                                                                    ));
                                                                                                                                  } else {
                                                                                                                                    await showDialog(
                                                                                                                                      context: context,
                                                                                                                                      builder: (alertDialogContext) {
                                                                                                                                        return AlertDialog(
                                                                                                                                          title: Text('Stock Notice'),
                                                                                                                                          content: Text('You have insufficient stock to approve this order Add more stock in your product by updating the product details.'),
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
                                                                                                                                }
                                                                                                                              } else if ((listViewOrdersRecord.buyerConfirmation == false) && (listViewOrdersRecord.isApproved == true) && (listViewOrdersRecord.isOrderComplete == false)) {
                                                                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                      context: context,
                                                                                                                                      builder: (alertDialogContext) {
                                                                                                                                        return AlertDialog(
                                                                                                                                          title: Text('Notice'),
                                                                                                                                          content: Text('Are you sure that the product has been handed to the buyer?'),
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
                                                                                                                                  await containerProductsRecord.reference.update({
                                                                                                                                    ...mapToFirestore(
                                                                                                                                      {
                                                                                                                                        'numOfSold': FieldValue.increment(1),
                                                                                                                                        'Stock': FieldValue.increment(-(listViewOrdersRecord.productCount)),
                                                                                                                                      },
                                                                                                                                    ),
                                                                                                                                  });

                                                                                                                                  await listViewOrdersRecord.reference.update(createOrdersRecordData(
                                                                                                                                    isOrderComplete: true,
                                                                                                                                  ));

                                                                                                                                  await currentUserReference!.update({
                                                                                                                                    ...mapToFirestore(
                                                                                                                                      {
                                                                                                                                        'sales': FieldValue.increment(1),
                                                                                                                                      },
                                                                                                                                    ),
                                                                                                                                  });
                                                                                                                                  await showDialog(
                                                                                                                                    context: context,
                                                                                                                                    builder: (alertDialogContext) {
                                                                                                                                      return AlertDialog(
                                                                                                                                        title: Text('Order notice'),
                                                                                                                                        content: Text('Please wait for the Buyer to confirm the Receival of order.'),
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
                                                                                                                              }
                                                                                                                            },
                                                                                                                            child: Container(
                                                                                                                              height: 32.0,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: Color(0xFF018203),
                                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                                border: Border.all(
                                                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                  width: 2.0,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                                                child: AutoSizeText(
                                                                                                                                  () {
                                                                                                                                    if ((listViewOrdersRecord.buyerConfirmation == false) && (listViewOrdersRecord.isApproved == true) && (listViewOrdersRecord.isOrderComplete == false)) {
                                                                                                                                      return 'Confirm Order  Completion';
                                                                                                                                    } else if ((listViewOrdersRecord.buyerConfirmation == false) && (listViewOrdersRecord.isApproved == true) && (listViewOrdersRecord.isOrderComplete == true)) {
                                                                                                                                      return 'Waiting for Buyer Confirmation';
                                                                                                                                    } else if ((listViewOrdersRecord.buyerConfirmation == true) && (listViewOrdersRecord.isApproved == true) && (listViewOrdersRecord.isOrderComplete == true)) {
                                                                                                                                      return 'COMPLETE';
                                                                                                                                    } else {
                                                                                                                                      return 'Accept';
                                                                                                                                    }
                                                                                                                                  }(),
                                                                                                                                  maxLines: 1,
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        fontFamily: 'Inter',
                                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        if (listViewOrdersRecord.isApproved == false)
                                                                                                                          Flexible(
                                                                                                                            child: InkWell(
                                                                                                                              splashColor: Colors.transparent,
                                                                                                                              focusColor: Colors.transparent,
                                                                                                                              hoverColor: Colors.transparent,
                                                                                                                              highlightColor: Colors.transparent,
                                                                                                                              onTap: () async {
                                                                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                      context: context,
                                                                                                                                      builder: (alertDialogContext) {
                                                                                                                                        return AlertDialog(
                                                                                                                                          title: Text('Notice'),
                                                                                                                                          content: Text('Confirmation to reject the order.'),
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
                                                                                                                                  await listViewOrdersRecord.reference.update(createOrdersRecordData(
                                                                                                                                    isRejected: true,
                                                                                                                                    rejectedAt: getCurrentTimestamp,
                                                                                                                                  ));
                                                                                                                                }
                                                                                                                              },
                                                                                                                              child: Container(
                                                                                                                                height: 32.0,
                                                                                                                                decoration: BoxDecoration(
                                                                                                                                  color: Color(0xFF018203),
                                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                                  border: Border.all(
                                                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                    width: 2.0,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                alignment: AlignmentDirectional(0.00, 0.00),
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                                                  child: AutoSizeText(
                                                                                                                                    'Reject',
                                                                                                                                    maxLines: 1,
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'Inter',
                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                                        ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                      ].divide(SizedBox(width: 4.0)),
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
                                                                                                ),
                                                                                                Divider(
                                                                                                  thickness: 1.0,
                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    KeepAliveWidgetWrapper(
                                                      builder: (context) =>
                                                          SingleChildScrollView(
                                                        primary: false,
                                                        child: Column(
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
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'My products',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displaySmall,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            9.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: PagedListView<
                                                                        DocumentSnapshot<
                                                                            Object?>?,
                                                                        ProductsRecord>(
                                                                      pagingController:
                                                                          _model
                                                                              .setListViewController2(
                                                                        ProductsRecord
                                                                            .collection
                                                                            .where(
                                                                              'userref',
                                                                              isEqualTo: currentUserReference,
                                                                            )
                                                                            .where(
                                                                              'IsArchived',
                                                                              isEqualTo: false,
                                                                            ),
                                                                      ),
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      reverse:
                                                                          false,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      builderDelegate:
                                                                          PagedChildBuilderDelegate<
                                                                              ProductsRecord>(
                                                                        // Customize what your widget looks like when it's loading the first page.
                                                                        firstPageProgressIndicatorBuilder:
                                                                            (_) =>
                                                                                Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        // Customize what your widget looks like when it's loading another page.
                                                                        newPageProgressIndicatorBuilder:
                                                                            (_) =>
                                                                                Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        itemBuilder: (context,
                                                                            _,
                                                                            listViewIndex) {
                                                                          final listViewProductsRecord = _model
                                                                              .listViewPagingController2!
                                                                              .itemList![listViewIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                12.0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 3.0,
                                                                                    color: Color(0x33000000),
                                                                                    offset: Offset(0.0, 1.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                                                                child: SingleChildScrollView(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Text(
                                                                                              'Price',
                                                                                              style: FlutterFlowTheme.of(context).headlineMedium,
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            formatNumber(
                                                                                              listViewProductsRecord.price,
                                                                                              formatType: FormatType.decimal,
                                                                                              decimalType: DecimalType.periodDecimal,
                                                                                              currency: '₱',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 8.0),
                                                                                        child: AutoSizeText(
                                                                                          'Added on ${dateTimeFormat('relative', listViewProductsRecord.createdAt)}',
                                                                                          style: FlutterFlowTheme.of(context).labelMedium,
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                        child: Container(
                                                                                          width: double.infinity,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 44.0,
                                                                                                  height: 44.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      width: 2.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                                    child: InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        await Navigator.push(
                                                                                                          context,
                                                                                                          PageTransition(
                                                                                                            type: PageTransitionType.fade,
                                                                                                            child: FlutterFlowExpandedImageView(
                                                                                                              image: Image.network(
                                                                                                                listViewProductsRecord.image,
                                                                                                                fit: BoxFit.contain,
                                                                                                              ),
                                                                                                              allowRotation: false,
                                                                                                              tag: listViewProductsRecord.image,
                                                                                                              useHeroAnimation: true,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                      child: Hero(
                                                                                                        tag: listViewProductsRecord.image,
                                                                                                        transitionOnUserGestures: true,
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                          child: Image.network(
                                                                                                            listViewProductsRecord.image,
                                                                                                            width: 40.0,
                                                                                                            height: 40.0,
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        AutoSizeText(
                                                                                                          listViewProductsRecord.name,
                                                                                                          style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                                        ),
                                                                                                        AutoSizeText(
                                                                                                          'Shipping Fee: ${listViewProductsRecord.shippingFee.toString()}',
                                                                                                          style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                                        ),
                                                                                                        AutoSizeText(
                                                                                                          'Stock: ${listViewProductsRecord.stock.toString()}',
                                                                                                          style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                                        ),
                                                                                                        AutoSizeText(
                                                                                                          'Payment Method: ${listViewProductsRecord.paymentOpt}',
                                                                                                          style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                                        ),
                                                                                                        AutoSizeText(
                                                                                                          listViewProductsRecord.description.maybeHandleOverflow(
                                                                                                            maxChars: 15,
                                                                                                            replacement: '…',
                                                                                                          ),
                                                                                                          maxLines: 1,
                                                                                                          style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                        ),
                                                                                                        Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                              child: InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  setState(() {
                                                                                                                    _model.seemoreInProd = !_model.seemoreInProd;
                                                                                                                  });
                                                                                                                },
                                                                                                                child: AutoSizeText(
                                                                                                                  _model.seemoreInProd == true ? 'See more...' : 'See less...',
                                                                                                                  maxLines: 1,
                                                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            if (_model.seemoreInProd == false)
                                                                                                              Container(
                                                                                                                decoration: BoxDecoration(),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Wrap(
                                                                                                                      spacing: 0.0,
                                                                                                                      runSpacing: 0.0,
                                                                                                                      alignment: WrapAlignment.start,
                                                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                      direction: Axis.horizontal,
                                                                                                                      runAlignment: WrapAlignment.start,
                                                                                                                      verticalDirection: VerticalDirection.down,
                                                                                                                      clipBehavior: Clip.none,
                                                                                                                      children: [
                                                                                                                        if (listViewProductsRecord.isFood == true)
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
                                                                                                                                    value: _model.isFoodValueMap2[listViewProductsRecord] ??= true,
                                                                                                                                    onChanged: _model.disablecheck
                                                                                                                                        ? null
                                                                                                                                        : (newValue) async {
                                                                                                                                            setState(() => _model.isFoodValueMap2[listViewProductsRecord] = newValue!);
                                                                                                                                          },
                                                                                                                                    activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                    checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
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
                                                                                                                        if (listViewProductsRecord.isDrink == true)
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
                                                                                                                                    value: _model.isDrinkValueMap2[listViewProductsRecord] ??= true,
                                                                                                                                    onChanged: _model.disablecheck
                                                                                                                                        ? null
                                                                                                                                        : (newValue) async {
                                                                                                                                            setState(() => _model.isDrinkValueMap2[listViewProductsRecord] = newValue!);
                                                                                                                                          },
                                                                                                                                    activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                    checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                Text(
                                                                                                                                  'Drink',
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        if (listViewProductsRecord.isMerc == true)
                                                                                                                          Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Flexible(
                                                                                                                                child: ClipRRect(
                                                                                                                                  child: Container(
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
                                                                                                                                            value: _model.isMercValueMap2[listViewProductsRecord] ??= true,
                                                                                                                                            onChanged: _model.disablecheck
                                                                                                                                                ? null
                                                                                                                                                : (newValue) async {
                                                                                                                                                    setState(() => _model.isMercValueMap2[listViewProductsRecord] = newValue!);
                                                                                                                                                  },
                                                                                                                                            activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                            checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
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
                                                                                                                              if (listViewProductsRecord.isShirt == true)
                                                                                                                                Flexible(
                                                                                                                                  child: Container(
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
                                                                                                                                            value: _model.isShirtValueMap2[listViewProductsRecord] ??= true,
                                                                                                                                            onChanged: _model.disablecheck
                                                                                                                                                ? null
                                                                                                                                                : (newValue) async {
                                                                                                                                                    setState(() => _model.isShirtValueMap2[listViewProductsRecord] = newValue!);
                                                                                                                                                  },
                                                                                                                                            activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                            checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
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
                                                                                                                              if (listViewProductsRecord.isShort == true)
                                                                                                                                Flexible(
                                                                                                                                  child: Container(
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
                                                                                                                                            value: _model.isShortValueMap2[listViewProductsRecord] ??= true,
                                                                                                                                            onChanged: _model.disablecheck
                                                                                                                                                ? null
                                                                                                                                                : (newValue) async {
                                                                                                                                                    setState(() => _model.isShortValueMap2[listViewProductsRecord] = newValue!);
                                                                                                                                                  },
                                                                                                                                            activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                            checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
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
                                                                                                                        if (listViewProductsRecord.isItem == true)
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
                                                                                                                                    value: _model.isItemsValueMap2[listViewProductsRecord] ??= true,
                                                                                                                                    onChanged: _model.disablecheck
                                                                                                                                        ? null
                                                                                                                                        : (newValue) async {
                                                                                                                                            setState(() => _model.isItemsValueMap2[listViewProductsRecord] = newValue!);
                                                                                                                                          },
                                                                                                                                    activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                    checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
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
                                                                                                                        if (listViewProductsRecord.isOthers == true)
                                                                                                                          Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Expanded(
                                                                                                                                child: Container(
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
                                                                                                                                          value: _model.othersValueMap2[listViewProductsRecord] ??= true,
                                                                                                                                          onChanged: _model.disablecheck
                                                                                                                                              ? null
                                                                                                                                              : (newValue) async {
                                                                                                                                                  setState(() => _model.othersValueMap2[listViewProductsRecord] = newValue!);
                                                                                                                                                },
                                                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                          checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
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
                                                                                                                    if (listViewProductsRecord.haveSize == true)
                                                                                                                      Wrap(
                                                                                                                        spacing: 0.0,
                                                                                                                        runSpacing: 0.0,
                                                                                                                        alignment: WrapAlignment.start,
                                                                                                                        crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                        direction: Axis.horizontal,
                                                                                                                        runAlignment: WrapAlignment.start,
                                                                                                                        verticalDirection: VerticalDirection.down,
                                                                                                                        clipBehavior: Clip.none,
                                                                                                                        children: [
                                                                                                                          Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              if (listViewProductsRecord.isSmall == true)
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
                                                                                                                                          value: _model.smallValueMap2[listViewProductsRecord] ??= true,
                                                                                                                                          onChanged: _model.disablecheck
                                                                                                                                              ? null
                                                                                                                                              : (newValue) async {
                                                                                                                                                  setState(() => _model.smallValueMap2[listViewProductsRecord] = newValue!);
                                                                                                                                                },
                                                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                          checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      Text(
                                                                                                                                        'Small',
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              if (listViewProductsRecord.isMedium == true)
                                                                                                                                Flexible(
                                                                                                                                  child: Container(
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
                                                                                                                                            value: _model.mediumValueMap2[listViewProductsRecord] ??= true,
                                                                                                                                            onChanged: _model.disablecheck
                                                                                                                                                ? null
                                                                                                                                                : (newValue) async {
                                                                                                                                                    setState(() => _model.mediumValueMap2[listViewProductsRecord] = newValue!);
                                                                                                                                                  },
                                                                                                                                            activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                            checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
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
                                                                                                                              if (listViewProductsRecord.isLarge == true)
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
                                                                                                                                          value: _model.largeValueMap2[listViewProductsRecord] ??= true,
                                                                                                                                          onChanged: _model.disablecheck
                                                                                                                                              ? null
                                                                                                                                              : (newValue) async {
                                                                                                                                                  setState(() => _model.largeValueMap2[listViewProductsRecord] = newValue!);
                                                                                                                                                },
                                                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                          checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      Text(
                                                                                                                                        'Large',
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              if (listViewProductsRecord.isExtraLarge == true)
                                                                                                                                Flexible(
                                                                                                                                  child: Container(
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
                                                                                                                                            value: _model.extralargeValueMap2[listViewProductsRecord] ??= true,
                                                                                                                                            onChanged: _model.disablecheck
                                                                                                                                                ? null
                                                                                                                                                : (newValue) async {
                                                                                                                                                    setState(() => _model.extralargeValueMap2[listViewProductsRecord] = newValue!);
                                                                                                                                                  },
                                                                                                                                            activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                            checkColor: _model.disablecheck ? null : FlutterFlowTheme.of(context).info,
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
                                                                                                          ],
                                                                                                        ),
                                                                                                      ].divide(SizedBox(height: 5.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                  child: FlutterFlowIconButton(
                                                                                                    borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                                    borderRadius: 20.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 40.0,
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    hoverColor: FlutterFlowTheme.of(context).alternate,
                                                                                                    hoverIconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    icon: Icon(
                                                                                                      Icons.more_vert,
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
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
                                                                                                              child: ProductOptWidget(
                                                                                                                prodRef: listViewProductsRecord.reference,
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      ).then((value) => safeSetState(() {}));
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Divider(
                                                                                        thickness: 1.0,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
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
                                                    KeepAliveWidgetWrapper(
                                                      builder: (context) =>
                                                          SingleChildScrollView(
                                                        primary: false,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.00,
                                                                      -1.00),
                                                              child: Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      1400.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    width: 2.0,
                                                                  ),
                                                                ),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  primary:
                                                                      false,
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
                                                                            16.0,
                                                                            16.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'Archived Products',
                                                                              style: FlutterFlowTheme.of(context).displaySmall,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                'Below you are able to manage the orders and update status.',
                                                                                style: FlutterFlowTheme.of(context).labelMedium,
                                                                              ),
                                                                            ),
                                                                            PagedListView<DocumentSnapshot<Object?>?,
                                                                                ProductsRecord>(
                                                                              pagingController: _model.setListViewController3(
                                                                                ProductsRecord.collection
                                                                                    .where(
                                                                                      'userref',
                                                                                      isEqualTo: currentUserReference,
                                                                                    )
                                                                                    .where(
                                                                                      'IsArchived',
                                                                                      isEqualTo: true,
                                                                                    ),
                                                                              ),
                                                                              padding: EdgeInsets.zero,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              reverse: false,
                                                                              scrollDirection: Axis.vertical,
                                                                              builderDelegate: PagedChildBuilderDelegate<ProductsRecord>(
                                                                                // Customize what your widget looks like when it's loading the first page.
                                                                                firstPageProgressIndicatorBuilder: (_) => Center(
                                                                                  child: SizedBox(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                // Customize what your widget looks like when it's loading another page.
                                                                                newPageProgressIndicatorBuilder: (_) => Center(
                                                                                  child: SizedBox(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),

                                                                                itemBuilder: (context, _, listViewIndex) {
                                                                                  final listViewProductsRecord = _model.listViewPagingController3!.itemList![listViewIndex];
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurRadius: 3.0,
                                                                                            color: Color(0x33000000),
                                                                                            offset: Offset(0.0, 1.0),
                                                                                          )
                                                                                        ],
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                                                                        child: SingleChildScrollView(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Text(
                                                                                                      'Price',
                                                                                                      style: FlutterFlowTheme.of(context).headlineMedium,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    formatNumber(
                                                                                                      listViewProductsRecord.price,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                      currency: '₱',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 8.0),
                                                                                                child: AutoSizeText(
                                                                                                  'Added on ${dateTimeFormat('relative', listViewProductsRecord.createdAt)}',
                                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  height: 60.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: 44.0,
                                                                                                          height: 44.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).accent1,
                                                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              width: 2.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                                            child: InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                await Navigator.push(
                                                                                                                  context,
                                                                                                                  PageTransition(
                                                                                                                    type: PageTransitionType.fade,
                                                                                                                    child: FlutterFlowExpandedImageView(
                                                                                                                      image: Image.network(
                                                                                                                        listViewProductsRecord.image,
                                                                                                                        fit: BoxFit.contain,
                                                                                                                      ),
                                                                                                                      allowRotation: false,
                                                                                                                      tag: listViewProductsRecord.image,
                                                                                                                      useHeroAnimation: true,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                              child: Hero(
                                                                                                                tag: listViewProductsRecord.image,
                                                                                                                transitionOnUserGestures: true,
                                                                                                                child: ClipRRect(
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                  child: Image.network(
                                                                                                                    listViewProductsRecord.image,
                                                                                                                    width: 40.0,
                                                                                                                    height: 40.0,
                                                                                                                    fit: BoxFit.cover,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Expanded(
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Flexible(
                                                                                                                  child: AutoSizeText(
                                                                                                                    listViewProductsRecord.name,
                                                                                                                    style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Flexible(
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                    child: AutoSizeText(
                                                                                                                      listViewProductsRecord.description.maybeHandleOverflow(
                                                                                                                        maxChars: 15,
                                                                                                                        replacement: '…',
                                                                                                                      ),
                                                                                                                      maxLines: 1,
                                                                                                                      style: FlutterFlowTheme.of(context).labelMedium,
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
                                                                                              ),
                                                                                              Divider(
                                                                                                thickness: 1.0,
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
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
                                                  ],
                                                ),
                                              ),
                                            ],
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
