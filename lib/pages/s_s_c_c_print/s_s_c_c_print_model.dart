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

  String recipe = '-';

  String dateFormat = '-';

  ///  State fields for stateful widgets in this page.

  // State field(s) for SSCC widget.
  FocusNode? ssccFocusNode1;
  TextEditingController? ssccTextController1;
  String? Function(BuildContext, String?)? ssccTextController1Validator;
  // State field(s) for SSCC widget.
  FocusNode? ssccFocusNode2;
  TextEditingController? ssccTextController2;
  String? Function(BuildContext, String?)? ssccTextController2Validator;
  // Stores action output result for [Backend Call - API (GetCartonParent)] action in IconButton widget.
  ApiCallResponse? getCartonParentResponse;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    ssccFocusNode1?.dispose();
    ssccTextController1?.dispose();

    ssccFocusNode2?.dispose();
    ssccTextController2?.dispose();

    footerModel.dispose();
  }
}
