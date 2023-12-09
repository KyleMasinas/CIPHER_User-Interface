import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_quantity_model.dart';
export 'order_quantity_model.dart';

class OrderQuantityWidget extends StatefulWidget {
  const OrderQuantityWidget({Key? key}) : super(key: key);

  @override
  _OrderQuantityWidgetState createState() => _OrderQuantityWidgetState();
}

class _OrderQuantityWidgetState extends State<OrderQuantityWidget> {
  late OrderQuantityModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderQuantityModel());

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

    return Container(
      width: 160.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).accent4,
        borderRadius: BorderRadius.circular(25.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 2.0,
        ),
      ),
      child: FlutterFlowCountController(
        decrementIconBuilder: (enabled) => FaIcon(
          FontAwesomeIcons.minus,
          color: enabled
              ? FlutterFlowTheme.of(context).alternate
              : FlutterFlowTheme.of(context).alternate,
          size: 20.0,
        ),
        incrementIconBuilder: (enabled) => FaIcon(
          FontAwesomeIcons.plus,
          color: enabled
              ? FlutterFlowTheme.of(context).primary
              : FlutterFlowTheme.of(context).alternate,
          size: 20.0,
        ),
        countBuilder: (count) => Text(
          count.toString(),
          style: FlutterFlowTheme.of(context).headlineSmall,
        ),
        count: _model.countControllerValue ??= 1,
        updateCount: (count) =>
            setState(() => _model.countControllerValue = count),
        stepSize: 1,
        minimum: 1,
      ),
    );
  }
}
