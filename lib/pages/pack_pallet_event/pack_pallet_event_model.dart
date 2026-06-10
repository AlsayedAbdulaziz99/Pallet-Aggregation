import '/backend/api_requests/api_calls.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pack_pallet_event_widget.dart' show PackPalletEventWidget;
import 'package:flutter/material.dart';

class PackPalletEventModel extends FlutterFlowModel<PackPalletEventWidget> {
  ///  Local state fields for this page.

  String palletsscc = '0000000000000';

  int palletCounter = 0;

  int maxPalletSize = 0;

  int loopCounter = 0;

  bool scannerActive = false;

  List<String> scannedSSCCs = [];
  void addToScannedSSCCs(String item) => scannedSSCCs.add(item);
  void removeFromScannedSSCCs(String item) => scannedSSCCs.remove(item);
  void removeAtIndexFromScannedSSCCs(int index) => scannedSSCCs.removeAt(index);
  void insertAtIndexInScannedSSCCs(int index, String item) =>
      scannedSSCCs.insert(index, item);
  void updateScannedSSCCsAtIndex(int index, Function(String) updateFn) =>
      scannedSSCCs[index] = updateFn(scannedSSCCs[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (CheckShipperStatus)] action in ScannerListenerWidget widget.
  ApiCallResponse? checkShipperStatusResponse;
  // State field(s) for SSCC widget.
  FocusNode? ssccFocusNode;
  TextEditingController? ssccTextController;
  String? Function(BuildContext, String?)? ssccTextControllerValidator;
  // Stores action output result for [Backend Call - API (GenerateSSCC)] action in Button widget.
  ApiCallResponse? generateSSCCResponse;
  // Stores action output result for [Backend Call - SQLite (Load Generated SSCCs)] action in Button widget.
  List<LoadGeneratedSSCCsRow>? loadGeneratedSSCCsResponse2;
  // Stores action output result for [Backend Call - SQLite (Load Generated SSCCs)] action in Button widget.
  List<LoadGeneratedSSCCsRow>? loadGeneratedSSCCsResponse;
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
