import '/backend/api_requests/api_calls.dart';
import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'palletdecommission_widget.dart' show PalletdecommissionWidget;
import 'package:flutter/material.dart';

class PalletdecommissionModel
    extends FlutterFlowModel<PalletdecommissionWidget> {
  ///  Local state fields for this page.

  bool? scannerActive = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - parseBarcode] action in ScannerListenerWidget widget.
  String? parsedSSCC;
  // Stores action output result for [Backend Call - API (Pallet Info)] action in ScannerListenerWidget widget.
  ApiCallResponse? apiResultdkx;
  // Stores action output result for [Backend Call - API (PalletDecommesion)] action in Button widget.
  ApiCallResponse? apiResultsck;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    footerModel.dispose();
  }
}
