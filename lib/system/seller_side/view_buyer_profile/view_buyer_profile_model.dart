import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'view_buyer_profile_widget.dart' show ViewBuyerProfileWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewBuyerProfileModel extends FlutterFlowModel<ViewBuyerProfileWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode1;
  TextEditingController? yourNameController1;
  String? Function(BuildContext, String?)? yourNameController1Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode2;
  TextEditingController? yourNameController2;
  String? Function(BuildContext, String?)? yourNameController2Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode3;
  TextEditingController? yourNameController3;
  String? Function(BuildContext, String?)? yourNameController3Validator;
  // State field(s) for YourCollege widget.
  FocusNode? yourCollegeFocusNode;
  TextEditingController? yourCollegeController;
  String? Function(BuildContext, String?)? yourCollegeControllerValidator;
  // State field(s) for youCourse widget.
  FocusNode? youCourseFocusNode;
  TextEditingController? youCourseController;
  String? Function(BuildContext, String?)? youCourseControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    yourNameFocusNode1?.dispose();
    yourNameController1?.dispose();

    yourNameFocusNode2?.dispose();
    yourNameController2?.dispose();

    yourNameFocusNode3?.dispose();
    yourNameController3?.dispose();

    yourCollegeFocusNode?.dispose();
    yourCollegeController?.dispose();

    youCourseFocusNode?.dispose();
    youCourseController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
