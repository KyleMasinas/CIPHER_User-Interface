import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'icon_selector_model.dart';
export 'icon_selector_model.dart';

class IconSelectorWidget extends StatefulWidget {
  const IconSelectorWidget({
    Key? key,
    this.currentItem,
    required this.currentColor,
  }) : super(key: key);

  final String? currentItem;
  final Color? currentColor;

  @override
  _IconSelectorWidgetState createState() => _IconSelectorWidgetState();
}

class _IconSelectorWidgetState extends State<IconSelectorWidget>
    with TickerProviderStateMixin {
  late IconSelectorModel _model;

  final animationsMap = {
    'iconOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 700.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 700.ms,
          begin: Offset(-1.0, -1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'iconOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 700.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 700.ms,
          begin: Offset(-1.0, -1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'iconOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 700.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 700.ms,
          begin: Offset(-1.0, -1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'iconOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 700.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 700.ms,
          begin: Offset(-1.0, -1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'iconOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 700.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 700.ms,
          begin: Offset(-1.0, -1.0),
          end: Offset(1.0, 1.0),
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
    _model = createModel(context, () => IconSelectorModel());

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
      width: 40.0,
      height: 40.0,
      child: Stack(
        alignment: AlignmentDirectional(0.0, 0.0),
        children: [
          if (widget.currentItem == 'Home')
            Icon(
              Icons.home_outlined,
              color: valueOrDefault<Color>(
                widget.currentItem == FFAppState().menuActiveitem
                    ? widget.currentColor
                    : FlutterFlowTheme.of(context).primaryText,
                FlutterFlowTheme.of(context).secondaryText,
              ),
              size: 25.0,
            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation1']!),
          if (widget.currentItem == 'Shops')
            Icon(
              Icons.location_history,
              color: valueOrDefault<Color>(
                widget.currentItem == FFAppState().menuActiveitem
                    ? widget.currentColor
                    : FlutterFlowTheme.of(context).primaryBackground,
                FlutterFlowTheme.of(context).secondaryText,
              ),
              size: 25.0,
            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation2']!),
          if (widget.currentItem == 'Message')
            Icon(
              Icons.message_outlined,
              color: valueOrDefault<Color>(
                widget.currentItem == FFAppState().menuActiveitem
                    ? widget.currentColor
                    : FlutterFlowTheme.of(context).secondaryText,
                FlutterFlowTheme.of(context).secondaryText,
              ),
              size: 25.0,
            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation3']!),
          if (widget.currentItem == 'Notification')
            Icon(
              Icons.notifications_none,
              color: valueOrDefault<Color>(
                widget.currentItem == FFAppState().menuActiveitem
                    ? widget.currentColor
                    : FlutterFlowTheme.of(context).secondaryText,
                FlutterFlowTheme.of(context).secondaryText,
              ),
              size: 25.0,
            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation4']!),
          if (widget.currentItem == 'Profile')
            Icon(
              Icons.location_history,
              color: valueOrDefault<Color>(
                widget.currentItem == FFAppState().menuActiveitem
                    ? widget.currentColor
                    : FlutterFlowTheme.of(context).primaryBackground,
                FlutterFlowTheme.of(context).secondaryText,
              ),
              size: 25.0,
            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation5']!),
        ],
      ),
    );
  }
}
