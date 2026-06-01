// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/barcodetypes.dart';
import 'index.dart'; // Imports other custom widgets

import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';

import 'package:honeywell_scanner/honeywell_scanner.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';

class Getscannerdatawidget extends StatefulWidget {
  const Getscannerdatawidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<Getscannerdatawidget> createState() => _GetscannerdatawidgetState();
}

class _GetscannerdatawidgetState extends State<Getscannerdatawidget>
    implements ScannerCallback {
  List<Map> barCodes = [];
  Map errorResult = {};
  List<Map> aggregatedList = [];
  //String? eventReason = shippingReturnsReasonsList.first;

  HoneywellScanner honeywellScanner = HoneywellScanner();
  ScannedData? scannedData;
  String? errorMessage;
  String? result2;

  bool scannerEnabled = true;
  bool scan1DFormats = true;
  bool scan2DFormats = true;
  bool isDeviceSupported = false;

  bool enableFastScan = false;

  // selected items list
  List selectedItems = [];

  String printerName = '';

  List orderItems = [];
  int viewIndex = 0;
  @override
  void initState() {
    super.initState();
    honeywellScanner.startScanner();
    honeywellScanner.scannerCallback = this;
  }

  @override
  void onDecoded(ScannedData? scannedData) {
    String? barcodeData = scannedData?.code;
    if (mounted) {
      setState(() {
        Map result = parseGs1Code(
            barcodeData!, getSelectedLastEpc(barCodes, selectedItems));

        // if item is correct and not repeated and no items selected to add info
        if ((result != idErrorMap) &&
            !(checkDuplication(barCodes, result)) &&
            selectedItems.isEmpty) {
          setState(() {
            barCodes.insert(0, result);
          });
        }
        // if item selected to add info
        else {
          // if item is correct and item selected to add info
          if ((result != idErrorMap) && selectedItems.isNotEmpty) {
            if (barCodes[selectedItems[0]]['id'] == result['id']) {
              setState(() {
                barCodes[selectedItems[0]] = result;
                selectedItems.clear();
              });
            }
          }
        }
      });

      setState(() {
        //aggregatedList = gtinAggregatedView(barCodes, []);
        FFAppState().scannerdata = barCodes[0]['SSCC'].toString();
        barCodes = [];
      });
    }
  }

  @override
  void onError(Exception error) {
    setState(() {
      errorMessage = error.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'code:${FFAppState().scannerdata}',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    honeywellScanner.stopScanner();
    super.dispose();
  }
}
