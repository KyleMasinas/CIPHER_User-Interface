import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_notification_model.dart';
export 'user_notification_model.dart';

class UserNotificationWidget extends StatefulWidget {
  const UserNotificationWidget({Key? key}) : super(key: key);

  @override
  _UserNotificationWidgetState createState() => _UserNotificationWidgetState();
}

class _UserNotificationWidgetState extends State<UserNotificationWidget> {
  late UserNotificationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserNotificationModel());

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
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('Home');
            },
          ),
          title: Text(
            'Notification',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 14.0, 10.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StreamBuilder<List<NotificationRecord>>(
                      stream: queryNotificationRecord(
                        queryBuilder: (notificationRecord) => notificationRecord
                            .where(
                              'sellerRef',
                              isEqualTo: currentUserReference,
                            )
                            .where(
                              'isOrder',
                              isEqualTo: true,
                            )
                            .orderBy('time_created', descending: true),
                      ),
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
                        List<NotificationRecord>
                            listViewNotificationRecordList = snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewNotificationRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewNotificationRecord =
                                listViewNotificationRecordList[listViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (listViewNotificationRecord.isOrder ==
                                      true) {
                                    await listViewNotificationRecord.reference
                                        .update(createNotificationRecordData(
                                      readAt: getCurrentTimestamp,
                                      isRead: true,
                                    ));

                                    context.pushNamed('MyShop');
                                  } else if (listViewNotificationRecord
                                          .isOrderAccepted ==
                                      true) {
                                    await listViewNotificationRecord.reference
                                        .update(createNotificationRecordData(
                                      readAt: getCurrentTimestamp,
                                      isRead: true,
                                    ));

                                    context.pushNamed('orderHistory');
                                  } else if (listViewNotificationRecord
                                          .isOrderRejected ==
                                      true) {
                                    await listViewNotificationRecord.reference
                                        .update(createNotificationRecordData(
                                      readAt: getCurrentTimestamp,
                                      isRead: true,
                                    ));

                                    context.pushNamed('orderHistory');
                                  }

                                  FFAppState().clearMenuBadgeCache();
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: valueOrDefault<Color>(
                                        listViewNotificationRecord.isRead ==
                                                true
                                            ? FlutterFlowTheme.of(context)
                                                .primaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          9.0, 9.0, 9.0, 9.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AutoSizeText(
                                                  listViewNotificationRecord
                                                      .title
                                                      .maybeHandleOverflow(
                                                          maxChars: 15),
                                                  maxLines: 1,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              listViewNotificationRecord
                                                                          .isRead ==
                                                                      true
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : Color(
                                                                      0xFFF0F0F0),
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                            ),
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                ),
                                                AutoSizeText(
                                                  listViewNotificationRecord
                                                      .description
                                                      .maybeHandleOverflow(
                                                    maxChars: 35,
                                                    replacement: '…',
                                                  ),
                                                  maxLines: 1,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              listViewNotificationRecord
                                                                          .isRead ==
                                                                      true
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : Color(
                                                                      0xFFF0F0F0),
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                            ),
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                ),
                                                AutoSizeText(
                                                  dateTimeFormat(
                                                      'relative',
                                                      listViewNotificationRecord
                                                          .timeCreated!),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              listViewNotificationRecord
                                                                          .isRead ==
                                                                      true
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : Color(
                                                                      0xFFF0F0F0),
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                            ),
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: valueOrDefault<Color>(
                                              listViewNotificationRecord
                                                          .isRead ==
                                                      true
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : Color(0xFFF0F0F0),
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                            ),
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
