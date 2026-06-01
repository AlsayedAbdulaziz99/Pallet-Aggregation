import '/backend/sqlite/sqlite_manager.dart';
import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'pack_bundle_event_widget.dart' show PackBundleEventWidget;
import 'package:flutter/material.dart';

class PackBundleEventModel extends FlutterFlowModel<PackBundleEventWidget> {
  ///  Local state fields for this page.

  String palletsscc = '0000000000000';

  int palletCounter = 0;

  int maxPalletSize = 0;

  int loopCounter = 0;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - SQLite (Check Carton Parent Relation)] action in Pack_Bundle_Event widget.
  List<CheckCartonParentRelationRow>? parentChildQueryResult;
  // Stores action output result for [Backend Call - SQLite (CheckIfCarton In Batch)] action in Pack_Bundle_Event widget.
  List<CheckIfCartonInBatchRow>? cartoninBatchResponse;
  // State field(s) for SSCC widget.
  FocusNode? ssccFocusNode;
  TextEditingController? ssccTextController;
  String? Function(BuildContext, String?)? ssccTextControllerValidator;
  // Stores action output result for [Backend Call - SQLite (Read SSCC Counter)] action in Button widget.
  List<ReadSSCCCounterRow>? readSsccCounterOutput;
  // Stores action output result for [Backend Call - SQLite (Load Generated SSCCs)] action in Button widget.
  List<LoadGeneratedSSCCsRow>? loadGeneratedSSCCsOutput;
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
    instantTimer?.cancel();
    ssccFocusNode?.dispose();
    ssccTextController?.dispose();

    footerModel.dispose();
  }
}
