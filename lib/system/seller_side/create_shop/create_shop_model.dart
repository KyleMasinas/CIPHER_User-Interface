import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/system/seller_side/alert_message/alert_message_widget.dart';
import 'create_shop_widget.dart' show CreateShopWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateShopModel extends FlutterFlowModel<CreateShopWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for shopName widget.
  FocusNode? shopNameFocusNode;
  TextEditingController? shopNameController;
  String? Function(BuildContext, String?)? shopNameControllerValidator;
  String? _shopNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for shopDesc widget.
  FocusNode? shopDescFocusNode;
  TextEditingController? shopDescController;
  String? Function(BuildContext, String?)? shopDescControllerValidator;
  String? _shopDescControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    shopNameControllerValidator = _shopNameControllerValidator;
    shopDescControllerValidator = _shopDescControllerValidator;
  }

  void dispose() {
    shopNameFocusNode?.dispose();
    shopNameController?.dispose();

    shopDescFocusNode?.dispose();
    shopDescController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
