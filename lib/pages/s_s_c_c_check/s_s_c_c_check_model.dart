import '/backend/api_requests/api_calls.dart';
import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 's_s_c_c_check_widget.dart' show SSCCCheckWidget;
import 'package:flutter/material.dart';

class SSCCCheckModel extends FlutterFlowModel<SSCCCheckWidget> {
  ///  Local state fields for this page.

  String palletsscc = '0000000000000';

  int palletCounter = 0;

  int? loopCounter;

  List<String> cartonsList = [];
  void addToCartonsList(String item) => cartonsList.add(item);
  void removeFromCartonsList(String item) => cartonsList.remove(item);
  void removeAtIndexFromCartonsList(int index) => cartonsList.removeAt(index);
  void insertAtIndexInCartonsList(int index, String item) =>
      cartonsList.insert(index, item);
  void updateCartonsListAtIndex(int index, Function(String) updateFn) =>
      cartonsList[index] = updateFn(cartonsList[index]);

  bool listenerActive = true;

  bool manualAggregate = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (CheckPalletStatus)] action in ScannerListenerWidget widget.
  ApiCallResponse? checkPalletStatusResponse;
  // Stores action output result for [Backend Call - API (SerializationdbSnapshot)] action in Button widget.
  ApiCallResponse? apiResultk41;
  // Stores action output result for [Backend Call - API (AgregationdbSnapshot)] action in Button widget.
  ApiCallResponse? dbSnapshotResopnse;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    footerModel.dispose();
  }
}
