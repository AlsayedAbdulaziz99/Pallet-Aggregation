import '/backend/api_requests/api_calls.dart';
import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  Local state fields for this page.

  int loopCounter = 0;

  int usersCount = 0;

  bool batchImported = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameTextController;
  String? Function(BuildContext, String?)? usernameTextControllerValidator;
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Backend Call - API (Userlogin)] action in Button widget.
  ApiCallResponse? userLoginResponse;
  // Stores action output result for [Backend Call - API (GetBatchInfo)] action in Button widget.
  ApiCallResponse? getBatchInfoResponse;
  // Stores action output result for [Backend Call - API (GetCompanyInfo)] action in Button widget.
  ApiCallResponse? getCompanyInfoResponse;
  // Stores action output result for [Backend Call - API (GetGTIN)] action in Button widget.
  ApiCallResponse? getGTINResponse;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    usernameFocusNode?.dispose();
    usernameTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    footerModel.dispose();
  }
}
