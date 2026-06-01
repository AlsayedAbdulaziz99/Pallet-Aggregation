// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'package:intl/intl.dart';
import 'package:zebrautility/ZebraPrinter.dart';
import 'package:zebrautility/zebrautility.dart';

Future printLable(
    String printerIP,
    String batchNo,
    String recipe,
    String gtin,
    String mfg,
    String exp,
    String qty,
    String sscc,
    String dateFormat,
    String companyName) async {
  // Add your function code here!
  String zpl = formatZplCode(
      batchNo, recipe, gtin, mfg, exp, qty, sscc, dateFormat, companyName);
  printZpl(printerIP, zpl);
}

Future<Map> printZpl(String printerIp, String zplCode) async {
  try {
    return await Zebrautility.getPrinterInstance()
        .then((ZebraPrinter zebraPrinter) async {
      await zebraPrinter.connectToPrinter(printerIp);
      return Future.delayed(const Duration(milliseconds: 500), () {
        zebraPrinter.print(zplCode.toString());
        Future.delayed(const Duration(milliseconds: 500), () {
          zebraPrinter.disconnect();
        });
        return {'result': true, 'message': 'good'};
      });
    });
  } catch (error) {
    return {'result': null, 'message': error.toString()};
  }
}

/*Future<Map> printLabel(String batchNo, String recipe, String gtin, String mfg,
    String exp, String qty, String sscc, String dateFormat) {
  return getPrinterIp().then((printerIpData) {
    if (printerIpData['result'] != null) {
      String zplCode =
          formatZplCode(batchNo, recipe, gtin, mfg, exp, qty, sscc, dateFormat);
      return printZpl(printerIpData['result'], zplCode).then((result) {
        if (result['result'] != null) {
          return {'result': true, 'message': 'good'};
        } else {
          return {'result': null, 'message': result['message']};
        }
      });
    } else {
      return {'result': null, 'message': printerIpData['message']};
    }
  });
}*/

String formatZplCode(
    String batchNo,
    String recipe,
    String gtin,
    String mfg,
    String exp,
    String qty,
    String sscc,
    String dateFormat,
    String companyName) {
  String date = DateFormat('yyyy-MM-dd H:m:s').format(DateTime.now());
  mfg = formatDate(mfg, dateFormat);
  exp = formatDate(exp, dateFormat);
  String ssccBarcode = '00$sscc';
  String ssccText = '(00)$sscc';
  String zplCode = '''^XA
^FX Top section with logo, name and address.
^CF0,60
^FO350,50^FD$companyName..^FS

^FO150,150^GB700,3,3^FS
^A2N,25,25
^FO120,200
^FD BATCH NO :<BATCH_VAR>^FS

^A2N,25,25
^FO550,200
^FD Product :<PRD_VAR>^FS

^A2N,25,25
^FO120,250
^FD GTIN :<GTIN_VAR>^FS

^A2N,25,25
^FO550,250
^FD Quantity  :<QTY_VAR> Master Box^FS

^A2N,25,25
^FO120,300
^FD Mfg :<MFG_VAR>^FS

^A2N,25,25
^FO550,300
^FD EXP :<EXP_VAR>^FS

^A2N,30,30
^FO180,350
^FD Temperature not exceeding 30 C^FS

^A2N,30,30
^FO180,400
^FD Date Created <Date_VAR>^FS

^A2N,30,30
^FO230,510
^FD SSCC <TSSCC_VAR>^FS
^FO150,470^GB700,3,3^FS
^FO250,550^BCN,150,Y,N,,D
^FDSSCC_VAR^FS
^XZ''';
  zplCode = zplCode.replaceAll('<BATCH_VAR>', batchNo);
  zplCode = zplCode.replaceAll('<PRD_VAR>', recipe);
  zplCode = zplCode.replaceAll('<GTIN_VAR>', gtin);
  zplCode = zplCode.replaceAll('<QTY_VAR>', qty);
  zplCode = zplCode.replaceAll('<MFG_VAR>', mfg);
  zplCode = zplCode.replaceAll('<EXP_VAR>', exp);
  zplCode = zplCode.replaceAll('<Date_VAR>', date);
  zplCode = zplCode.replaceAll('<TSSCC_VAR>', ssccText);
  zplCode = zplCode.replaceAll('SSCC_VAR', ssccBarcode);
  return zplCode;
}

String formatDate(String date, String format) {
  try {
    date =
        '${date.substring(0, 2)}.${date.substring(2, 4)}.${date.substring(4, 6)}';
    format = format.replaceAll('Y', 'y');
    format = format.replaceAll('D', 'd');
    format = format.replaceAll('m', 'M');
    format = format.replaceAll('[', '');
    format = format.replaceAll(']', '');
    format = format.replaceAll('-', '/');

    DateFormat sourceFormat = DateFormat("yy.MM.dd");
    DateTime dateObject = sourceFormat.parse(date);
    DateFormat destinationFormat = DateFormat(format);
    String formattedDate = destinationFormat.format(dateObject);
    return formattedDate;
  } catch (e) {
    return date;
  }
}
