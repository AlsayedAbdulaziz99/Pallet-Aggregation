import '/backend/api_requests/api_calls.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  static String routeName = 'Login';
  static String routePath = '/login';

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    _model.usernameTextController ??= TextEditingController();
    _model.usernameFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();
    _model.passwordFocusNode!.addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(170.0),
            child: AppBar(
              backgroundColor: Color(0xCEFFFFFF),
              automaticallyImplyLeading: false,
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                background: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/launcher_icon.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              centerTitle: false,
              elevation: 2.0,
            ),
          ),
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Batch In Proggress : ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Text(
                            FFAppState().batchNumber,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 10.0, 15.0, 10.0),
                        child: Container(
                          width: double.infinity,
                          height: 300.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40.0, 0.0, 40.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.usernameTextController,
                                    focusNode: _model.usernameFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Username',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      prefixIcon: Icon(
                                        Icons.person,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    validator: _model
                                        .usernameTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40.0, 0.0, 40.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.passwordTextController,
                                      focusNode: _model.passwordFocusNode,
                                      autofocus: false,
                                      obscureText: !_model.passwordVisibility,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        prefixIcon: Icon(
                                          Icons.password_sharp,
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () async {
                                            safeSetState(() =>
                                                _model.passwordVisibility =
                                                    !_model.passwordVisibility);
                                          },
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            _model.passwordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      validator: _model
                                          .passwordTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    if ((_model.usernameTextController
                                                    .text !=
                                                '') &&
                                        (_model.passwordTextController
                                                    .text !=
                                                '')) {
                                      if ((_model.usernameTextController.text ==
                                              'admin') &&
                                          (_model.passwordTextController.text ==
                                              'M@nex')) {
                                        context.pushNamed(
                                            SettingsWidget.routeName);
                                      } else {
                                        if ((_model.usernameTextController
                                                    .text ==
                                                'all') &&
                                            (_model.passwordTextController
                                                    .text ==
                                                'all')) {
                                          context.pushNamed(
                                              TestingWidget.routeName);
                                        } else {
                                          _model.encryptedPassword =
                                              await actions.encryptPassword(
                                            _model.passwordTextController.text,
                                          );
                                          _shouldSetState = true;
                                          _model.validateUserOutput =
                                              await SQLiteManager.instance
                                                  .validateUser(
                                            username: _model
                                                .usernameTextController.text,
                                            password: _model.encryptedPassword!,
                                          );
                                          _shouldSetState = true;
                                          if (functions
                                                  .getValidateUserQuerySize(
                                                      _model.validateUserOutput
                                                          ?.toList())
                                                  .toString() !=
                                              '0') {
                                            FFAppState().userLevel = _model
                                                .validateUserOutput!
                                                .firstOrNull!
                                                .level!;
                                            safeSetState(() {});

                                            context.pushNamed(
                                                MenuWidget.routeName);
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Error'),
                                                  content: Text(
                                                      'Check username or password'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        }
                                      }
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text(
                                                'Empty Username or Password'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: 'Login',
                                  icon: Icon(
                                    Icons.lock_person_sharp,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 250.0,
                                    height: 54.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    await Future.wait([
                                      Future(() async {
                                        _model.getBatchInfoResponse =
                                            await GetBatchInfoCall.call();

                                        _shouldSetState = true;
                                        if ((_model.getBatchInfoResponse
                                                ?.succeeded ??
                                            true)) {
                                          FFAppState().batchNumber =
                                              GetBatchInfoCall.batchNumber(
                                            (_model.getBatchInfoResponse
                                                    ?.jsonBody ??
                                                ''),
                                          )!;
                                          FFAppState().EXP =
                                              GetBatchInfoCall.exp(
                                            (_model.getBatchInfoResponse
                                                    ?.jsonBody ??
                                                ''),
                                          )!;
                                          FFAppState().MFG =
                                              GetBatchInfoCall.mfg(
                                            (_model.getBatchInfoResponse
                                                    ?.jsonBody ??
                                                ''),
                                          )!;
                                          FFAppState().recipe =
                                              GetBatchInfoCall.productName(
                                            (_model.getBatchInfoResponse
                                                    ?.jsonBody ??
                                                ''),
                                          )!;
                                          FFAppState().DateFormat =
                                              GetBatchInfoCall.dateFormat(
                                            (_model.getBatchInfoResponse
                                                    ?.jsonBody ??
                                                ''),
                                          )!;
                                          safeSetState(() {});
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Server Error',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      }),
                                      Future(() async {
                                        _model.getCompanyInfoResponse =
                                            await GetCompanyInfoCall.call();

                                        _shouldSetState = true;
                                        if ((_model.getCompanyInfoResponse
                                                ?.succeeded ??
                                            true)) {
                                          FFAppState().companyName =
                                              GetCompanyInfoCall.companyName(
                                            (_model.getCompanyInfoResponse
                                                    ?.jsonBody ??
                                                ''),
                                          )!;
                                          FFAppState().companyPrefix =
                                              GetCompanyInfoCall.companyPrefix(
                                            (_model.getCompanyInfoResponse
                                                    ?.jsonBody ??
                                                ''),
                                          )!;
                                          FFAppState().extensionDigit =
                                              GetCompanyInfoCall.extensionDigit(
                                            (_model.getCompanyInfoResponse
                                                    ?.jsonBody ??
                                                ''),
                                          )!;
                                          FFAppState().palletCounter =
                                              GetCompanyInfoCall.palletCounter(
                                            (_model.getCompanyInfoResponse
                                                    ?.jsonBody ??
                                                ''),
                                          )!;
                                          safeSetState(() {});
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Server Error',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      }),
                                    ]);
                                    _model.getGTINResponse =
                                        await GetGTINCall.call(
                                      recipeName: FFAppState().recipe,
                                    );

                                    _shouldSetState = true;
                                    if ((_model.getGTINResponse?.succeeded ??
                                        true)) {
                                      FFAppState().gtin = GetGTINCall.gtin(
                                        (_model.getGTINResponse?.jsonBody ??
                                            ''),
                                      )!;
                                      FFAppState().Quantity =
                                          GetGTINCall.quantity(
                                        (_model.getGTINResponse?.jsonBody ??
                                            ''),
                                      )!;
                                      safeSetState(() {});
                                    }
                                    await SQLiteManager.instance
                                        .deleteAllBatchSerials();
                                    await SQLiteManager.instance
                                        .deleteAllUsers();
                                    await SQLiteManager.instance
                                        .deleteAllSsccData();
                                    await SQLiteManager.instance
                                        .deleteAggregationConfig();
                                    await SQLiteManager.instance
                                        .deleteBatchCartons();
                                    _model.cartonPalletRelationResponse =
                                        await CartonPalletRelationCall.call(
                                      btachNumber: FFAppState().batchNumber,
                                    );

                                    _shouldSetState = true;
                                    if ((_model.cartonPalletRelationResponse
                                            ?.succeeded ??
                                        true)) {
                                      _model.loopCounter =
                                          CartonPalletRelationCall.cartons(
                                        (_model.cartonPalletRelationResponse
                                                ?.jsonBody ??
                                            ''),
                                      )!
                                              .length;
                                      safeSetState(() {});
                                      _model.loopCounter =
                                          _model.loopCounter + -1;
                                      safeSetState(() {});
                                      while (_model.loopCounter >= 0) {
                                        await SQLiteManager.instance
                                            .updateSerialsAfterImporting(
                                          shippersscc:
                                              (CartonPalletRelationCall.cartons(
                                            (_model.cartonPalletRelationResponse
                                                    ?.jsonBody ??
                                                ''),
                                          )!
                                                  .elementAtOrNull(
                                                      _model.loopCounter))!,
                                          palletsscc:
                                              (CartonPalletRelationCall.pallets(
                                            (_model.cartonPalletRelationResponse
                                                    ?.jsonBody ??
                                                ''),
                                          )!
                                                  .elementAtOrNull(
                                                      _model.loopCounter))!,
                                        );
                                        _model.loopCounter =
                                            _model.loopCounter + -1;
                                        safeSetState(() {});
                                      }
                                      _model.loadBatchCartonsResponse =
                                          await LoadBatchSerialsCall.call(
                                        batchNumber: FFAppState().batchNumber,
                                      );

                                      _shouldSetState = true;
                                      _model.loopCounter =
                                          LoadBatchSerialsCall.batchCartons(
                                                (_model.loadBatchCartonsResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                                  .length -
                                              1;
                                      safeSetState(() {});
                                      while (_model.loopCounter >= 0) {
                                        await SQLiteManager.instance
                                            .insertBatchCartons(
                                          cartonsscc: (LoadBatchSerialsCall
                                                  .batchCartons(
                                            (_model.loadBatchCartonsResponse
                                                    ?.jsonBody ??
                                                ''),
                                          )!
                                              .elementAtOrNull(
                                                  _model.loopCounter))!,
                                        );
                                        _model.loopCounter =
                                            _model.loopCounter + -1;
                                        safeSetState(() {});
                                      }
                                      _model.loadUsersOutput =
                                          await LoadUsersCall.call();

                                      _shouldSetState = true;
                                      if ((_model.loadUsersOutput?.succeeded ??
                                          true)) {
                                        _model.usersCount = LoadUsersCall.users(
                                          (_model.loadUsersOutput?.jsonBody ??
                                              ''),
                                        )!
                                            .length;
                                        safeSetState(() {});
                                        _model.usersCount =
                                            _model.usersCount + -1;
                                        safeSetState(() {});
                                        while (_model.usersCount >= 0) {
                                          await SQLiteManager.instance.addUsers(
                                            username: (LoadUsersCall.users(
                                              (_model.loadUsersOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )!
                                                .elementAtOrNull(
                                                    _model.usersCount))!,
                                            password: (LoadUsersCall.passwords(
                                              (_model.loadUsersOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )!
                                                .elementAtOrNull(
                                                    _model.usersCount))!,
                                            level: (LoadUsersCall.levels(
                                              (_model.loadUsersOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )!
                                                .elementAtOrNull(
                                                    _model.usersCount))!,
                                          );
                                          _model.usersCount =
                                              _model.usersCount + -1;
                                          safeSetState(() {});
                                        }
                                        await SQLiteManager.instance
                                            .insertAggregationConfig(
                                          shipperCount:
                                              int.parse(FFAppState().Quantity),
                                          companyPrefix:
                                              FFAppState().companyPrefix,
                                          palletCounter:
                                              FFAppState().palletCounter,
                                          extensionDigit: int.parse(
                                              FFAppState().extensionDigit),
                                        );
                                      } else {
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Batch Imported Sccessully',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Data Didn\'t Import Successfully!',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: 'Import Machine Config',
                                  icon: Icon(
                                    Icons.download,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 250.0,
                                    height: 54.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(height: 15.0))
                                  .around(SizedBox(height: 15.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.footerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: FooterWidget(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
