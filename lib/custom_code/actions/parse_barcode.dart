// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> parseBarcode(
  String dm,
  GS1AIs ai,
) async {
  try {
    final parser = GS1BarcodeParser.defaultParser();
    final result = parser.parse(dm);
    final serial = result.getAIRawData('21');
    final batch = result.getAIRawData('10');
    final gtin = result.getAIRawData('01');
    final mfg = result.getAIRawData('11');
    final exp = result.getAIRawData('17');
    final String? output;
    switch (ai) {
      case gtin:
        output = gtin;
        break;

      case mfg:
        output = mfg;
        break;

      case exp:
        output = exp;
        break;

      case batch:
        output = batch;
        break;
    }
    return serial ?? '';
  } catch (_) {
    return '';
  }
}
