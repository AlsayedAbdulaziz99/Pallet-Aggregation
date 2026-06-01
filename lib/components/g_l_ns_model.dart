import '/flutter_flow/flutter_flow_util.dart';
import 'g_l_ns_widget.dart' show GLNsWidget;
import 'package:flutter/material.dart';

class GLNsModel extends FlutterFlowModel<GLNsWidget> {
  ///  Local state fields for this component.

  List<dynamic> filteredglns = [];
  void addToFilteredglns(dynamic item) => filteredglns.add(item);
  void removeFromFilteredglns(dynamic item) => filteredglns.remove(item);
  void removeAtIndexFromFilteredglns(int index) => filteredglns.removeAt(index);
  void insertAtIndexInFilteredglns(int index, dynamic item) =>
      filteredglns.insert(index, item);
  void updateFilteredglnsAtIndex(int index, Function(dynamic) updateFn) =>
      filteredglns[index] = updateFn(filteredglns[index]);

  String filter = ' ';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
