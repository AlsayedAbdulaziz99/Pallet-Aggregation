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

import 'package:flutter_datawedge/flutter_datawedge.dart';
import 'dart:async';
import '/app_state.dart';

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
    with WidgetsBindingObserver {
  final FlutterDataWedge _dw = FlutterDataWedge();
  StreamSubscription<ScanResult>? _scanSubscription;
  StreamSubscription<ActionResult>? _eventSubscription;

  bool isDeviceSupported = false;
  bool _scannerInitialized = false;
  String? _lastScannedCode;
  String? errorMessage;

  // debounce fields
  String _lastCode = '';
  DateTime _lastScanTime = DateTime(0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _init();
  }

  Future<void> _init() async {
    if (_scannerInitialized) return;
    try {
      await _dw.initialize();
      await _dw.createDefaultProfile(profileName: 'PalletAggregation');
      isDeviceSupported = true;
      _scannerInitialized = true;
      _scanSubscription = _dw.onScanResult.listen(_onScanResult);
      _eventSubscription = _dw.onScannerEvent.listen(_onScannerEvent);
    } catch (e) {
      isDeviceSupported = false;
      errorMessage = e.toString();
    }
    if (mounted) setState(() {});
  }

  void _onScanResult(ScanResult result) {
    final code = result.data ?? '';
    if (code.isEmpty) return;

    final now = DateTime.now();
    if (code == _lastCode &&
        now.difference(_lastScanTime).inMilliseconds < 1000) {
      return;
    }
    _lastCode = code;
    _lastScanTime = now;

    setState(() {
      _lastScannedCode = code;
    });

    FFAppState().scannerdata = code;
    scannerDataNotifier.value = code;
  }

  void _onScannerEvent(ActionResult result) {
    // ActionResult carries DataWedge command acknowledgments.
    // No action needed — errors surface via initialize() failure.
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (!isDeviceSupported) return;
    switch (state) {
      case AppLifecycleState.resumed:
        _dw.enableScanner(true);
        break;
      case AppLifecycleState.paused:
        _dw.enableScanner(false);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isDeviceSupported)
              Text(
                'Device not supported',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.orange,
                      letterSpacing: 0,
                    ),
              )
            else
              Text(
                'Code: ${_lastScannedCode ?? 'Waiting for scan...'}',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0,
                    ),
              ),
            if (errorMessage != null)
              Text(
                'Error: $errorMessage',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.red,
                      letterSpacing: 0,
                    ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scanSubscription?.cancel();
    _eventSubscription?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
