import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
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

  ///  State fields for stateful widgets in this page.

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
