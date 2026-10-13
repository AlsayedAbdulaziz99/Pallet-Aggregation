import '/backend/api_requests/api_calls.dart';
import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'palletdecommission_widget.dart' show PalletdecommissionWidget;
import 'package:flutter/material.dart';

class PalletdecommissionModel
    extends FlutterFlowModel<PalletdecommissionWidget> {
  ///  Local state fields for this page.

  bool? scannerActive = false;

  List<String> childsSSCCs = [];
  void addToChildsSSCCs(String item) => childsSSCCs.add(item);
  void removeFromChildsSSCCs(String item) => childsSSCCs.remove(item);
  void removeAtIndexFromChildsSSCCs(int index) => childsSSCCs.removeAt(index);
  void insertAtIndexInChildsSSCCs(int index, String item) =>
      childsSSCCs.insert(index, item);
  void updateChildsSSCCsAtIndex(int index, Function(String) updateFn) =>
      childsSSCCs[index] = updateFn(childsSSCCs[index]);

  String parsedSSCC = '-';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - parseBarcode] action in ScannerListenerWidget widget.
  String? parsedSSCCOutput;
  // Stores action output result for [Backend Call - API (Pallet Info)] action in ScannerListenerWidget widget.
  ApiCallResponse? palletInfoResponse;
  // Stores action output result for [Backend Call - API (PalletDecommesion)] action in Button widget.
  ApiCallResponse? palletDecomissionResponse;
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
