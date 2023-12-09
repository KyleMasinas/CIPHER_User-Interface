import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_icon_model.dart';
export 'cart_icon_model.dart';

class CartIconWidget extends StatefulWidget {
  const CartIconWidget({
    Key? key,
    required this.action,
  }) : super(key: key);

  final Future<dynamic> Function()? action;

  @override
  _CartIconWidgetState createState() => _CartIconWidgetState();
}

class _CartIconWidgetState extends State<CartIconWidget> {
  late CartIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartIconModel());

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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 9.0, 0.0),
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
                                badgeColor: FlutterFlowTheme.of(context).error,
                                elevation: 4.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 4.0, 4.0, 4.0),
                                position: badges.BadgePosition.topEnd(),
                                animationType: badges.BadgeAnimationType.scale,
                                toAnimate: true,
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
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
      onEnter: ((event) async {
        setState(() => _model.mouseRegionHovered = true);
      }),
      onExit: ((event) async {
        setState(() => _model.mouseRegionHovered = false);
      }),
    );
  }
}
