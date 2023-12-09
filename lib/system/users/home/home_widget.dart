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
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
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
    'containerOnPageLoadAnimation2': AnimationInfo(
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
    'containerOnPageLoadAnimation3': AnimationInfo(
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
    'containerOnPageLoadAnimation4': AnimationInfo(
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
    'containerOnPageLoadAnimation5': AnimationInfo(
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
    'containerOnPageLoadAnimation6': AnimationInfo(
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
    'containerOnPageLoadAnimation7': AnimationInfo(
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
    'containerOnPageLoadAnimation8': AnimationInfo(
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
    'containerOnPageLoadAnimation9': AnimationInfo(
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
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (RootPageContext.isInactiveRootPage(context)) {
        return;
      }
      if (valueOrDefault<bool>(currentUserDocument?.isNewUser, false)) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: NewUserWidget(),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
      if (valueOrDefault(currentUserDocument?.address, '') != null &&
          valueOrDefault(currentUserDocument?.address, '') != '') {
        setState(() {
          FFAppState().myAddress =
              valueOrDefault(currentUserDocument?.address, '');
        });
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        context.pushNamed('SearchResult');
      },
    );
    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).alternate,
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
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 10.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController,
                                                focusNode:
                                                    _model.textFieldFocusNode,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Search Products',
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  prefixIcon: Icon(
                                                    Icons.search_outlined,
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                validator: _model
                                                    .textControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                            ))
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 375.0,
                                      decoration: BoxDecoration(),
                                      child: Container(
                                        width: 16.0,
                                        height: 180.0,
                                        child: CarouselSlider(
                                          items: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/cipherrr.png',
                                                width: 0.0,
                                                height: 200.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/Screenshot_2023-11-25_124926.png',
                                                width: 300.0,
                                                height: 200.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ],
                                          carouselController:
                                              _model.carouselController1 ??=
                                                  CarouselController(),
                                          options: CarouselOptions(
                                            initialPage: 0,
                                            viewportFraction: 0.9,
                                            disableCenter: true,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.25,
                                            enableInfiniteScroll: true,
                                            scrollDirection: Axis.horizontal,
                                            autoPlay: true,
                                            autoPlayAnimationDuration:
                                                Duration(milliseconds: 800),
                                            autoPlayInterval: Duration(
                                                milliseconds: (800 + 4000)),
                                            autoPlayCurve: Curves.linear,
                                            pauseAutoPlayInFiniteScroll: true,
                                            onPageChanged: (index, _) => _model
                                                .carouselCurrentIndex1 = index,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            if (responsiveVisibility(
                              context: context,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Container(
                                        width: 16.0,
                                        height: 180.0,
                                        child: CarouselSlider(
                                          items: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/cipherrr.png',
                                                width: 0.0,
                                                height: 200.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/Screenshot_2023-11-25_124926.png',
                                                width: 300.0,
                                                height: 200.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ],
                                          carouselController:
                                              _model.carouselController2 ??=
                                                  CarouselController(),
                                          options: CarouselOptions(
                                            initialPage: 0,
                                            viewportFraction: 0.9,
                                            disableCenter: true,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.25,
                                            enableInfiniteScroll: true,
                                            scrollDirection: Axis.horizontal,
                                            autoPlay: true,
                                            autoPlayAnimationDuration:
                                                Duration(milliseconds: 800),
                                            autoPlayInterval: Duration(
                                                milliseconds: (800 + 4000)),
                                            autoPlayCurve: Curves.linear,
                                            pauseAutoPlayInFiniteScroll: true,
                                            onPageChanged: (index, _) => _model
                                                .carouselCurrentIndex2 = index,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 100.0,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.99,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment(-1.0, 0),
                                            child: FlutterFlowButtonTabBar(
                                              useToggleButtonStyle: false,
                                              isScrollable: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge,
                                              unselectedLabelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              labelColor: Colors.black,
                                              unselectedLabelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              unselectedBorderColor:
                                                  Color(0xFF878080),
                                              borderWidth: 2.0,
                                              borderRadius: 12.0,
                                              elevation: 0.0,
                                              labelPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                              buttonMargin:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              tabs: [
                                                Tab(
                                                  text: 'New Products',
                                                ),
                                                Tab(
                                                  text: 'Foods and Drinks',
                                                ),
                                                Tab(
                                                  text: 'Merchandise',
                                                ),
                                                Tab(
                                                  text: 'Items',
                                                ),
                                                Tab(
                                                  text: 'Miscellaneous',
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
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    PagedGridView<
                                                        DocumentSnapshot<
                                                            Object?>?,
                                                        ProductsRecord>(
                                                      pagingController: _model
                                                          .setGridViewController1(
                                                        ProductsRecord
                                                            .collection
                                                            .where(
                                                              'userref',
                                                              isNotEqualTo:
                                                                  currentUserReference,
                                                            )
                                                            .where(
                                                              'IsArchived',
                                                              isEqualTo: false,
                                                            ),
                                                      ),
                                                      padding: EdgeInsets.zero,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: () {
                                                          if (MediaQuery.sizeOf(context).width <
                                                              479.0) {
                                                            return 2;
                                                          } else if ((MediaQuery.sizeOf(context).width >= 479.0) &&
                                                              (MediaQuery.sizeOf(context).width <
                                                                  767.0)) {
                                                            return 3;
                                                          } else if ((MediaQuery.sizeOf(context).width >= 767.0) &&
                                                              (MediaQuery.sizeOf(context).width <
                                                                  1024.0)) {
                                                            return 4;
                                                          } else if ((MediaQuery.sizeOf(context).width >=
                                                                  1024.0) &&
                                                              (MediaQuery.sizeOf(context).width <
                                                                  1200.0)) {
                                                            return 5;
                                                          } else if ((MediaQuery.sizeOf(context).width >=
                                                                  1200.0) &&
                                                              (MediaQuery.sizeOf(context).width <
                                                                  1350.0)) {
                                                            return 6;
                                                          } else if ((MediaQuery.sizeOf(context).width >=
                                                                  1350.0) &&
                                                              (MediaQuery.sizeOf(context).width <
                                                                  1500.0)) {
                                                            return 7;
                                                          } else if ((MediaQuery.sizeOf(context).width >=
                                                                  1500.0) &&
                                                              (MediaQuery.sizeOf(context).width <
                                                                  1700.0)) {
                                                            return 8;
                                                          } else if ((MediaQuery.sizeOf(context).width >=
                                                                  1700.0) &&
                                                              (MediaQuery.sizeOf(context).width <
                                                                  1800.0)) {
                                                            return 8;
                                                          } else if (MediaQuery.sizeOf(context).width >=
                                                              1800.0) {
                                                            return 9;
                                                          } else {
                                                            return 6;
                                                          }
                                                        }(),
                                                        crossAxisSpacing: 2.0,
                                                        mainAxisSpacing: 2.0,
                                                        childAspectRatio: 1.0,
                                                      ),
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      builderDelegate:
                                                          PagedChildBuilderDelegate<
                                                              ProductsRecord>(
                                                        // Customize what your widget looks like when it's loading the first page.
                                                        firstPageProgressIndicatorBuilder:
                                                            (_) => Center(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: SizedBox(
                                                              width: 40.0,
                                                              height: 40.0,
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
                                                          ),
                                                        ),
                                                        // Customize what your widget looks like when it's loading another page.
                                                        newPageProgressIndicatorBuilder:
                                                            (_) => Center(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: SizedBox(
                                                              width: 40.0,
                                                              height: 40.0,
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
                                                          ),
                                                        ),

                                                        itemBuilder: (context,
                                                            _, gridViewIndex) {
                                                          final gridViewProductsRecord =
                                                              _model.gridViewPagingController1!
                                                                      .itemList![
                                                                  gridViewIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        6.0,
                                                                        4.0,
                                                                        4.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  'ProductDetail',
                                                                  queryParameters:
                                                                      {
                                                                    'prodRef':
                                                                        serializeParam(
                                                                      gridViewProductsRecord,
                                                                      ParamType
                                                                          .Document,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    'prodRef':
                                                                        gridViewProductsRecord,
                                                                  },
                                                                );
                                                              },
                                                              child: Container(
                                                                width: 400.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          2.0,
                                                                      color: Color(
                                                                          0x520E151B),
                                                                      offset: Offset(
                                                                          0.0,
                                                                          1.0),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          12.0,
                                                                          12.0,
                                                                          12.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Hero(
                                                                              tag: 'productMain',
                                                                              transitionOnUserGestures: true,
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                child: Image.network(
                                                                                  '',
                                                                                  width: double.infinity,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.network(
                                                                                gridViewProductsRecord.image,
                                                                                width: 300.0,
                                                                                height: 200.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Flexible(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                child: AutoSizeText(
                                                                                  gridViewProductsRecord.name.maybeHandleOverflow(
                                                                                    maxChars: 10,
                                                                                    replacement: '…',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                AutoSizeText(
                                                                              formatNumber(
                                                                                gridViewProductsRecord.price,
                                                                                formatType: FormatType.decimal,
                                                                                decimalType: DecimalType.periodDecimal,
                                                                                currency: '₱',
                                                                              ),
                                                                              maxLines: 1,
                                                                              style: FlutterFlowTheme.of(context).headlineSmall,
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                              child: AutoSizeText(
                                                                                formatNumber(
                                                                                  gridViewProductsRecord.stock,
                                                                                  formatType: FormatType.compact,
                                                                                ),
                                                                                maxLines: 1,
                                                                                style: FlutterFlowTheme.of(context).labelMedium,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'containerOnPageLoadAnimation1']!),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SingleChildScrollView(
                                                  primary: false,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      PagedGridView<
                                                          DocumentSnapshot<
                                                              Object?>?,
                                                          ProductsRecord>(
                                                        pagingController: _model
                                                            .setGridViewController2(
                                                          ProductsRecord
                                                              .collection
                                                              .where(
                                                                'IsArchived',
                                                                isEqualTo:
                                                                    false,
                                                              )
                                                              .where(
                                                                'userref',
                                                                isNotEqualTo:
                                                                    currentUserReference,
                                                              )
                                                              .where(
                                                                'isFood',
                                                                isEqualTo: true,
                                                              )
                                                              .where(
                                                                'isDrink',
                                                                isEqualTo: true,
                                                              ),
                                                        ),
                                                        padding:
                                                            EdgeInsets.zero,
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: () {
                                                            if (MediaQuery.sizeOf(context).width <
                                                                479.0) {
                                                              return 2;
                                                            } else if ((MediaQuery.sizeOf(context).width >= 479.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    767.0)) {
                                                              return 3;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    767.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1024.0)) {
                                                              return 4;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    1024.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1200.0)) {
                                                              return 5;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    1200.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1350.0)) {
                                                              return 6;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    1350.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1500.0)) {
                                                              return 7;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    1500.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1700.0)) {
                                                              return 8;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    1700.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1800.0)) {
                                                              return 8;
                                                            } else if (MediaQuery.sizeOf(context).width >=
                                                                1800.0) {
                                                              return 9;
                                                            } else {
                                                              return 6;
                                                            }
                                                          }(),
                                                          crossAxisSpacing: 2.0,
                                                          mainAxisSpacing: 2.0,
                                                          childAspectRatio: 1.0,
                                                        ),
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        builderDelegate:
                                                            PagedChildBuilderDelegate<
                                                                ProductsRecord>(
                                                          // Customize what your widget looks like when it's loading the first page.
                                                          firstPageProgressIndicatorBuilder:
                                                              (_) => Center(
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
                                                          ),
                                                          // Customize what your widget looks like when it's loading another page.
                                                          newPageProgressIndicatorBuilder:
                                                              (_) => Center(
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
                                                          ),

                                                          itemBuilder: (context,
                                                              _,
                                                              gridViewIndex) {
                                                            final gridViewProductsRecord = _model
                                                                    .gridViewPagingController2!
                                                                    .itemList![
                                                                gridViewIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          4.0,
                                                                          4.0,
                                                                          4.0),
                                                              child: InkWell(
                                                                splashColor: Colors
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
                                                                  context
                                                                      .pushNamed(
                                                                    'ProductDetail',
                                                                    queryParameters:
                                                                        {
                                                                      'prodRef':
                                                                          serializeParam(
                                                                        gridViewProductsRecord,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'prodRef':
                                                                          gridViewProductsRecord,
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 400.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            2.0,
                                                                        color: Color(
                                                                            0x520E151B),
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            12.0,
                                                                            12.0,
                                                                            12.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Flexible(
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Hero(
                                                                                tag: 'productMain',
                                                                                transitionOnUserGestures: true,
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                  child: Image.network(
                                                                                    '',
                                                                                    width: double.infinity,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  gridViewProductsRecord.image,
                                                                                  width: 300.0,
                                                                                  height: 200.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              12.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Flexible(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                  child: AutoSizeText(
                                                                                    gridViewProductsRecord.name.maybeHandleOverflow(
                                                                                      maxChars: 10,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Flexible(
                                                                              child: AutoSizeText(
                                                                                formatNumber(
                                                                                  gridViewProductsRecord.price,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                  currency: '₱',
                                                                                ),
                                                                                maxLines: 1,
                                                                                style: FlutterFlowTheme.of(context).headlineSmall,
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                child: AutoSizeText(
                                                                                  formatNumber(
                                                                                    gridViewProductsRecord.stock,
                                                                                    formatType: FormatType.compact,
                                                                                  ),
                                                                                  maxLines: 1,
                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'containerOnPageLoadAnimation3']!),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SingleChildScrollView(
                                                  primary: false,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      PagedGridView<
                                                          DocumentSnapshot<
                                                              Object?>?,
                                                          ProductsRecord>(
                                                        pagingController: _model
                                                            .setGridViewController3(
                                                          ProductsRecord
                                                              .collection
                                                              .where(
                                                                'IsArchived',
                                                                isEqualTo:
                                                                    false,
                                                              )
                                                              .where(
                                                                'userref',
                                                                isNotEqualTo:
                                                                    currentUserReference,
                                                              )
                                                              .where(
                                                                'isMerc',
                                                                isEqualTo: true,
                                                              ),
                                                        ),
                                                        padding:
                                                            EdgeInsets.zero,
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: () {
                                                            if (MediaQuery.sizeOf(context).width <
                                                                479.0) {
                                                              return 2;
                                                            } else if ((MediaQuery.sizeOf(context).width >= 479.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    767.0)) {
                                                              return 3;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    767.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1024.0)) {
                                                              return 4;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    1024.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1200.0)) {
                                                              return 5;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    1200.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1350.0)) {
                                                              return 6;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    1350.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1500.0)) {
                                                              return 7;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    1500.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1700.0)) {
                                                              return 8;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    1700.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1800.0)) {
                                                              return 8;
                                                            } else if (MediaQuery.sizeOf(context).width >=
                                                                1800.0) {
                                                              return 9;
                                                            } else {
                                                              return 6;
                                                            }
                                                          }(),
                                                          crossAxisSpacing: 2.0,
                                                          mainAxisSpacing: 2.0,
                                                          childAspectRatio: 1.0,
                                                        ),
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        builderDelegate:
                                                            PagedChildBuilderDelegate<
                                                                ProductsRecord>(
                                                          // Customize what your widget looks like when it's loading the first page.
                                                          firstPageProgressIndicatorBuilder:
                                                              (_) => Center(
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
                                                          ),
                                                          // Customize what your widget looks like when it's loading another page.
                                                          newPageProgressIndicatorBuilder:
                                                              (_) => Center(
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
                                                          ),

                                                          itemBuilder: (context,
                                                              _,
                                                              gridViewIndex) {
                                                            final gridViewProductsRecord = _model
                                                                    .gridViewPagingController3!
                                                                    .itemList![
                                                                gridViewIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          4.0,
                                                                          4.0,
                                                                          4.0),
                                                              child: InkWell(
                                                                splashColor: Colors
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
                                                                  context
                                                                      .pushNamed(
                                                                    'ProductDetail',
                                                                    queryParameters:
                                                                        {
                                                                      'prodRef':
                                                                          serializeParam(
                                                                        gridViewProductsRecord,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'prodRef':
                                                                          gridViewProductsRecord,
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 400.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            2.0,
                                                                        color: Color(
                                                                            0x520E151B),
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            12.0,
                                                                            12.0,
                                                                            12.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Flexible(
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Hero(
                                                                                tag: 'productMain',
                                                                                transitionOnUserGestures: true,
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                  child: Image.network(
                                                                                    '',
                                                                                    width: double.infinity,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  gridViewProductsRecord.image,
                                                                                  width: 300.0,
                                                                                  height: 200.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              12.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Flexible(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                  child: AutoSizeText(
                                                                                    gridViewProductsRecord.name.maybeHandleOverflow(
                                                                                      maxChars: 10,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Flexible(
                                                                              child: AutoSizeText(
                                                                                formatNumber(
                                                                                  gridViewProductsRecord.price,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                  currency: '₱',
                                                                                ),
                                                                                maxLines: 1,
                                                                                style: FlutterFlowTheme.of(context).headlineSmall,
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                child: AutoSizeText(
                                                                                  formatNumber(
                                                                                    gridViewProductsRecord.stock,
                                                                                    formatType: FormatType.compact,
                                                                                  ),
                                                                                  maxLines: 1,
                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'containerOnPageLoadAnimation5']!),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SingleChildScrollView(
                                                  primary: false,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      PagedGridView<
                                                          DocumentSnapshot<
                                                              Object?>?,
                                                          ProductsRecord>(
                                                        pagingController: _model
                                                            .setGridViewController4(
                                                          ProductsRecord
                                                              .collection
                                                              .where(
                                                                'IsArchived',
                                                                isEqualTo:
                                                                    false,
                                                              )
                                                              .where(
                                                                'userref',
                                                                isNotEqualTo:
                                                                    currentUserReference,
                                                              )
                                                              .where(
                                                                'isItem',
                                                                isEqualTo: true,
                                                              ),
                                                        ),
                                                        padding:
                                                            EdgeInsets.zero,
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: () {
                                                            if (MediaQuery.sizeOf(context).width <
                                                                479.0) {
                                                              return 2;
                                                            } else if ((MediaQuery.sizeOf(context).width >= 479.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    767.0)) {
                                                              return 3;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    767.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1024.0)) {
                                                              return 4;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    1024.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1200.0)) {
                                                              return 5;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    1200.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1350.0)) {
                                                              return 6;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    1350.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1500.0)) {
                                                              return 7;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    1500.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1700.0)) {
                                                              return 8;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    1700.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1800.0)) {
                                                              return 8;
                                                            } else if (MediaQuery.sizeOf(context).width >=
                                                                1800.0) {
                                                              return 9;
                                                            } else {
                                                              return 6;
                                                            }
                                                          }(),
                                                          crossAxisSpacing: 2.0,
                                                          mainAxisSpacing: 2.0,
                                                          childAspectRatio: 1.0,
                                                        ),
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        builderDelegate:
                                                            PagedChildBuilderDelegate<
                                                                ProductsRecord>(
                                                          // Customize what your widget looks like when it's loading the first page.
                                                          firstPageProgressIndicatorBuilder:
                                                              (_) => Center(
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
                                                          ),
                                                          // Customize what your widget looks like when it's loading another page.
                                                          newPageProgressIndicatorBuilder:
                                                              (_) => Center(
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
                                                          ),

                                                          itemBuilder: (context,
                                                              _,
                                                              gridViewIndex) {
                                                            final gridViewProductsRecord = _model
                                                                    .gridViewPagingController4!
                                                                    .itemList![
                                                                gridViewIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          4.0,
                                                                          4.0,
                                                                          4.0),
                                                              child: InkWell(
                                                                splashColor: Colors
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
                                                                  context
                                                                      .pushNamed(
                                                                    'ProductDetail',
                                                                    queryParameters:
                                                                        {
                                                                      'prodRef':
                                                                          serializeParam(
                                                                        gridViewProductsRecord,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'prodRef':
                                                                          gridViewProductsRecord,
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 400.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            2.0,
                                                                        color: Color(
                                                                            0x520E151B),
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            12.0,
                                                                            12.0,
                                                                            12.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Flexible(
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Hero(
                                                                                tag: 'productMain',
                                                                                transitionOnUserGestures: true,
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                  child: Image.network(
                                                                                    '',
                                                                                    width: double.infinity,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  gridViewProductsRecord.image,
                                                                                  width: 300.0,
                                                                                  height: 200.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              12.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Flexible(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                  child: AutoSizeText(
                                                                                    gridViewProductsRecord.name.maybeHandleOverflow(
                                                                                      maxChars: 10,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Flexible(
                                                                              child: AutoSizeText(
                                                                                formatNumber(
                                                                                  gridViewProductsRecord.price,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                  currency: '₱',
                                                                                ),
                                                                                maxLines: 1,
                                                                                style: FlutterFlowTheme.of(context).headlineSmall,
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                child: AutoSizeText(
                                                                                  formatNumber(
                                                                                    gridViewProductsRecord.stock,
                                                                                    formatType: FormatType.compact,
                                                                                  ),
                                                                                  maxLines: 1,
                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'containerOnPageLoadAnimation7']!),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SingleChildScrollView(
                                                  primary: false,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      PagedGridView<
                                                          DocumentSnapshot<
                                                              Object?>?,
                                                          ProductsRecord>(
                                                        pagingController: _model
                                                            .setGridViewController5(
                                                          ProductsRecord
                                                              .collection
                                                              .where(
                                                                'IsArchived',
                                                                isEqualTo:
                                                                    false,
                                                              )
                                                              .where(
                                                                'userref',
                                                                isNotEqualTo:
                                                                    currentUserReference,
                                                              )
                                                              .where(
                                                                'IsOthers',
                                                                isEqualTo: true,
                                                              ),
                                                        ),
                                                        padding:
                                                            EdgeInsets.zero,
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: () {
                                                            if (MediaQuery.sizeOf(context).width <
                                                                479.0) {
                                                              return 2;
                                                            } else if ((MediaQuery.sizeOf(context).width >= 479.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    767.0)) {
                                                              return 3;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    767.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1024.0)) {
                                                              return 4;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    1024.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1200.0)) {
                                                              return 5;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    1200.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1350.0)) {
                                                              return 6;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    1350.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1500.0)) {
                                                              return 7;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    1500.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1700.0)) {
                                                              return 8;
                                                            } else if ((MediaQuery.sizeOf(context).width >=
                                                                    1700.0) &&
                                                                (MediaQuery.sizeOf(context).width <
                                                                    1800.0)) {
                                                              return 8;
                                                            } else if (MediaQuery.sizeOf(context).width >=
                                                                1800.0) {
                                                              return 9;
                                                            } else {
                                                              return 6;
                                                            }
                                                          }(),
                                                          crossAxisSpacing: 2.0,
                                                          mainAxisSpacing: 2.0,
                                                          childAspectRatio: 1.0,
                                                        ),
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        builderDelegate:
                                                            PagedChildBuilderDelegate<
                                                                ProductsRecord>(
                                                          // Customize what your widget looks like when it's loading the first page.
                                                          firstPageProgressIndicatorBuilder:
                                                              (_) => Center(
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
                                                          ),
                                                          // Customize what your widget looks like when it's loading another page.
                                                          newPageProgressIndicatorBuilder:
                                                              (_) => Center(
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
                                                          ),

                                                          itemBuilder: (context,
                                                              _,
                                                              gridViewIndex) {
                                                            final gridViewProductsRecord = _model
                                                                    .gridViewPagingController5!
                                                                    .itemList![
                                                                gridViewIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          4.0,
                                                                          4.0,
                                                                          4.0),
                                                              child: InkWell(
                                                                splashColor: Colors
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
                                                                  context
                                                                      .pushNamed(
                                                                    'ProductDetail',
                                                                    queryParameters:
                                                                        {
                                                                      'prodRef':
                                                                          serializeParam(
                                                                        gridViewProductsRecord,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'prodRef':
                                                                          gridViewProductsRecord,
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 400.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            2.0,
                                                                        color: Color(
                                                                            0x520E151B),
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            12.0,
                                                                            12.0,
                                                                            12.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Flexible(
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Hero(
                                                                                tag: 'productMain',
                                                                                transitionOnUserGestures: true,
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                  child: Image.network(
                                                                                    '',
                                                                                    width: double.infinity,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  gridViewProductsRecord.image,
                                                                                  width: 300.0,
                                                                                  height: 200.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              12.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Flexible(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                  child: AutoSizeText(
                                                                                    gridViewProductsRecord.name.maybeHandleOverflow(
                                                                                      maxChars: 10,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Flexible(
                                                                              child: AutoSizeText(
                                                                                formatNumber(
                                                                                  gridViewProductsRecord.price,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                  currency: '₱',
                                                                                ),
                                                                                maxLines: 1,
                                                                                style: FlutterFlowTheme.of(context).headlineSmall,
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                child: AutoSizeText(
                                                                                  'Stocks: ${formatNumber(
                                                                                    gridViewProductsRecord.stock,
                                                                                    formatType: FormatType.compact,
                                                                                  )}',
                                                                                  maxLines: 1,
                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'containerOnPageLoadAnimation9']!),
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
            ],
          ),
        ),
      ),
    );
  }
}
