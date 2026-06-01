import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'g_s1parser_model.dart';
export 'g_s1parser_model.dart';

class GS1parserWidget extends StatefulWidget {
  const GS1parserWidget({super.key});

  @override
  State<GS1parserWidget> createState() => _GS1parserWidgetState();
}

class _GS1parserWidgetState extends State<GS1parserWidget> {
  late GS1parserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GS1parserModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Opacity(
          opacity: 0.0,
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: 400.0,
              height: 1.0,
              child: custom_widgets.Getscannerdatawidget(
                width: 400.0,
                height: 1.0,
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.0,
          child: Text(
            FFAppState().scannerdata,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.readexPro(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  fontSize: 2.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
        ),
        Container(
          width: 358.0,
          height: 169.2,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).accent4,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                child: Builder(
                  builder: (context) {
                    final barcodelistvar =
                        FFAppState().scannedatalist.unique((e) => e).toList();

                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(barcodelistvar.length,
                            (barcodelistvarIndex) {
                          final barcodelistvarItem =
                              barcodelistvar[barcodelistvarIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 3.0),
                            child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  width: 2.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      barcodelistvarItem,
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
                                            fontSize: 12.0,
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
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().removeFromScannedatalist(
                                          barcodelistvarItem);
                                      safeSetState(() {});
                                    },
                                    child: Icon(
                                      Icons.delete_forever_sharp,
                                      color: FlutterFlowTheme.of(context).error,
                                      size: 40.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownglnValueController ??=
                        FormFieldController<String>(null),
                    options: FFAppState().GLNListAS,
                    onChanged: (val) =>
                        safeSetState(() => _model.dropDownglnValue = val),
                    width: 344.49,
                    height: 42.0,
                    searchHintTextStyle: FlutterFlowTheme.of(context)
                        .labelLarge
                        .override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelLarge.fontStyle,
                        ),
                    searchTextStyle: FlutterFlowTheme.of(context)
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
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    hintText: 'Select GLN',
                    searchHintText: 'Search...',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).primaryText,
                    borderWidth: 0.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    hidesUnderline: true,
                    isOverButton: false,
                    isSearchable: true,
                    isMultiSelect: false,
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (FFAppState().defaultPrinter != '') {
                            if (_model.dropDownglnValue != null &&
                                _model.dropDownglnValue != '') {
                              _model.apiResultsscc =
                                  await GenerateSSCCCall.call(
                                gln: _model.dropDownglnValue,
                                printer: _model.dropDownprinterValue,
                              );

                              if ((_model.apiResultsscc?.succeeded ?? true) ==
                                  true) {
                                FFAppState().ssccAS = GenerateSSCCCall.sscc(
                                  (_model.apiResultsscc?.jsonBody ?? ''),
                                )!;
                                safeSetState(() {});
                              } else {
                                await action_blocks
                                    .checkServerConnection(context);
                              }
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text('Please Select GLN First'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Responce'),
                                  content: Text('Select Default Printer'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }

                          safeSetState(() {});
                        },
                        text: 'Print',
                        icon: Icon(
                          Icons.print,
                          size: 20.0,
                        ),
                        options: FFButtonOptions(
                          width: 126.61,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).success,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
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
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 2.0, 0.0),
                      child: Container(
                        width: 218.79,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  FFAppState().ssccAS,
                                  'sscc',
                                ),
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
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 5.0),
                    child: Container(
                      width: 1.0,
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 2000),
                          () => safeSetState(() {}),
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Invoice Order(optional)',
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                          hintText: 'Invoice Order(optional)',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          suffixIcon: _model.textController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.textController?.clear();
                                    safeSetState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    size: 22,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if ((FFAppState().scannedatalist.isNotEmpty) ==
                              true) {
                            _model.apiResultsenddata =
                                await PackingEventCall.call(
                              barcodeListList:
                                  FFAppState().scannedatalist.unique((e) => e),
                              parent: GenerateSSCCCall.sscc(
                                (_model.apiResultsscc?.jsonBody ?? ''),
                              ),
                              invoiceOrder: _model.textController.text,
                            );

                            if ((_model.apiResultsenddata?.succeeded ?? true)) {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Responce'),
                                    content:
                                        Text(PackingEventCall.tatmeenResponse(
                                      (_model.apiResultsenddata?.jsonBody ??
                                          ''),
                                    )!),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Responce'),
                                  content: Text('Scanned List Empty'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }

                          safeSetState(() {});
                        },
                        text: 'Send Tatmeen',
                        icon: Icon(
                          Icons.done_all,
                          size: 25.0,
                        ),
                        options: FFButtonOptions(
                          width: 200.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).success,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
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
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 63.0,
                        height: 25.0,
                        decoration: BoxDecoration(),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Ship',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.checkboxShip2Value ??= false,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.checkboxShip2Value = newValue!);
                            if (newValue!) {
                              FFAppState().ShipWithPack = true;
                              safeSetState(() {});
                            } else {
                              FFAppState().ShipWithPack = false;
                              safeSetState(() {});
                            }
                          },
                          side: (FlutterFlowTheme.of(context).alternate != null)
                              ? BorderSide(
                                  width: 2,
                                  color:
                                      FlutterFlowTheme.of(context).alternate,
                                )
                              : null,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 3.0, 5.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownprinterValueController ??=
                      FormFieldController<String>(
                    _model.dropDownprinterValue ??= FFAppState().defaultPrinter,
                  ),
                  options: FFAppState().PrinterListAS,
                  onChanged: (val) async {
                    safeSetState(() => _model.dropDownprinterValue = val);
                    if (_model.dropDownprinterValue ==
                        FFAppState().defaultPrinter) {
                      safeSetState(() {
                        _model.checkboxValue = true;
                      });
                    } else {
                      safeSetState(() {
                        _model.checkboxValue = false;
                      });
                    }
                  },
                  width: 280.0,
                  height: 42.0,
                  searchHintTextStyle: FlutterFlowTheme.of(context)
                      .labelLarge
                      .override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelLarge.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelLarge.fontStyle,
                      ),
                  searchTextStyle: FlutterFlowTheme.of(context)
                      .bodyMedium
                      .override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  hintText: 'Select Printer',
                  searchHintText: 'Search...',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).primaryText,
                  borderWidth: 0.0,
                  borderRadius: 8.0,
                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  hidesUnderline: true,
                  isOverButton: false,
                  isSearchable: true,
                  isMultiSelect: false,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 65.0,
                    height: 19.0,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Default',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.readexPro(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                  Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      unselectedWidgetColor:
                          FlutterFlowTheme.of(context).alternate,
                    ),
                    child: Checkbox(
                      value: _model.checkboxValue ??= false,
                      onChanged: (newValue) async {
                        safeSetState(() => _model.checkboxValue = newValue!);
                        if (newValue!) {
                          FFAppState().defaultPrinter =
                              _model.dropDownprinterValue!;
                          safeSetState(() {});
                        }
                      },
                      side: (FlutterFlowTheme.of(context).alternate != null)
                          ? BorderSide(
                              width: 2,
                              color: FlutterFlowTheme.of(context).alternate,
                            )
                          : null,
                      activeColor: FlutterFlowTheme.of(context).primary,
                      checkColor: FlutterFlowTheme.of(context).info,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
