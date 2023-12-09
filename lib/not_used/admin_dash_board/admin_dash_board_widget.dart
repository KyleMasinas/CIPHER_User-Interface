import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_dash_board_model.dart';
export 'admin_dash_board_model.dart';

class AdminDashBoardWidget extends StatefulWidget {
  const AdminDashBoardWidget({Key? key}) : super(key: key);

  @override
  _AdminDashBoardWidgetState createState() => _AdminDashBoardWidgetState();
}

class _AdminDashBoardWidgetState extends State<AdminDashBoardWidget> {
  late AdminDashBoardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminDashBoardModel());

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
          backgroundColor: Color(0xFFF2DB08),
          automaticallyImplyLeading: false,
          leading: Icon(
            Icons.shopping_cart_outlined,
            color: Color(0xFF018203),
            size: 30.0,
          ),
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await authManager.deleteUser(context);
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    context.goNamedAuth('LogIn', context.mounted);
                  },
                  child: Text(
                    'CIPHER',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Kavoon',
                          color: Color(0xFF054806),
                          fontSize: 20.0,
                        ),
                  ),
                ),
                Text(
                  '- Admin',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Kavoon',
                        color: Color(0xFF054806),
                        fontSize: 15.0,
                      ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 8.0),
                    child: Text(
                      '|',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: Colors.black,
                            fontSize: 25.0,
                          ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      context.goNamedAuth('LogIn', context.mounted);
                    },
                    child: Text(
                      'LOG OUT',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Kavoon',
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  9.0, 9.0, 9.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFF018203),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: Color(0xFFFFD700),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            9.0, 9.0, 9.0, 9.0),
                                        child: Text(
                                          'Dashboard',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            9.0, 9.0, 9.0, 9.0),
                                        child: Text(
                                          'Notifications',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: Colors.black,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            9.0, 9.0, 9.0, 9.0),
                                        child: Text(
                                          ' ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 9.0)),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 10.0, 8.0, 10.0),
                              child: Container(
                                width: double.infinity,
                                constraints: BoxConstraints(
                                  maxWidth: double.infinity,
                                  maxHeight: double.infinity,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF2F2F2),
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      14.0, 14.0, 14.0, 14.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: FutureBuilder<int>(
                                                future: queryUsersRecordCount(
                                                  queryBuilder: (usersRecord) =>
                                                      usersRecord
                                                          .where(
                                                            'IsUser',
                                                            isEqualTo: true,
                                                          )
                                                          .where(
                                                            'IsActive',
                                                            isEqualTo: true,
                                                          )
                                                          .where(
                                                            'UserRole',
                                                            isEqualTo: true,
                                                          ),
                                                ),
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
                                                  int containerCount =
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
                                                          'AdminBuyers');
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF018203),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: Text(
                                                          'Users: ${containerCount.toString()}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: FutureBuilder<int>(
                                                future: queryUsersRecordCount(
                                                  queryBuilder: (usersRecord) =>
                                                      usersRecord
                                                          .where(
                                                            'IsUser',
                                                            isEqualTo: false,
                                                          )
                                                          .where(
                                                            'IsActive',
                                                            isEqualTo: true,
                                                          )
                                                          .where(
                                                            'UserRole',
                                                            isEqualTo: true,
                                                          ),
                                                ),
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
                                                  int containerCount =
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
                                                          'AdminSellers');
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF2DB08),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: Text(
                                                          'Sellers: ${containerCount.toString()}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: FutureBuilder<int>(
                                                future: queryUsersRecordCount(
                                                  queryBuilder: (usersRecord) =>
                                                      usersRecord
                                                          .where(
                                                            'IsActive',
                                                            isEqualTo: false,
                                                          )
                                                          .where(
                                                            'UserRole',
                                                            isEqualTo: true,
                                                          ),
                                                ),
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
                                                  int containerCount =
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
                                                          'AdminDeactivatedUsers');
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFC72525),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: Text(
                                                          'Banned : ${containerCount.toString()}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 15.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: FutureBuilder<int>(
                                                  future: queryUsersRecordCount(
                                                    queryBuilder:
                                                        (usersRecord) =>
                                                            usersRecord
                                                                .where(
                                                                  'IsUser',
                                                                  isEqualTo:
                                                                      true,
                                                                )
                                                                .where(
                                                                  'IsActive',
                                                                  isEqualTo:
                                                                      true,
                                                                )
                                                                .where(
                                                                  'UserRole',
                                                                  isEqualTo:
                                                                      true,
                                                                ),
                                                  ),
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
                                                    int containerCount =
                                                        snapshot.data!;
                                                    return Container(
                                                      height: 200.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: FlipCard(
                                                        fill: Fill.fillBack,
                                                        direction: FlipDirection
                                                            .HORIZONTAL,
                                                        speed: 400,
                                                        front: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: FutureBuilder<
                                                              int>(
                                                            future:
                                                                queryUsersRecordCount(
                                                              queryBuilder:
                                                                  (usersRecord) =>
                                                                      usersRecord
                                                                          .where(
                                                                            'IsActive',
                                                                            isEqualTo:
                                                                                false,
                                                                          )
                                                                          .where(
                                                                            'UserRole',
                                                                            isEqualTo:
                                                                                true,
                                                                          )
                                                                          .where(
                                                                            'IsUser',
                                                                            isEqualTo:
                                                                                false,
                                                                          ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int chartCount =
                                                                  snapshot
                                                                      .data!;
                                                              return FlutterFlowPieChart(
                                                                data:
                                                                    FFPieChartData(
                                                                  values: [
                                                                    formatNumber(
                                                                      containerCount,
                                                                      formatType:
                                                                          FormatType
                                                                              .custom,
                                                                      format:
                                                                          '0',
                                                                      locale:
                                                                          '',
                                                                    ),
                                                                    formatNumber(
                                                                      chartCount,
                                                                      formatType:
                                                                          FormatType
                                                                              .custom,
                                                                      format:
                                                                          '#',
                                                                      locale:
                                                                          '',
                                                                    )
                                                                  ],
                                                                  colors: [
                                                                    Color(
                                                                        0xFF018203),
                                                                    Color(
                                                                        0xFFFFD700)
                                                                  ],
                                                                  radius: [
                                                                    100.0,
                                                                    100.0
                                                                  ],
                                                                  borderWidth: [
                                                                    1.0,
                                                                    1.0
                                                                  ],
                                                                  borderColor: [
                                                                    Colors
                                                                        .black,
                                                                    Colors.black
                                                                  ],
                                                                ),
                                                                donutHoleRadius:
                                                                    0.0,
                                                                donutHoleColor:
                                                                    Colors
                                                                        .transparent,
                                                                sectionLabelType:
                                                                    PieChartSectionLabelType
                                                                        .value,
                                                                sectionLabelStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                labelFormatter:
                                                                    LabelFormatter(
                                                                  numberFormat:
                                                                      (val) =>
                                                                          formatNumber(
                                                                    val,
                                                                    formatType:
                                                                        FormatType
                                                                            .custom,
                                                                    format: '0',
                                                                    locale: '',
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        back: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: FutureBuilder<
                                                              int>(
                                                            future:
                                                                queryUsersRecordCount(
                                                              queryBuilder:
                                                                  (usersRecord) =>
                                                                      usersRecord
                                                                          .where(
                                                                            'IsActive',
                                                                            isEqualTo:
                                                                                false,
                                                                          )
                                                                          .where(
                                                                            'UserRole',
                                                                            isEqualTo:
                                                                                true,
                                                                          ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int chartCount =
                                                                  snapshot
                                                                      .data!;
                                                              return FlutterFlowPieChart(
                                                                data:
                                                                    FFPieChartData(
                                                                  values: [
                                                                    formatNumber(
                                                                      containerCount,
                                                                      formatType:
                                                                          FormatType
                                                                              .custom,
                                                                      format:
                                                                          '0',
                                                                      locale:
                                                                          '',
                                                                    ),
                                                                    formatNumber(
                                                                      chartCount,
                                                                      formatType:
                                                                          FormatType
                                                                              .custom,
                                                                      format:
                                                                          '#',
                                                                      locale:
                                                                          '',
                                                                    )
                                                                  ],
                                                                  colors: [
                                                                    Color(
                                                                        0xFF018203),
                                                                    Color(
                                                                        0xFFC72525)
                                                                  ],
                                                                  radius: [
                                                                    100.0,
                                                                    100.0
                                                                  ],
                                                                  borderWidth: [
                                                                    1.0,
                                                                    1.0
                                                                  ],
                                                                  borderColor: [
                                                                    Colors
                                                                        .black,
                                                                    Colors.black
                                                                  ],
                                                                ),
                                                                donutHoleRadius:
                                                                    0.0,
                                                                donutHoleColor:
                                                                    Colors
                                                                        .transparent,
                                                                sectionLabelType:
                                                                    PieChartSectionLabelType
                                                                        .value,
                                                                sectionLabelStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                labelFormatter:
                                                                    LabelFormatter(
                                                                  numberFormat:
                                                                      (val) =>
                                                                          formatNumber(
                                                                    val,
                                                                    formatType:
                                                                        FormatType
                                                                            .custom,
                                                                    format: '0',
                                                                    locale: '',
                                                                  ),
                                                                ),
                                                              );
                                                            },
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
                                      ].divide(SizedBox(height: 20.0)),
                                    ),
                                  ),
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
          ),
        ),
      ),
    );
  }
}
