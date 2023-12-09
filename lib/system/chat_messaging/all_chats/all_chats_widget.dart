import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_chats_model.dart';
export 'all_chats_model.dart';

class AllChatsWidget extends StatefulWidget {
  const AllChatsWidget({Key? key}) : super(key: key);

  @override
  _AllChatsWidgetState createState() => _AllChatsWidgetState();
}

class _AllChatsWidgetState extends State<AllChatsWidget> {
  late AllChatsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllChatsModel());

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
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('Home');
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
          ),
          title: Text(
            'Messages',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 0.0),
                          child: StreamBuilder<List<ChatsRecord>>(
                            stream: queryChatsRecord(
                              queryBuilder: (chatsRecord) => chatsRecord
                                  .where(
                                    'users',
                                    arrayContains: currentUserReference,
                                  )
                                  .orderBy('last_message_time',
                                      descending: true),
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
                              List<ChatsRecord> listViewChatsRecordList =
                                  snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewChatsRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewChatsRecord =
                                      listViewChatsRecordList[listViewIndex];
                                  return StreamBuilder<FFChatInfo>(
                                    stream: FFChatManager.instance.getChatInfo(
                                        chatRecord: listViewChatsRecord),
                                    builder: (context, snapshot) {
                                      final chatInfo = snapshot.data ??
                                          FFChatInfo(listViewChatsRecord);
                                      return FFChatPreview(
                                        onTap: () => context.pushNamed(
                                          'ChatPage',
                                          queryParameters: {
                                            'chatUser': serializeParam(
                                              chatInfo.otherUsers.length == 1
                                                  ? chatInfo
                                                      .otherUsersList.first
                                                  : null,
                                              ParamType.Document,
                                            ),
                                            'chatRef': serializeParam(
                                              chatInfo.chatRecord.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'chatUser':
                                                chatInfo.otherUsers.length == 1
                                                    ? chatInfo
                                                        .otherUsersList.first
                                                    : null,
                                          },
                                        ),
                                        lastChatText:
                                            chatInfo.chatPreviewMessage(),
                                        lastChatTime:
                                            listViewChatsRecord.lastMessageTime,
                                        seen: listViewChatsRecord
                                            .lastMessageSeenBy!
                                            .contains(currentUserReference),
                                        title: chatInfo.chatPreviewTitle(),
                                        userProfilePic:
                                            chatInfo.chatPreviewPic(),
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        unreadColor: Color(0xFF018203),
                                        titleTextStyle: GoogleFonts.getFont(
                                          'DM Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                        ),
                                        dateTextStyle: GoogleFonts.getFont(
                                          'DM Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.0,
                                        ),
                                        previewTextStyle: GoogleFonts.getFont(
                                          'DM Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.0,
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                3.0, 3.0, 3.0, 3.0),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
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
    );
  }
}
