import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/buttons/auto_pack/auto_pack_widget.dart';
import '/buttons/check_printing/check_printing_widget.dart';
import '/buttons/decomission/decomission_widget.dart';
import '/buttons/packing/packing_widget.dart';
import '/buttons/print_s_s_c_c/print_s_s_c_c_widget.dart';
import '/components/footer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_model.dart';
export 'menu_model.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({
    super.key,
    this.icon,
    this.palletSSCC,
    this.loopCounter,
    this.cartonsList,
  });

  final FFUploadedFile? icon;
  final String? palletSSCC;
  final int? loopCounter;
  final List<String>? cartonsList;

  static String routeName = 'menu';
  static String routePath = '/menu';

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  late MenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loopCounter = 0;
      safeSetState(() {});
    });
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.0),
          child: AppBar(
            backgroundColor: Color(0xCEFFFFFF),
            iconTheme:
                IconThemeData(color: FlutterFlowTheme.of(context).tertiary),
            automaticallyImplyLeading: true,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/launcher_icon.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            centerTitle: false,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100.0,
                    height: 1.0,
                    child: custom_widgets.Getscannerdatawidget(
                      width: 100.0,
                      height: 1.0,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 438.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(AutoPackPalletWidget.routeName);
                            },
                            child: wrapWithModel(
                              model: _model.autoPackModel,
                              updateCallback: () => safeSetState(() {}),
                              child: AutoPackWidget(),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().verify) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Alarm'),
                                      content: Text(
                                          'Please Vefiry Aggregated Pallet First'),
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
                              } else {
                                FFAppState().tatmeenButton = 'Pack Event';
                                safeSetState(() {});

                                context
                                    .pushNamed(PackPalletEventWidget.routeName);
                              }
                            },
                            onLongPress: () async {
                              FFAppState().tatmeenButton = 'Pack Event';
                              safeSetState(() {});

                              context
                                  .pushNamed(PackPalletEventWidget.routeName);
                            },
                            child: wrapWithModel(
                              model: _model.packingModel,
                              updateCallback: () => safeSetState(() {}),
                              child: PackingWidget(),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(DecommissionWidget.routeName);
                            },
                            child: wrapWithModel(
                              model: _model.decomissionModel,
                              updateCallback: () => safeSetState(() {}),
                              child: DecomissionWidget(),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(SSCCPrintWidget.routeName);
                            },
                            child: wrapWithModel(
                              model: _model.printSSCCModel,
                              updateCallback: () => safeSetState(() {}),
                              child: PrintSSCCWidget(),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                SSCCCheckWidget.routeName,
                                queryParameters: {
                                  'gneratedSSCC': serializeParam(
                                    widget.palletSSCC,
                                    ParamType.String,
                                  ),
                                  'loopCounter': serializeParam(
                                    widget.loopCounter,
                                    ParamType.int,
                                  ),
                                  'cartonsList': serializeParam(
                                    widget.cartonsList,
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'manual': serializeParam(
                                    false,
                                    ParamType.bool,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: wrapWithModel(
                              model: _model.checkPrintingModel,
                              updateCallback: () => safeSetState(() {}),
                              child: CheckPrintingWidget(),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              _model.generatedBatchSerials = await SQLiteManager
                                  .instance
                                  .loadBatchSerialsSnapShot();
                              FFAppState().AggregatedPallet = functions
                                  .assembleSnapShotCall(
                                      List.generate(
                                          random_data.randomInteger(1, 8),
                                          (index) => random_data.randomString(
                                                1,
                                                8,
                                                true,
                                                false,
                                                false,
                                              )).toList(),
                                      List.generate(
                                          random_data.randomInteger(1, 8),
                                          (index) => random_data.randomString(
                                                1,
                                                8,
                                                true,
                                                false,
                                                false,
                                              )).toList(),
                                      _model.generatedBatchSerials!.toList())!
                                  .toList()
                                  .cast<AggregatedCartonStruct>();
                              safeSetState(() {});
                              _model.readSSCCCounterResponse =
                                  await SQLiteManager.instance.readSSCCCounter(
                                companyPrefix: FFAppState().companyPrefix,
                              );

                              safeSetState(() {});
                            },
                            text: 'Export Aggregation Config',
                            icon: Icon(
                              Icons.upload,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              width: 300.0,
                              height: 45.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).tertiary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 20.0))
                            .addToStart(SizedBox(height: 50.0))
                            .addToEnd(SizedBox(height: 50.0)),
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.footerModel,
                    updateCallback: () => safeSetState(() {}),
                    child: FooterWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
