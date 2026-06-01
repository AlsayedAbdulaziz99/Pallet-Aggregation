import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cnacel_receving_return_model.dart';
export 'cnacel_receving_return_model.dart';

class CnacelRecevingReturnWidget extends StatefulWidget {
  const CnacelRecevingReturnWidget({
    super.key,
    this.icon,
    this.textbutton,
  });

  final FFUploadedFile? icon;
  final String? textbutton;

  @override
  State<CnacelRecevingReturnWidget> createState() =>
      _CnacelRecevingReturnWidgetState();
}

class _CnacelRecevingReturnWidgetState
    extends State<CnacelRecevingReturnWidget> {
  late CnacelRecevingReturnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CnacelRecevingReturnModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).alternate,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
            child: Text(
              'Cancel Receving Ret.',
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    font: GoogleFonts.outfit(
                      fontWeight:
                          FlutterFlowTheme.of(context).titleLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).titleLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/receiving-overlay_(1).png',
                  width: 55.0,
                  height: 60.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
