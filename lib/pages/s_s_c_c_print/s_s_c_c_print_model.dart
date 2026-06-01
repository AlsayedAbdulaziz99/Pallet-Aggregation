import '/backend/sqlite/sqlite_manager.dart';
import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 's_s_c_c_print_widget.dart' show SSCCPrintWidget;
import 'package:flutter/material.dart';

class SSCCPrintModel extends FlutterFlowModel<SSCCPrintWidget> {
  ///  Local state fields for this page.

  String palletsscc = '0000000000000';

  int palletCounter = 0;

  int maxPalletSize = 0;

  int loopCounter = 0;

  int quantity = 0;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - SQLite (Check Carton Parent Relation)] action in SSCC_Print widget.
  List<CheckCartonParentRelationRow>? parentChildQueryResult;
  // Stores action output result for [Backend Call - SQLite (CheckIfCarton In Batch)] action in SSCC_Print widget.
  List<CheckIfCartonInBatchRow>? cartoninBatchResponse;
  // State field(s) for SSCC widget.
  FocusNode? ssccFocusNode;
  TextEditingController? ssccTextController;
  String? Function(BuildContext, String?)? ssccTextControllerValidator;
  // Stores action output result for [Backend Call - SQLite (Read Cartons In Pallets Count)] action in SSCC widget.
  List<ReadCartonsInPalletsCountRow>? cartonsInPalletCountResponse;
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
