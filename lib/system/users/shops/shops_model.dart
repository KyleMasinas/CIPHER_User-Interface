import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/system/menu/dropdown_menu/dropdown_menu_widget.dart';
import '/system/welcome/home_button/home_button_widget.dart';
import 'package:badges/badges.dart' as badges;
import 'shops_widget.dart' show ShopsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShopsModel extends FlutterFlowModel<ShopsWidget> {
  ///  Local state fields for this page.

  bool isShop = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HomeButton component.
  late HomeButtonModel homeButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    homeButtonModel = createModel(context, () => HomeButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    homeButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
