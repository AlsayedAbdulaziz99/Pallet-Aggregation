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

import '/backend/schema/enums/enums.dart';
import 'index.dart';
import '/custom_code/actions/index.dart';

import '/app_state.dart';

class ScannerListenerWidget extends StatefulWidget {
  const ScannerListenerWidget({
    super.key,
    this.width,
    this.height,
    required this.onPackPalletScan,
    required this.onPackBundleScan,
    required this.onSSCCVerifyScan,
    required this.OnScanCaseScan,
    required this.currentTabIndex,
    required this.onCartonActionScan,
    required this.isActive,
  });

  final double? width;
  final double? height;
  final Future Function(String code) onPackPalletScan;
  final Future Function(String code) onPackBundleScan;
  final Future Function(String code) onSSCCVerifyScan;
  final Future Function(String code) onCartonActionScan;
  final Future Function(String code) OnScanCaseScan;
  final int currentTabIndex;
  final bool isActive;

  @override
  State<ScannerListenerWidget> createState() => _ScannerListenerWidgetState();
}

class _ScannerListenerWidgetState extends State<ScannerListenerWidget> {
  @override
  void initState() {
    super.initState();
    scannerDataNotifier.removeListener(_onScanReceived);
    scannerDataNotifier.addListener(_onScanReceived);
  }

  void _onScanReceived() async {
    if (!widget.isActive) return;
    final code = scannerDataNotifier.value;
    if (code.isEmpty) return;

    scannerDataNotifier.value = '';

    switch (widget.currentTabIndex) {
      case 0:
        await widget.onPackPalletScan(code);
        break;
      case 1:
        await widget.onPackBundleScan(code);
        break;
      case 2:
        await widget.onSSCCVerifyScan(code);
        break;
      case 3:
        await widget.OnScanCaseScan(code);
        break;
      case 4:
        await widget.onCartonActionScan(code);
        break;
    }
  }

  @override
  void dispose() {
    scannerDataNotifier.removeListener(_onScanReceived);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
