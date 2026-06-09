import '/backend/api_requests/api_calls.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'auto_pack_pallet_widget.dart' show AutoPackPalletWidget;
import 'package:flutter/material.dart';

class AutoPackPalletModel extends FlutterFlowModel<AutoPackPalletWidget> {
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

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (CheckShipperStatus)] action in ScannerListenerWidget widget.
  ApiCallResponse? checkShipperStatusResponse;
  // State field(s) for SSCC widget.
  FocusNode? ssccFocusNode;
  TextEditingController? ssccTextController;
  String? Function(BuildContext, String?)? ssccTextControllerValidator;
  // Stores action output result for [Backend Call - SQLite (Load Generated SSCCs)] action in Button widget.
  List<LoadGeneratedSSCCsRow>? loadGeneratedSSCCsResponse2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    ssccFocusNode?.dispose();
    ssccTextController?.dispose();

    footerModel.dispose();
  }
}
