import '/backend/api_requests/api_calls.dart';
import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 's_s_c_c_print_widget.dart' show SSCCPrintWidget;
import 'package:flutter/material.dart';

class SSCCPrintModel extends FlutterFlowModel<SSCCPrintWidget> {
  ///  Local state fields for this page.

  String cartonsscc = '0000000000000';

  int quantity = 0;

  bool scannerActive = true;

  String palletSSCC = '-';

  String mfg = '-';

  String exp = '-';

  String gtin = '-';

  String batch = '-';

  String dateFormat = '-';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - parseBarcode] action in ScannerListenerWidget widget.
  String? parsedCaseSSCC;
  // Stores action output result for [Backend Call - API (GetCartonParent)] action in ScannerListenerWidget widget.
  ApiCallResponse? getCartonParentResponse;
  // State field(s) for SSCC widget.
  FocusNode? ssccFocusNode;
  TextEditingController? ssccTextController;
  String? Function(BuildContext, String?)? ssccTextControllerValidator;
  // Stores action output result for [Backend Call - API (PrintManualPallet)] action in Button widget.
  ApiCallResponse? printManualPalletResponse;
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
