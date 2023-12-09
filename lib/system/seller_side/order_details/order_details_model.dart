import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'order_details_widget.dart' show OrderDetailsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderDetailsModel extends FlutterFlowModel<OrderDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtProdName widget.
  FocusNode? txtProdNameFocusNode;
  TextEditingController? txtProdNameController;
  String? Function(BuildContext, String?)? txtProdNameControllerValidator;
  // State field(s) for txtDesc widget.
  FocusNode? txtDescFocusNode;
  TextEditingController? txtDescController;
  String? Function(BuildContext, String?)? txtDescControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtProdNameFocusNode?.dispose();
    txtProdNameController?.dispose();

    txtDescFocusNode?.dispose();
    txtDescController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
