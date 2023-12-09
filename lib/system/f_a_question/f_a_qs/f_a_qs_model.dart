import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/system/f_a_question/become_a_seller/become_a_seller_widget.dart';
import '/system/f_a_question/how_to_report_someone/how_to_report_someone_widget.dart';
import '/system/f_a_question/how_to_sell/how_to_sell_widget.dart';
import '/system/f_a_question/i_forgot_my_password/i_forgot_my_password_widget.dart';
import '/system/menu/dropdown_menu/dropdown_menu_widget.dart';
import '/system/welcome/home_button/home_button_widget.dart';
import 'f_a_qs_widget.dart' show FAQsWidget;
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FAQsModel extends FlutterFlowModel<FAQsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HomeButton component.
  late HomeButtonModel homeButtonModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    homeButtonModel = createModel(context, () => HomeButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    homeButtonModel.dispose();
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
