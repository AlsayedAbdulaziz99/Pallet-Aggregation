import '/backend/api_requests/api_calls.dart';
import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_action_page_widget.dart' show ProductActionPageWidget;
import 'package:flutter/material.dart';

class ProductActionPageModel extends FlutterFlowModel<ProductActionPageWidget> {
  ///  Local state fields for this page.

  String cartonsscc = '0000000000000';

  int quantity = 0;

  bool scannerActive = true;

  String mfg = '-';

  String exp = '-';

  String gtin = '-';

  String recipe = '-';

  String action = '-';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - parseBarcode] action in ScannerListenerWidget widget.
  String? parsedDM;
  // State field(s) for SSCC widget.
  FocusNode? ssccFocusNode;
  TextEditingController? ssccTextController;
  String? Function(BuildContext, String?)? ssccTextControllerValidator;
  // Stores action output result for [Backend Call - API (cartonAction)] action in Button widget.
  ApiCallResponse? cartonActionResponse;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    ssccFocusNode?.dispose();
    ssccTextController?.dispose();

    footerModel.dispose();
  }
}
