import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ServerIP widget.
  FocusNode? serverIPFocusNode;
  TextEditingController? serverIPTextController;
  String? Function(BuildContext, String?)? serverIPTextControllerValidator;
  // State field(s) for ServerPort widget.
  FocusNode? serverPortFocusNode;
  TextEditingController? serverPortTextController;
  String? Function(BuildContext, String?)? serverPortTextControllerValidator;
  // State field(s) for PrinterIP widget.
  FocusNode? printerIPFocusNode;
  TextEditingController? printerIPTextController;
  String? Function(BuildContext, String?)? printerIPTextControllerValidator;
  // State field(s) for PrinterPort widget.
  FocusNode? printerPortFocusNode;
  TextEditingController? printerPortTextController;
  String? Function(BuildContext, String?)? printerPortTextControllerValidator;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    serverIPFocusNode?.dispose();
    serverIPTextController?.dispose();

    serverPortFocusNode?.dispose();
    serverPortTextController?.dispose();

    printerIPFocusNode?.dispose();
    printerIPTextController?.dispose();

    printerPortFocusNode?.dispose();
    printerPortTextController?.dispose();

    footerModel.dispose();
  }
}
