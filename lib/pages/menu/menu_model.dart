import '/backend/api_requests/api_calls.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/buttons/check_printing/check_printing_widget.dart';
import '/buttons/decomission/decomission_widget.dart';
import '/buttons/packing/packing_widget.dart';
import '/buttons/print_s_s_c_c/print_s_s_c_c_widget.dart';
import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'menu_widget.dart' show MenuWidget;
import 'package:flutter/material.dart';

class MenuModel extends FlutterFlowModel<MenuWidget> {
  ///  Local state fields for this page.

  int loopCounter = 0;

  ///  State fields for stateful widgets in this page.

  // Model for Packing component.
  late PackingModel packingModel;
  // Model for Decomission component.
  late DecomissionModel decomissionModel;
  // Model for PrintSSCC component.
  late PrintSSCCModel printSSCCModel;
  // Model for CheckPrinting component.
  late CheckPrintingModel checkPrintingModel;
  // Stores action output result for [Backend Call - SQLite (LoadBatchSerialsSnapShot)] action in Button widget.
  List<LoadBatchSerialsSnapShotRow>? generatedBatchSerials;
  // Stores action output result for [Backend Call - SQLite (Read SSCC Counter)] action in Button widget.
  List<ReadSSCCCounterRow>? readSSCCCounterResponse;
  // Stores action output result for [Backend Call - API (AgregationdbSnapshot)] action in Button widget.
  ApiCallResponse? dbSnapshotResopnse;
  // Stores action output result for [Backend Call - API (SerializationdbSnapshot)] action in Button widget.
  ApiCallResponse? apiResultk41;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    packingModel = createModel(context, () => PackingModel());
    decomissionModel = createModel(context, () => DecomissionModel());
    printSSCCModel = createModel(context, () => PrintSSCCModel());
    checkPrintingModel = createModel(context, () => CheckPrintingModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    packingModel.dispose();
    decomissionModel.dispose();
    printSSCCModel.dispose();
    checkPrintingModel.dispose();
    footerModel.dispose();
  }
}
