import '/backend/sqlite/sqlite_manager.dart';
import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'decommission_widget.dart' show DecommissionWidget;
import 'package:flutter/material.dart';

class DecommissionModel extends FlutterFlowModel<DecommissionWidget> {
  ///  Local state fields for this page.
  /// Number Of Pallets of the batch
  int palletsCount = 0;

  /// number of printed labels
  int printedPalletsCount = 0;

  String palletsscc = '0000000000000';

  int palletCounter = 0;

  int maxPalletSize = 0;

  int loopCounter = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - SQLite (Read Pallet Config)] action in Decommission widget.
  List<ReadPalletConfigRow>? readPalletConfigOutput;
  InstantTimer? instantTimer;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    footerModel.dispose();
  }
}
