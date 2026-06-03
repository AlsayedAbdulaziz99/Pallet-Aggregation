// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// ignore_for_file: avoid_print
import 'package:flutter/foundation.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';
//import '/action_page/glns.dart';

Map idErrorMap = {'error': 'undefined code'};

bool isNumeric(String? s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

Map parseGs1Code(String code, String? toAddInfoTo) {
  // barcode parser
  GS1BarcodeParser parser = GS1BarcodeParser.defaultParser();

  toAddInfoTo ??= '';

  code = code + toAddInfoTo;

  print(code);

  //barcode symbology AIM Identifiers C>>code128, d>>datamatrix, E>>EAN/UPC
  List<String> patternsToRemove = [
    '~1',
    ' ',
    ']C0',
    ']C1',
    ']C2',
    ']C4',
    ']d0',
    ']d1',
    ']d2',
    ']d3',
    ']d4',
    ']d5',
    ']d6',
    ']E0',
    ']E1',
    ']E2',
    ']E3',
    ']E4',
    '(',
    ')',
    '[',
    ']',
  ];

  for (String pattern in patternsToRemove) {
    code = code.replaceAll(pattern, '');
  }

  GS1Barcode result = parser.parse(code);
  Map parsedCode = result.getAIsData;
  if (parsedCode.containsKey('00')) {
    Map result = {
      'SSCC': parsedCode['00'],
    };
    // result['raw'] = reFormatEpc(result);
    //print(result['raw']);
    return result;
  } else if (parsedCode.containsKey('01') && !parsedCode.containsKey('00')) {
    Map result = {
      'gtin': parsedCode['01'],
      'serial': parsedCode['21'],
      'Batch': parsedCode['10'],
      'expiry': parsedCode['17']
          .toString()
          .replaceAll('00:00:00.000', '')
          .replaceAll(' ', ''),
    };
    //result['raw'] = reFormatEpc(result);
    //print(result['raw']);
    return result;
  } else {
    return idErrorMap;
  }
}

String removeBraces(code) {
  return code.toString().replaceAll('(', '').replaceAll(')', '');
}

String removeBrackets(code) {
  return code.toString().replaceAll('[', '').replaceAll(']', '');
}

String printEpcMap(Map barCodes) {
  String result = '';

  if (checkKeyAndReturnValue(barCodes, 'type') == 'sscc') {
    result = '${result}SSCC:-\n';
  }
  if (checkKeyAndReturnValue(barCodes, 'type') == 'gtin') {
    result = '${result}SGTIN:-\n';
  }
  if (checkKeyAndReturnValue(barCodes, 'type') == 'gtin13') {
    result = '${result}GTIN:-\n';
  }
  var id = checkKeyAndReturnValue(barCodes, 'id');
  if (id != null) {
    result = '$result$id\n';
  }
  var serial = checkKeyAndReturnValue(barCodes, 'serial');
  if (serial != null) {
    result = '${result}Serial: $serial\n';
  }
  var expiry = checkKeyAndReturnValue(barCodes, 'expiry');
  if (expiry != null) {
    result = '${result}Expiry: $expiry\n';
  }

  var variant = checkKeyAndReturnValue(barCodes, 'variant');
  if (variant != null) {
    result = '${result}Variant: $variant\n';
  }

  var content = checkKeyAndReturnValue(barCodes, 'content');
  if (content != null) {
    result = '${result}Content: $content\n';
  }

  var count = checkKeyAndReturnValue(barCodes, 'count');
  if (count != null) {
    result = '${result}Count: ${count.toInt()}\n';
  }

  var itemsCount = checkKeyAndReturnValue(barCodes, 'itemsCount');
  if (itemsCount != null) {
    result = '${result}Items count: $itemsCount\n';
  }

  var batch = checkKeyAndReturnValue(barCodes, 'batch');
  if (batch != null) {
    result = '${result}Batch/Lot: $batch\n';
  }
  var bestBefore = checkKeyAndReturnValue(barCodes, 'best_before');
  if (bestBefore != null) {
    result = '${result}Best before: $bestBefore\n';
  }
  var additionalId = checkKeyAndReturnValue(barCodes, 'additional_id');
  if (additionalId != null) {
    result = '${result}Additional ID: $additionalId\n';
  }
  var orderReference = checkKeyAndReturnValue(barCodes, 'order_reference');
  if (orderReference != null) {
    result = '${result}Order Reference: $orderReference\n';
  }

  return result;
}

checkKeyAndReturnValue(Map map, var key) {
  if (map.containsKey(key) && (map[key] != 'null')) {
    return map[key];
  } else {
    return null;
  }
}

String? getSelectedLastEpc(List barCodes, List selectedItems) {
  String? returnCode;

  if (selectedItems.isNotEmpty) {
    Map selectedCode = barCodes[selectedItems[0]];
    if (selectedCode.isNotEmpty) {
      if (selectedCode['type'] == 'sscc') {
        returnCode = '\u001D' "00${selectedCode['id']}";
      } else if (selectedCode['type'] == 'gtin') {
        returnCode = '\u001D' "01${selectedCode['id']}";
      } else {
        return returnCode;
      }
    }

    String? expiry = checkKeyAndReturnValue(selectedCode, 'expiry');
    if (expiry != null) {
      expiry = expiry.replaceAll('-', '');
      expiry = expiry.replaceFirst('20', '');
      returnCode = """${returnCode}17$expiry""";
    }
    var variant = checkKeyAndReturnValue(selectedCode, 'variant');
    if (variant != null) {
      returnCode = """${returnCode}20$variant""";
    }

    var content = checkKeyAndReturnValue(selectedCode, 'content');
    if (content != null) {
      returnCode = """${returnCode}02$content""";
    }

    var shipToGln = checkKeyAndReturnValue(selectedCode, 'ship_to_gln');
    if (shipToGln != null) {
      returnCode = '${returnCode}410$shipToGln';
    }
    var purchasedFromGln =
        checkKeyAndReturnValue(selectedCode, 'purchased_from_gln');
    if (purchasedFromGln != null) {
      returnCode = '${returnCode}412$purchasedFromGln';
    }

    var serial = checkKeyAndReturnValue(selectedCode, 'serial');
    if (serial != null) {
      returnCode = """${returnCode}21$serial""" '\u001D';
    }

    var count = checkKeyAndReturnValue(selectedCode, 'count');
    if (count != null) {
      returnCode = """${returnCode}37$count""" '\u001D';
    }

    var itemsCount = checkKeyAndReturnValue(selectedCode, 'itemsCount');
    if (itemsCount != null) {
      returnCode = """${returnCode}30$itemsCount""" '\u001D';
    }
    var batch = checkKeyAndReturnValue(selectedCode, 'batch');
    if (batch != null) {
      returnCode = """${returnCode}10$batch""" '\u001D';
    }
    var bestBefore = checkKeyAndReturnValue(selectedCode, 'best_before');
    if (bestBefore != null) {
      returnCode = """${returnCode}15$bestBefore""" '\u001D';
    }
    var additionalId = checkKeyAndReturnValue(selectedCode, 'additional_id');
    if (additionalId != null) {
      returnCode = '${returnCode}240$additionalId' '\u001D';
    }
    var orderReference =
        checkKeyAndReturnValue(selectedCode, 'order_reference');
    if (orderReference != null) {
      returnCode = '${returnCode}400$orderReference' '\u001D';
    }
  }
  if (returnCode != null) {
    if (returnCode.endsWith('\u001D')) {
      returnCode.replaceFirst('\u001D', '', (returnCode.length - 2));
    }
  }
  print('returnCode: $returnCode');
  return returnCode;
}

bool checkDuplication(List barCodes, Map result) {
  bool duplicate = false;
  for (Map barcode in barCodes) {
    if (mapEquals(barcode, result)) {
      duplicate = true;
    }
    if (barcode['id'] == result['id'] &&
        (barcode['type'] == 'sscc' || result['type'] == 'sscc')) {
      duplicate = true;
    }
    if (barcode['id'] == result['id'] &&
        barcode['serial'] == result['serial'] &&
        ((barcode['type'] == 'gtin' && result['type'] == 'gtin') ||
            (barcode['type'] == 'gtin13' && result['type'] == 'gtin13'))) {
      duplicate = true;
    } else {
      if (barcode['childs'] != null) {
        bool duplicateInChilds = checkDuplication(barcode['childs'], result);
        if (duplicateInChilds == true) {
          duplicate = true;
        }
      }
    }
  }
  return duplicate;
}

String reFormatEpc(Map barCode) {
  String returnCode = '';

  if (barCode['type'] == 'sscc') {
    returnCode = "00${barCode['id']}";
  } else if (barCode['type'] == 'gtin') {
    returnCode = "01${barCode['id']}";
  }

  String? expiry = checkKeyAndReturnValue(barCode, 'expiry');
  if (expiry != null) {
    expiry = expiry.replaceAll('-', '');
    expiry = expiry.replaceFirst('20', '');
    returnCode = """${returnCode}17$expiry""";
  }
  var variant = checkKeyAndReturnValue(barCode, 'variant');
  if (variant != null) {
    returnCode = """${returnCode}20$variant""";
  }

  var content = checkKeyAndReturnValue(barCode, 'content');
  if (content != null) {
    returnCode = """${returnCode}02$content""";
  }

  var shipToGln = checkKeyAndReturnValue(barCode, 'ship_to_gln');
  if (shipToGln != null) {
    returnCode = '${returnCode}410$shipToGln';
  }
  var purchasedFromGln = checkKeyAndReturnValue(barCode, 'purchased_from_gln');
  if (purchasedFromGln != null) {
    returnCode = '${returnCode}412$purchasedFromGln';
  }

  var serial = checkKeyAndReturnValue(barCode, 'serial');
  if (serial != null) {
    returnCode = """${returnCode}21$serial""" '\u001D';
  }

  var count = checkKeyAndReturnValue(barCode, 'count');
  if (count != null) {
    returnCode = """${returnCode}37$count""" '\u001D';
  }

  var itemsCount = checkKeyAndReturnValue(barCode, 'itemsCount');
  if (itemsCount != null) {
    returnCode = """${returnCode}30$itemsCount""" '\u001D';
  }
  var batch = checkKeyAndReturnValue(barCode, 'batch');
  if (batch != null) {
    returnCode = """${returnCode}10$batch""" '\u001D';
  }
  var bestBefore = checkKeyAndReturnValue(barCode, 'best_before');
  if (bestBefore != null) {
    returnCode = """${returnCode}15$bestBefore""" '\u001D';
  }
  var additionalId = checkKeyAndReturnValue(barCode, 'additional_id');
  if (additionalId != null) {
    returnCode = '${returnCode}240$additionalId' '\u001D';
  }
  var orderReference = checkKeyAndReturnValue(barCode, 'order_reference');
  if (orderReference != null) {
    returnCode = '${returnCode}400$orderReference' '\u001D';
  }

  if (returnCode.endsWith('\u001D')) {
    returnCode.replaceFirst('\u001D', '', (returnCode.length - 2));
  }

  return returnCode;
}
