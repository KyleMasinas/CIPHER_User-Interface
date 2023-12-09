import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    Key? key,
    this.items,
  }) : super(key: key);

  final List<String>? items;

  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget>
    with TickerProviderStateMixin {
  late NavBarModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.0, 18.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 90.0,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
            child: ClipRect(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 0.0,
                  sigmaY: 0.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, 1.00),
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final menuItem = widget.items?.toList() ?? [];
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                List.generate(menuItem.length, (menuItemIndex) {
                              final menuItemItem = menuItem[menuItemIndex];
                              return Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if ((menuItemItem == 'Home') &&
                                              (FFAppState().menuActiveitem !=
                                                  'Home')) {
                                            context.goNamed('Home');
                                          } else {
                                            if ((menuItemItem == 'Shops') &&
                                                (FFAppState().menuActiveitem !=
                                                    'Shops')) {
                                              context.goNamed('Shops');
                                            } else {
                                              if ((menuItemItem == 'Message') &&
                                                  (FFAppState()
                                                          .menuActiveitem !=
                                                      'Message')) {
                                                context.goNamed('AllChats');
                                              } else {
                                                if ((menuItemItem ==
                                                        'Notification') &&
                                                    (FFAppState()
                                                            .menuActiveitem !=
                                                        'Notification')) {
                                                  context.goNamed(
                                                      'UserNotification');
                                                } else {
                                                  if ((menuItemItem ==
                                                          'Profile') &&
                                                      (FFAppState()
                                                              .menuActiveitem !=
                                                          'Profile')) {
                                                    context
                                                        .goNamed('UserProfile');
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    if (menuItemItem ==
                                                        FFAppState()
                                                            .menuActiveitem)
                                                      Container(
                                                        width: 1.0,
                                                        height: 25.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                      ),
                                                    Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        if (menuItemItem ==
                                                            FFAppState()
                                                                .menuActiveitem)
                                                          Container(
                                                            width: 35.0,
                                                            height: 35.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          14.0),
                                                            ),
                                                          ),
                                                        Container(
                                                          width: 40.0,
                                                          height: 40.0,
                                                          child: Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            children: [
                                                              if (menuItemItem ==
                                                                  'Home')
                                                                Icon(
                                                                  Icons
                                                                      .home_outlined,
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    menuItemItem ==
                                                                            FFAppState()
                                                                                .menuActiveitem
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primaryText
                                                                        : Colors
                                                                            .black,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                  ),
                                                                  size: 20.0,
                                                                ),
                                                              if (menuItemItem ==
                                                                  'Shops')
                                                                Icon(
                                                                  Icons
                                                                      .storefront_sharp,
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    menuItemItem ==
                                                                            FFAppState()
                                                                                .menuActiveitem
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primaryText
                                                                        : Colors
                                                                            .black,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                  ),
                                                                  size: 20.0,
                                                                ),
                                                              if (menuItemItem ==
                                                                  'Message')
                                                                Icon(
                                                                  Icons
                                                                      .message_outlined,
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    menuItemItem ==
                                                                            FFAppState()
                                                                                .menuActiveitem
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primaryText
                                                                        : Colors
                                                                            .black,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                  ),
                                                                  size: 20.0,
                                                                ),
                                                              if (menuItemItem ==
                                                                  'Notification')
                                                                Icon(
                                                                  Icons
                                                                      .notifications_none,
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    menuItemItem ==
                                                                            FFAppState()
                                                                                .menuActiveitem
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primaryText
                                                                        : Colors
                                                                            .black,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                  ),
                                                                  size: 20.0,
                                                                ),
                                                              if (menuItemItem ==
                                                                  'Profile')
                                                                Icon(
                                                                  Icons
                                                                      .location_history,
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    menuItemItem ==
                                                                            FFAppState()
                                                                                .menuActiveitem
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primaryText
                                                                        : Colors
                                                                            .black,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                  ),
                                                                  size: 20.0,
                                                                ),
                                                            ],
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
                                    ),
                                    if (menuItemItem ==
                                        FFAppState().menuActiveitem)
                                      Container(
                                        width: 45.0,
                                        height: 5.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation2']!),
                                  ],
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
