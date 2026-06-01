import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'g_s1parser_widget.dart' show GS1parserWidget;
import 'package:flutter/material.dart';

class GS1parserModel extends FlutterFlowModel<GS1parserWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDowngln widget.
  String? dropDownglnValue;
  FormFieldController<String>? dropDownglnValueController;
  // Stores action output result for [Backend Call - API (generateSSCC)] action in Button widget.
  ApiCallResponse? apiResultsscc;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (PackingEvent)] action in Button widget.
  ApiCallResponse? apiResultsenddata;
  // State field(s) for CheckboxShip2 widget.
  bool? checkboxShip2Value;
  // State field(s) for DropDownprinter widget.
  String? dropDownprinterValue;
  FormFieldController<String>? dropDownprinterValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
