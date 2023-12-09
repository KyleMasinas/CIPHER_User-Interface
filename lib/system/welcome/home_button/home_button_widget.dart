import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_button_model.dart';
export 'home_button_model.dart';

class HomeButtonWidget extends StatefulWidget {
  const HomeButtonWidget({
    Key? key,
    required this.action,
  }) : super(key: key);

  final Future<dynamic> Function()? action;

  @override
  _HomeButtonWidgetState createState() => _HomeButtonWidgetState();
}

class _HomeButtonWidgetState extends State<HomeButtonWidget>
    with TickerProviderStateMixin {
  late HomeButtonModel _model;

  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.2, 1.2),
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
    _model = createModel(context, () => HomeButtonModel());

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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return MouseRegion(
      opaque: false,
      cursor: SystemMouseCursors.click ?? MouseCursor.defer,
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed('Home');
        },
        child: Stack(
          alignment: AlignmentDirectional(0.0, 0.0),
          children: [
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, 1.0),
                  )
                ],
                gradient: LinearGradient(
                  colors: [Color(0x4D39EF59), Color(0xFFFFD700)],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(1.0, -1.0),
                  end: AlignmentDirectional(-1.0, 1.0),
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.easeInOut,
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      _model.mouseRegionHovered!
                          ? Colors.transparent
                          : Color(0xFF25254F),
                      Color(0x4D39EF59),
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
              ),
            ),
            Icon(
              Icons.home_rounded,
              color: Color(0xFFDDD7D7),
              size: 20.0,
            ).animateOnActionTrigger(
              animationsMap['iconOnActionTriggerAnimation']!,
            ),
          ],
        ),
      ),
      onEnter: ((event) async {
        setState(() => _model.mouseRegionHovered = true);
        if (animationsMap['iconOnActionTriggerAnimation'] != null) {
          animationsMap['iconOnActionTriggerAnimation']!
              .controller
              .forward(from: 0.0);
        }
      }),
      onExit: ((event) async {
        setState(() => _model.mouseRegionHovered = false);
        if (animationsMap['iconOnActionTriggerAnimation'] != null) {
          animationsMap['iconOnActionTriggerAnimation']!.controller.reverse();
        }
      }),
    );
  }
}
