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

import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';

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
      case GS1AIs.gtin:
        output = gtin;
        break;

      case GS1AIs.mfg:
        output = mfg;
        break;

      case GS1AIs.exp:
        output = exp;
        break;

      case GS1AIs.batch:
        output = batch;
        break;

      case GS1AIs.serial:
        output = serial;
        break;
    }
    return output ?? '';
  } catch (_) {
    return '';
  }
}
