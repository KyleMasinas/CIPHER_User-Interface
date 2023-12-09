import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/system/menu/dropdown_menu/dropdown_menu_widget.dart';
import '/system/welcome/home_button/home_button_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
export 'cart_model.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> with TickerProviderStateMixin {
  late CartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'iconOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          hz: 10,
          offset: Offset(0.0, 0.0),
          rotation: 0.087,
        ),
      ],
    ),
    'iconOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          hz: 10,
          offset: Offset(0.0, 0.0),
          rotation: 0.087,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartModel());

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
          actions: [],
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
                                                        'Cart',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 16.0, 44.0),
                                          child: Wrap(
                                            spacing: 16.0,
                                            runSpacing: 16.0,
                                            alignment: WrapAlignment.center,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: [
                                              Container(
                                                constraints: BoxConstraints(
                                                  maxWidth: 830.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  16.0,
                                                                  16.0,
                                                                  16.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Your Cart',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge,
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          12.0),
                                                              child: Text(
                                                                'Below is the list of items in your cart.',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                              ),
                                                            ),
                                                            StreamBuilder<
                                                                List<
                                                                    CartRecord>>(
                                                              stream:
                                                                  queryCartRecord(
                                                                queryBuilder: (cartRecord) =>
                                                                    cartRecord
                                                                        .where(
                                                                          'userRef',
                                                                          isEqualTo:
                                                                              currentUserReference,
                                                                        )
                                                                        .orderBy(
                                                                            'addedAt',
                                                                            descending:
                                                                                true),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<CartRecord>
                                                                    listViewCartRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      listViewCartRecordList
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          listViewIndex) {
                                                                    final listViewCartRecord =
                                                                        listViewCartRecordList[
                                                                            listViewIndex];
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                                      child: StreamBuilder<
                                                                          ProductsRecord>(
                                                                        stream:
                                                                            ProductsRecord.getDocument(listViewCartRecord.products!),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          final menuItemProductsRecord =
                                                                              snapshot.data!;
                                                                          return Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              boxShadow: [
                                                                                BoxShadow(
                                                                                  blurRadius: 0.0,
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  offset: Offset(0.0, 1.0),
                                                                                )
                                                                              ],
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                                        value: _model.checkboxValueMap[listViewCartRecord] ??= _model.check,
                                                                                        onChanged: (newValue) async {
                                                                                          setState(() => _model.checkboxValueMap[listViewCartRecord] = newValue!);
                                                                                        },
                                                                                        activeColor: FlutterFlowTheme.of(context).primary,
                                                                                        checkColor: FlutterFlowTheme.of(context).info,
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(1.00, -1.00),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                        child: FlutterFlowIconButton(
                                                                                          borderColor: FlutterFlowTheme.of(context).primary,
                                                                                          borderRadius: 5.0,
                                                                                          borderWidth: 2.0,
                                                                                          buttonSize: 40.0,
                                                                                          fillColor: FlutterFlowTheme.of(context).accent1,
                                                                                          icon: Icon(
                                                                                            Icons.delete,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            size: 20.0,
                                                                                          ),
                                                                                          showLoadingIndicator: true,
                                                                                          onPressed: () async {
                                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                                  context: context,
                                                                                                  builder: (alertDialogContext) {
                                                                                                    return AlertDialog(
                                                                                                      title: Text('Notice'),
                                                                                                      content: Text('Confirm to continue removing this product'),
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
                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                SnackBar(
                                                                                                  content: Text(
                                                                                                    'The action was successfull.',
                                                                                                    style: TextStyle(
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                                  ),
                                                                                                  duration: Duration(milliseconds: 4000),
                                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                ),
                                                                                              );

                                                                                              await currentUserReference!.update({
                                                                                                ...mapToFirestore(
                                                                                                  {
                                                                                                    'CartLimit': FieldValue.increment(-(1)),
                                                                                                  },
                                                                                                ),
                                                                                              });
                                                                                              await listViewCartRecord.reference.delete();
                                                                                              FFAppState().clearCartBadgeCache();
                                                                                              setState(() {
                                                                                                _model.check = false;
                                                                                              });
                                                                                            }
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 12.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                          child: SingleChildScrollView(
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
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
                                                                                                                listViewCartRecord.image,
                                                                                                                fit: BoxFit.contain,
                                                                                                              ),
                                                                                                              allowRotation: false,
                                                                                                              tag: listViewCartRecord.image,
                                                                                                              useHeroAnimation: true,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                      child: Hero(
                                                                                                        tag: listViewCartRecord.image,
                                                                                                        transitionOnUserGestures: true,
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                          child: Image.network(
                                                                                                            listViewCartRecord.image,
                                                                                                            width: 300.0,
                                                                                                            height: 300.0,
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                  child: AutoSizeText(
                                                                                                    menuItemProductsRecord.name.maybeHandleOverflow(
                                                                                                      maxChars: 20,
                                                                                                      replacement: '…',
                                                                                                    ),
                                                                                                    textAlign: TextAlign.start,
                                                                                                    maxLines: 2,
                                                                                                    style: FlutterFlowTheme.of(context).titleLarge,
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                  child: AutoSizeText(
                                                                                                    'Quantity: ${listViewCartRecord.productCount.toString()}',
                                                                                                    textAlign: TextAlign.start,
                                                                                                    maxLines: 1,
                                                                                                    style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          fontSize: 18.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                  child: AutoSizeText(
                                                                                                    'Payment Method: ${menuItemProductsRecord.paymentOpt}',
                                                                                                    textAlign: TextAlign.start,
                                                                                                    maxLines: 1,
                                                                                                    style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          fontSize: 18.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                if (menuItemProductsRecord.paymentOpt == 'Cash On Pick-up')
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                    child: AutoSizeText(
                                                                                                      'Pick Up Address: ${menuItemProductsRecord.pickUpAddress}',
                                                                                                      textAlign: TextAlign.start,
                                                                                                      maxLines: 1,
                                                                                                      style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            fontSize: 18.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                  child: AutoSizeText(
                                                                                                    'Shipping Fee: ${formatNumber(
                                                                                                      menuItemProductsRecord.shippingFee,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                      currency: '₱',
                                                                                                    )}',
                                                                                                    textAlign: TextAlign.start,
                                                                                                    maxLines: 1,
                                                                                                    style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          fontSize: 18.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                  child: AutoSizeText(
                                                                                                    'Price: ${formatNumber(
                                                                                                      menuItemProductsRecord.price,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                      currency: '₱',
                                                                                                    )}',
                                                                                                    textAlign: TextAlign.start,
                                                                                                    maxLines: 1,
                                                                                                    style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          fontSize: 18.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                  child: AutoSizeText(
                                                                                                    'Total Payment: ${functions.totalpayment(functions.increment(menuItemProductsRecord.price, listViewCartRecord.productCount)!, listViewCartRecord.shipping).toString()}',
                                                                                                    textAlign: TextAlign.start,
                                                                                                    maxLines: 2,
                                                                                                    style: FlutterFlowTheme.of(context).titleLarge,
                                                                                                  ),
                                                                                                ),
                                                                                                InkWell(
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
                                                                                                    textAlign: TextAlign.start,
                                                                                                    maxLines: 2,
                                                                                                    style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          fontSize: 17.0,
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
                                                                                                            if ((menuItemProductsRecord.isFood == false) || (menuItemProductsRecord.isFood == null))
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
                                                                                                                        value: _model.isFoodValueMap[listViewCartRecord] ??= false,
                                                                                                                        onChanged: FFAppState().alwaysTrue
                                                                                                                            ? null
                                                                                                                            : (newValue) async {
                                                                                                                                setState(() => _model.isFoodValueMap[listViewCartRecord] = newValue!);
                                                                                                                              },
                                                                                                                        activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                        checkColor: FFAppState().alwaysTrue ? null : FlutterFlowTheme.of(context).info,
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
                                                                                                            if ((menuItemProductsRecord.isDrink == false) || (menuItemProductsRecord.isDrink == null))
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
                                                                                                                        value: _model.isDrinkValueMap[listViewCartRecord] ??= false,
                                                                                                                        onChanged: FFAppState().alwaysTrue
                                                                                                                            ? null
                                                                                                                            : (newValue) async {
                                                                                                                                setState(() => _model.isDrinkValueMap[listViewCartRecord] = newValue!);
                                                                                                                              },
                                                                                                                        activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                        checkColor: FFAppState().alwaysTrue ? null : FlutterFlowTheme.of(context).info,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      'Drink',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            if ((menuItemProductsRecord.isMerc == false) || (menuItemProductsRecord.isMerc == null))
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
                                                                                                                            value: _model.isMercValueMap[listViewCartRecord] ??= false,
                                                                                                                            onChanged: FFAppState().alwaysTrue
                                                                                                                                ? null
                                                                                                                                : (newValue) async {
                                                                                                                                    setState(() => _model.isMercValueMap[listViewCartRecord] = newValue!);
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
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      if ((menuItemProductsRecord.isShirt == false) || (menuItemProductsRecord.isShirt == null))
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
                                                                                                                                  value: _model.isShirtValueMap[listViewCartRecord] ??= false,
                                                                                                                                  onChanged: FFAppState().alwaysTrue
                                                                                                                                      ? null
                                                                                                                                      : (newValue) async {
                                                                                                                                          setState(() => _model.isShirtValueMap[listViewCartRecord] = newValue!);
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
                                                                                                                      if ((menuItemProductsRecord.isShort == false) || (menuItemProductsRecord.isShort == null))
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
                                                                                                                                  value: _model.isShortValueMap[listViewCartRecord] ??= false,
                                                                                                                                  onChanged: FFAppState().alwaysTrue
                                                                                                                                      ? null
                                                                                                                                      : (newValue) async {
                                                                                                                                          setState(() => _model.isShortValueMap[listViewCartRecord] = newValue!);
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
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            if ((menuItemProductsRecord.isItem == false) || (menuItemProductsRecord.isItem == null))
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
                                                                                                                        value: _model.isItemsValueMap[listViewCartRecord] ??= false,
                                                                                                                        onChanged: FFAppState().alwaysTrue
                                                                                                                            ? null
                                                                                                                            : (newValue) async {
                                                                                                                                setState(() => _model.isItemsValueMap[listViewCartRecord] = newValue!);
                                                                                                                              },
                                                                                                                        activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                        checkColor: FFAppState().alwaysTrue ? null : FlutterFlowTheme.of(context).info,
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
                                                                                                            if ((menuItemProductsRecord.isOthers == false) || (menuItemProductsRecord.isOthers == null))
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
                                                                                                                              value: _model.othersValueMap[listViewCartRecord] ??= false,
                                                                                                                              onChanged: FFAppState().alwaysTrue
                                                                                                                                  ? null
                                                                                                                                  : (newValue) async {
                                                                                                                                      setState(() => _model.othersValueMap[listViewCartRecord] = newValue!);
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
                                                                                                                ].divide(SizedBox(width: 15.0)),
                                                                                                              ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        if ((menuItemProductsRecord.haveSize == false) || (menuItemProductsRecord.haveSize == null))
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
                                                                                                                  if ((menuItemProductsRecord.isSmall == false) || (menuItemProductsRecord.isSmall == null))
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
                                                                                                                              value: _model.smallValueMap[listViewCartRecord] ??= false,
                                                                                                                              onChanged: FFAppState().alwaysTrue
                                                                                                                                  ? null
                                                                                                                                  : (newValue) async {
                                                                                                                                      setState(() => _model.smallValueMap[listViewCartRecord] = newValue!);
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
                                                                                                                  if ((menuItemProductsRecord.isMedium == false) || (menuItemProductsRecord.isMedium == null))
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
                                                                                                                                value: _model.mediumValueMap[listViewCartRecord] ??= false,
                                                                                                                                onChanged: FFAppState().alwaysTrue
                                                                                                                                    ? null
                                                                                                                                    : (newValue) async {
                                                                                                                                        setState(() => _model.mediumValueMap[listViewCartRecord] = newValue!);
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
                                                                                                                ].divide(SizedBox(width: 15.0)),
                                                                                                              ),
                                                                                                              Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  if ((menuItemProductsRecord.isLarge == false) || (menuItemProductsRecord.isLarge == null))
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
                                                                                                                              value: _model.largeValueMap[listViewCartRecord] ??= false,
                                                                                                                              onChanged: FFAppState().alwaysTrue
                                                                                                                                  ? null
                                                                                                                                  : (newValue) async {
                                                                                                                                      setState(() => _model.largeValueMap[listViewCartRecord] = newValue!);
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
                                                                                                                  if ((menuItemProductsRecord.isExtraLarge == false) || (menuItemProductsRecord.isExtraLarge == null))
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
                                                                                                                                value: _model.extralargeValueMap[listViewCartRecord] ??= false,
                                                                                                                                onChanged: FFAppState().alwaysTrue
                                                                                                                                    ? null
                                                                                                                                    : (newValue) async {
                                                                                                                                        setState(() => _model.extralargeValueMap[listViewCartRecord] = newValue!);
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
                                                                                                                ].divide(SizedBox(width: 15.0)),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.00, 0.00),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 9.0, 0.0),
                                                                                                        child: Container(
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            borderRadius: BorderRadius.circular(15.0),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: InkWell(
                                                                                                                    splashColor: Colors.transparent,
                                                                                                                    focusColor: Colors.transparent,
                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                    onTap: () async {
                                                                                                                      if (listViewCartRecord.productCount > 1) {
                                                                                                                        await listViewCartRecord.reference.update({
                                                                                                                          ...mapToFirestore(
                                                                                                                            {
                                                                                                                              'productCount': FieldValue.increment(-(1)),
                                                                                                                            },
                                                                                                                          ),
                                                                                                                        });

                                                                                                                        await listViewCartRecord.reference.update(createCartRecordData(
                                                                                                                          totalPayment: functions.totalpayment(functions.increment(menuItemProductsRecord.price, listViewCartRecord.productCount)!, listViewCartRecord.shipping),
                                                                                                                        ));
                                                                                                                      } else {
                                                                                                                        await showDialog(
                                                                                                                          context: context,
                                                                                                                          builder: (alertDialogContext) {
                                                                                                                            return AlertDialog(
                                                                                                                              title: Text('Notice'),
                                                                                                                              content: Text('You only have one product left.'),
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
                                                                                                                    },
                                                                                                                    child: FaIcon(
                                                                                                                      FontAwesomeIcons.minus,
                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                      size: 30.0,
                                                                                                                    ),
                                                                                                                  ).animateOnActionTrigger(
                                                                                                                    animationsMap['iconOnActionTriggerAnimation1']!,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                SizedBox(
                                                                                                                  height: 20.0,
                                                                                                                  child: VerticalDivider(
                                                                                                                    thickness: 1.0,
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: AutoSizeText(
                                                                                                                    formatNumber(
                                                                                                                      listViewCartRecord.productCount,
                                                                                                                      formatType: FormatType.custom,
                                                                                                                      format: '#',
                                                                                                                      locale: '',
                                                                                                                    ),
                                                                                                                    maxLines: 1,
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Inter',
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                          fontSize: 25.0,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                SizedBox(
                                                                                                                  height: 20.0,
                                                                                                                  child: VerticalDivider(
                                                                                                                    thickness: 1.0,
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: InkWell(
                                                                                                                    splashColor: Colors.transparent,
                                                                                                                    focusColor: Colors.transparent,
                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                    onTap: () async {
                                                                                                                      if ((menuItemProductsRecord.stock > 0) && (listViewCartRecord.productCount <= menuItemProductsRecord.stock)) {
                                                                                                                        await listViewCartRecord.reference.update({
                                                                                                                          ...mapToFirestore(
                                                                                                                            {
                                                                                                                              'productCount': FieldValue.increment(1),
                                                                                                                            },
                                                                                                                          ),
                                                                                                                        });

                                                                                                                        await listViewCartRecord.reference.update(createCartRecordData(
                                                                                                                          totalPayment: functions.totalpayment(functions.increment(menuItemProductsRecord.price, listViewCartRecord.productCount)!, listViewCartRecord.shipping),
                                                                                                                        ));
                                                                                                                      } else {
                                                                                                                        await showDialog(
                                                                                                                          context: context,
                                                                                                                          builder: (alertDialogContext) {
                                                                                                                            return AlertDialog(
                                                                                                                              title: Text('Notice'),
                                                                                                                              content: Text('The product has insufficient stock.'),
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
                                                                                                                    },
                                                                                                                    child: FaIcon(
                                                                                                                      FontAwesomeIcons.plus,
                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                      size: 30.0,
                                                                                                                    ),
                                                                                                                  ).animateOnActionTrigger(
                                                                                                                    animationsMap['iconOnActionTriggerAnimation2']!,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ].divide(SizedBox(width: 10.0)),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Flexible(
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                        child: FFButtonWidget(
                                                                                                          onPressed: () async {
                                                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                                                  context: context,
                                                                                                                  builder: (alertDialogContext) {
                                                                                                                    return AlertDialog(
                                                                                                                      title: Text('Notice'),
                                                                                                                      content: Text('You will now checkout the product in your cart.'),
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
                                                                                                              if ((menuItemProductsRecord.stock > 0) && (listViewCartRecord.productCount <= menuItemProductsRecord.stock)) {
                                                                                                                unawaited(
                                                                                                                  () async {
                                                                                                                    await showDialog(
                                                                                                                      context: context,
                                                                                                                      builder: (alertDialogContext) {
                                                                                                                        return AlertDialog(
                                                                                                                          title: Text('Checkout Notice'),
                                                                                                                          content: Text('You successfully check out the product.'),
                                                                                                                          actions: [
                                                                                                                            TextButton(
                                                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                              child: Text('Ok'),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        );
                                                                                                                      },
                                                                                                                    );
                                                                                                                  }(),
                                                                                                                );

                                                                                                                await OrdersRecord.collection.doc().set(createOrdersRecordData(
                                                                                                                      userRef: currentUserReference,
                                                                                                                      productCount: listViewCartRecord.productCount,
                                                                                                                      subtotal: functions.increment(menuItemProductsRecord.price, listViewCartRecord.productCount),
                                                                                                                      totalPayment: functions.totalpayment(functions.increment(menuItemProductsRecord.price, listViewCartRecord.productCount)!, listViewCartRecord.shipping),
                                                                                                                      description: menuItemProductsRecord.description,
                                                                                                                      price: menuItemProductsRecord.price,
                                                                                                                      products: menuItemProductsRecord.reference,
                                                                                                                      isOrdered: true,
                                                                                                                      isApproved: false,
                                                                                                                      shipping: listViewCartRecord.shipping,
                                                                                                                      name: menuItemProductsRecord.name,
                                                                                                                      sellerRef: listViewCartRecord.sellerRef,
                                                                                                                      orderedAt: getCurrentTimestamp,
                                                                                                                      isRejected: false,
                                                                                                                      isOrderComplete: false,
                                                                                                                      buyerConfirmation: false,
                                                                                                                      buyerAddress: valueOrDefault(currentUserDocument?.address, ''),
                                                                                                                      buyerName: currentUserDisplayName,
                                                                                                                      buyerShippingAddress: valueOrDefault(currentUserDocument?.address, ''),
                                                                                                                      buyerPhoneNumber: currentPhoneNumber,
                                                                                                                      buyerEmail: currentUserEmail,
                                                                                                                      buyerRef: currentUserReference,
                                                                                                                      pickUpAddress: menuItemProductsRecord.pickUpAddress,
                                                                                                                      paymentOpt: menuItemProductsRecord.paymentOpt,
                                                                                                                      sellerName: listViewCartRecord.sellerName,
                                                                                                                      shopName: listViewCartRecord.shopName,
                                                                                                                      isSmall: menuItemProductsRecord.isSmall,
                                                                                                                      isMedium: menuItemProductsRecord.isMedium,
                                                                                                                      isLarge: menuItemProductsRecord.isLarge,
                                                                                                                      isExtraLarge: menuItemProductsRecord.isExtraLarge,
                                                                                                                      isFood: menuItemProductsRecord.isFood,
                                                                                                                      isMerc: menuItemProductsRecord.isMerc,
                                                                                                                      isDrink: menuItemProductsRecord.isDrink,
                                                                                                                      isOthers: menuItemProductsRecord.isOthers,
                                                                                                                      isItem: menuItemProductsRecord.isItem,
                                                                                                                      isShirt: menuItemProductsRecord.isShirt,
                                                                                                                      isShort: menuItemProductsRecord.isShort,
                                                                                                                      haveSize: menuItemProductsRecord.haveSize,
                                                                                                                      image: menuItemProductsRecord.image,
                                                                                                                    ));
                                                                                                                await listViewCartRecord.reference.delete();

                                                                                                                await currentUserReference!.update({
                                                                                                                  ...mapToFirestore(
                                                                                                                    {
                                                                                                                      'CartLimit': FieldValue.increment(-(1)),
                                                                                                                    },
                                                                                                                  ),
                                                                                                                });
                                                                                                                FFAppState().totalpayment = functions.totalpayment(functions.increment(menuItemProductsRecord.price, listViewCartRecord.productCount)!, listViewCartRecord.shipping)!;
                                                                                                                FFAppState().name = menuItemProductsRecord.name;
                                                                                                                FFAppState().quantity = listViewCartRecord.productCount.toString();
                                                                                                                FFAppState().shipfee = listViewCartRecord.shipping;
                                                                                                                FFAppState().price = menuItemProductsRecord.price;

                                                                                                                await NotificationRecord.collection.doc().set(createNotificationRecordData(
                                                                                                                      title: 'Customer Orders!',
                                                                                                                      description: 'Successful order to your product!',
                                                                                                                      timeCreated: getCurrentTimestamp,
                                                                                                                      prodRef: menuItemProductsRecord.reference,
                                                                                                                      buyerRef: currentUserReference,
                                                                                                                      sellerRef: menuItemProductsRecord.userref,
                                                                                                                      isReport: false,
                                                                                                                      isOrder: true,
                                                                                                                      receivedBy: menuItemProductsRecord.userref,
                                                                                                                      isOrderAccepted: false,
                                                                                                                      isOrderRejected: false,
                                                                                                                      isRead: false,
                                                                                                                    ));
                                                                                                                FFAppState().clearCartBadgeCache();
                                                                                                              }
                                                                                                            }
                                                                                                          },
                                                                                                          text: 'Checkout This Product',
                                                                                                          options: FFButtonOptions(
                                                                                                            width: double.infinity,
                                                                                                            height: 48.0,
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                ),
                                                                                                            elevation: 2.0,
                                                                                                            borderSide: BorderSide(
                                                                                                              color: Colors.transparent,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(50.0),
                                                                                                            hoverColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            hoverBorderSide: BorderSide(
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                            hoverTextColor: FlutterFlowTheme.of(context).primary,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 9.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.00,
                                                                      0.00),
                                                              child: Container(
                                                                width: 400.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      tabletLandscape: false,
                                                      desktop: false,
                                                    ))
                                                      Container(
                                                        width: double.infinity,
                                                        height: 80.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                constraints: BoxConstraints(
                                                  maxWidth: 830.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0,
                                                          16.0, 24.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons.list_alt,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                          AutoSizeText(
                                                            'Payment Details',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: AutoSizeText(
                                                          'The total payment is only the sum of all your item in your Cart. Please ready your payment seperately for respective seller of each product.',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                        ),
                                                      ),
                                                      Divider(
                                                        height: 32.0,
                                                        thickness: 2.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
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
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                AutoSizeText(
                                                                  'Sub Total:',
                                                                  maxLines: 1,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                AutoSizeText(
                                                                  formatNumber(
                                                                    functions.checkouttotal(_model
                                                                        .checkboxCheckedItems
                                                                        .map((e) =>
                                                                            valueOrDefault<double>(
                                                                              e.totalPayment,
                                                                              0.0,
                                                                            ))
                                                                        .toList()),
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .automatic,
                                                                    currency:
                                                                        '₱',
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  maxLines: 1,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Flexible(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            AutoSizeText(
                                                                          'Total Payment:',
                                                                          maxLines:
                                                                              1,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 20.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      AutoSizeText(
                                                                    formatNumber(
                                                                      functions.checkouttotal(_model
                                                                          .checkboxCheckedItems
                                                                          .map((e) =>
                                                                              valueOrDefault<double>(
                                                                                e.totalPayment,
                                                                                0.0,
                                                                              ))
                                                                          .toList()),
                                                                      formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                      decimalType:
                                                                          DecimalType
                                                                              .automatic,
                                                                      currency:
                                                                          '₱',
                                                                    ),
                                                                    maxLines: 1,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displaySmall,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(
                                                        height: 32.0,
                                                        thickness: 2.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 20.0)),
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
