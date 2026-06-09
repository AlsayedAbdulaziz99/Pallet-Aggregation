import '/backend/sqlite/sqlite_manager.dart';
import '/buttons/auto_pack/auto_pack_widget.dart';
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

  // Model for AutoPack component.
  late AutoPackModel autoPackModel;
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
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    autoPackModel = createModel(context, () => AutoPackModel());
    packingModel = createModel(context, () => PackingModel());
    decomissionModel = createModel(context, () => DecomissionModel());
    printSSCCModel = createModel(context, () => PrintSSCCModel());
    checkPrintingModel = createModel(context, () => CheckPrintingModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    autoPackModel.dispose();
    packingModel.dispose();
    decomissionModel.dispose();
    printSSCCModel.dispose();
    checkPrintingModel.dispose();
    footerModel.dispose();
  }
}
