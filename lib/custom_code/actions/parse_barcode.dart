// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';

Future<String> parseBarcode(String dm, bool getserial) async {
  // Add your function code here!
  try {
    final parser = GS1BarcodeParser.defaultParser();
    final result = parser.parse(dm);
    final serial = result.getAIRawData('21');
    final batch = result.getAIRawData('10');
    final String? output;
    if (getserial) {
      output = serial;
    } else {
      output = batch;
    }
    return serial ?? '';
  } catch (_) {
    return '';
  }
}
