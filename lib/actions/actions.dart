import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future scannerdata(BuildContext context) async {
  if ((FFAppState().scannerdata != '') &&
      !FFAppState().scannedatalist.contains(FFAppState().scannerdata)) {
    if (FFAppState().scannerdata != '') {
      FFAppState().addToScannedatalist(FFAppState().scannerdata);
      FFAppState().barcodelist =
          FFAppState().barcodelist.toList().cast<BarcodelistStruct>();
      FFAppState().scannedListSize = FFAppState().scannedListSize + 1;
      FFAppState().scannerdata = '';
    }
  }
}

Future checkServerConnection(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (alertDialogContext) {
      return AlertDialog(
        title: Text('Error'),
        content: Text('Check Server Connection'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(alertDialogContext),
            child: Text('Ok'),
          ),
        ],
      );
    },
  );
}
