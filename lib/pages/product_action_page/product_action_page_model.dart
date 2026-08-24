import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_action_page_widget.dart' show ProductActionPageWidget;
import 'package:flutter/material.dart';

class ProductActionPageModel extends FlutterFlowModel<ProductActionPageWidget> {
  ///  Local state fields for this page.

  String cartonsscc = '0000000000000';

  int quantity = 0;

  bool scannerActive = true;

  String mfg = '-';

  String exp = '-';

  String gtin = '-';

  String recipe = '-';

  String action = '-';

  String batch = '-';

  List<UnitStruct> scanedUnits = [];
  void addToScanedUnits(UnitStruct item) => scanedUnits.add(item);
  void removeFromScanedUnits(UnitStruct item) => scanedUnits.remove(item);
  void removeAtIndexFromScanedUnits(int index) => scanedUnits.removeAt(index);
  void insertAtIndexInScanedUnits(int index, UnitStruct item) =>
      scanedUnits.insert(index, item);
  void updateScanedUnitsAtIndex(int index, Function(UnitStruct) updateFn) =>
      scanedUnits[index] = updateFn(scanedUnits[index]);

  List<String> scannedDMString = [];
  void addToScannedDMString(String item) => scannedDMString.add(item);
  void removeFromScannedDMString(String item) => scannedDMString.remove(item);
  void removeAtIndexFromScannedDMString(int index) =>
      scannedDMString.removeAt(index);
  void insertAtIndexInScannedDMString(int index, String item) =>
      scannedDMString.insert(index, item);
  void updateScannedDMStringAtIndex(int index, Function(String) updateFn) =>
      scannedDMString[index] = updateFn(scannedDMString[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - parseBarcode] action in ScannerListenerWidget widget.
  String? parsedDMSerial;
  // Stores action output result for [Custom Action - parseBarcode] action in ScannerListenerWidget widget.
  String? parsedDMbatch;
  // Stores action output result for [Custom Action - parseBarcode] action in ScannerListenerWidget widget.
  String? parsedDMmfg;
  // Stores action output result for [Custom Action - parseBarcode] action in ScannerListenerWidget widget.
  String? parsedDMexp;
  // Stores action output result for [Custom Action - parseBarcode] action in ScannerListenerWidget widget.
  String? parsedDMgtin;
  // Stores action output result for [Backend Call - API (cartonAction)] action in Button widget.
  ApiCallResponse? cartonActionResponse;
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
