import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'create_account1_widget.dart' show CreateAccount1Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateAccount1Model extends FlutterFlowModel<CreateAccount1Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for IDnumTxt widget.
  FocusNode? iDnumTxtFocusNode1;
  TextEditingController? iDnumTxtController1;
  String? Function(BuildContext, String?)? iDnumTxtController1Validator;
  String? _iDnumTxtController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for IDnumTxt widget.
  FocusNode? iDnumTxtFocusNode2;
  TextEditingController? iDnumTxtController2;
  String? Function(BuildContext, String?)? iDnumTxtController2Validator;
  // State field(s) for EmailTxt widget.
  FocusNode? emailTxtFocusNode;
  TextEditingController? emailTxtController;
  String? Function(BuildContext, String?)? emailTxtControllerValidator;
  String? _emailTxtControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^[a-z0-9.!#\$%&\'*+-/=?^_`{|}~]+@clsu2+\\.edu+\\.ph')
        .hasMatch(val)) {
      return 'Use your clsu2 email';
    }
    return null;
  }

  // State field(s) for passTxt widget.
  FocusNode? passTxtFocusNode;
  TextEditingController? passTxtController;
  late bool passTxtVisibility;
  String? Function(BuildContext, String?)? passTxtControllerValidator;
  String? _passTxtControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(
            '^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\\\$&*~]).{8,}\$')
        .hasMatch(val)) {
      return 'Ex. Qwertyuiop1#';
    }
    return null;
  }

  // State field(s) for CPassTxt widget.
  FocusNode? cPassTxtFocusNode;
  TextEditingController? cPassTxtController;
  late bool cPassTxtVisibility;
  String? Function(BuildContext, String?)? cPassTxtControllerValidator;
  String? _cPassTxtControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? emailTaken;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    iDnumTxtController1Validator = _iDnumTxtController1Validator;
    emailTxtControllerValidator = _emailTxtControllerValidator;
    passTxtVisibility = false;
    passTxtControllerValidator = _passTxtControllerValidator;
    cPassTxtVisibility = false;
    cPassTxtControllerValidator = _cPassTxtControllerValidator;
  }

  void dispose() {
    iDnumTxtFocusNode1?.dispose();
    iDnumTxtController1?.dispose();

    iDnumTxtFocusNode2?.dispose();
    iDnumTxtController2?.dispose();

    emailTxtFocusNode?.dispose();
    emailTxtController?.dispose();

    passTxtFocusNode?.dispose();
    passTxtController?.dispose();

    cPassTxtFocusNode?.dispose();
    cPassTxtController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
