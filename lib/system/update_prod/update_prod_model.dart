import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/system/seller_side/alert_message/alert_message_widget.dart';
import 'dart:ui';
import 'update_prod_widget.dart' show UpdateProdWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class UpdateProdModel extends FlutterFlowModel<UpdateProdWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for txtProdName widget.
  FocusNode? txtProdNameFocusNode;
  TextEditingController? txtProdNameController;
  String? Function(BuildContext, String?)? txtProdNameControllerValidator;
  String? _txtProdNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for txtDesc widget.
  FocusNode? txtDescFocusNode;
  TextEditingController? txtDescController;
  String? Function(BuildContext, String?)? txtDescControllerValidator;
  String? _txtDescControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for isFood widget.
  bool? isFoodValue;
  // State field(s) for isDrink widget.
  bool? isDrinkValue;
  // State field(s) for isMerc widget.
  bool? isMercValue;
  // State field(s) for IsShirt widget.
  bool? isShirtValue;
  // State field(s) for IsShort widget.
  bool? isShortValue;
  // State field(s) for isItems widget.
  bool? isItemsValue;
  // State field(s) for others widget.
  bool? othersValue;
  // State field(s) for isHaveSize widget.
  bool? isHaveSizeValue;
  // State field(s) for small widget.
  bool? smallValue;
  // State field(s) for medium widget.
  bool? mediumValue;
  // State field(s) for large widget.
  bool? largeValue;
  // State field(s) for extralarge widget.
  bool? extralargeValue;
  // State field(s) for txtPrice widget.
  FocusNode? txtPriceFocusNode;
  TextEditingController? txtPriceController;
  String? Function(BuildContext, String?)? txtPriceControllerValidator;
  // State field(s) for txtStock widget.
  FocusNode? txtStockFocusNode;
  TextEditingController? txtStockController;
  String? Function(BuildContext, String?)? txtStockControllerValidator;
  // State field(s) for txtShip widget.
  FocusNode? txtShipFocusNode1;
  TextEditingController? txtShipController1;
  String? Function(BuildContext, String?)? txtShipController1Validator;
  // State field(s) for txtShip widget.
  FocusNode? txtShipFocusNode2;
  TextEditingController? txtShipController2;
  String? Function(BuildContext, String?)? txtShipController2Validator;
  // State field(s) for DropDownPaymentOpt widget.
  String? dropDownPaymentOptValue;
  FormFieldController<String>? dropDownPaymentOptValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtProdNameControllerValidator = _txtProdNameControllerValidator;
    txtDescControllerValidator = _txtDescControllerValidator;
  }

  void dispose() {
    txtProdNameFocusNode?.dispose();
    txtProdNameController?.dispose();

    txtDescFocusNode?.dispose();
    txtDescController?.dispose();

    txtPriceFocusNode?.dispose();
    txtPriceController?.dispose();

    txtStockFocusNode?.dispose();
    txtStockController?.dispose();

    txtShipFocusNode1?.dispose();
    txtShipController1?.dispose();

    txtShipFocusNode2?.dispose();
    txtShipController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
