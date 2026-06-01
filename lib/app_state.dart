import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _apiBaseUrl = prefs.getString('ff_apiBaseUrl') ?? _apiBaseUrl;
    });
    _safeInit(() {
      _serverport = prefs.getString('ff_serverport') ?? _serverport;
    });
    _safeInit(() {
      _defaultPrinter = prefs.getString('ff_defaultPrinter') ?? _defaultPrinter;
    });
    _safeInit(() {
      _PrinterIP = prefs.getString('ff_PrinterIP') ?? _PrinterIP;
    });
    _safeInit(() {
      _printerPort = prefs.getString('ff_printerPort') ?? _printerPort;
    });
    _safeInit(() {
      _recipe = prefs.getString('ff_recipe') ?? _recipe;
    });
    _safeInit(() {
      _gtin = prefs.getString('ff_gtin') ?? _gtin;
    });
    _safeInit(() {
      _batchNumber = prefs.getString('ff_batchNumber') ?? _batchNumber;
    });
    _safeInit(() {
      _EXP = prefs.getString('ff_EXP') ?? _EXP;
    });
    _safeInit(() {
      _MFG = prefs.getString('ff_MFG') ?? _MFG;
    });
    _safeInit(() {
      _Quantity = prefs.getString('ff_Quantity') ?? _Quantity;
    });
    _safeInit(() {
      _companyName = prefs.getString('ff_companyName') ?? _companyName;
    });
    _safeInit(() {
      _companyPrefix = prefs.getString('ff_companyPrefix') ?? _companyPrefix;
    });
    _safeInit(() {
      _extensionDigit = prefs.getString('ff_extensionDigit') ?? _extensionDigit;
    });
    _safeInit(() {
      _DateFormat = prefs.getString('ff_DateFormat') ?? _DateFormat;
    });
    _safeInit(() {
      _palletCounter = prefs.getInt('ff_palletCounter') ?? _palletCounter;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _apiBaseUrl = '';
  String get apiBaseUrl => _apiBaseUrl;
  set apiBaseUrl(String value) {
    _apiBaseUrl = value;
    prefs.setString('ff_apiBaseUrl', value);
  }

  String _scannerdata = '';
  String get scannerdata => _scannerdata;
  set scannerdata(String value) {
    _scannerdata = value;
  }

  List<String> _scannedatalist = [];
  List<String> get scannedatalist => _scannedatalist;
  set scannedatalist(List<String> value) {
    _scannedatalist = value;
  }

  void addToScannedatalist(String value) {
    scannedatalist.add(value);
  }

  void removeFromScannedatalist(String value) {
    scannedatalist.remove(value);
  }

  void removeAtIndexFromScannedatalist(int index) {
    scannedatalist.removeAt(index);
  }

  void updateScannedatalistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    scannedatalist[index] = updateFn(_scannedatalist[index]);
  }

  void insertAtIndexInScannedatalist(int index, String value) {
    scannedatalist.insert(index, value);
  }

  List<BarcodelistStruct> _barcodelist = [];
  List<BarcodelistStruct> get barcodelist => _barcodelist;
  set barcodelist(List<BarcodelistStruct> value) {
    _barcodelist = value;
  }

  void addToBarcodelist(BarcodelistStruct value) {
    barcodelist.add(value);
  }

  void removeFromBarcodelist(BarcodelistStruct value) {
    barcodelist.remove(value);
  }

  void removeAtIndexFromBarcodelist(int index) {
    barcodelist.removeAt(index);
  }

  void updateBarcodelistAtIndex(
    int index,
    BarcodelistStruct Function(BarcodelistStruct) updateFn,
  ) {
    barcodelist[index] = updateFn(_barcodelist[index]);
  }

  void insertAtIndexInBarcodelist(int index, BarcodelistStruct value) {
    barcodelist.insert(index, value);
  }

  String _tatmeenButton = '';
  String get tatmeenButton => _tatmeenButton;
  set tatmeenButton(String value) {
    _tatmeenButton = value;
  }

  String _serverport = '';
  String get serverport => _serverport;
  set serverport(String value) {
    _serverport = value;
    prefs.setString('ff_serverport', value);
  }

  List<String> _GLNListAS = [];
  List<String> get GLNListAS => _GLNListAS;
  set GLNListAS(List<String> value) {
    _GLNListAS = value;
  }

  void addToGLNListAS(String value) {
    GLNListAS.add(value);
  }

  void removeFromGLNListAS(String value) {
    GLNListAS.remove(value);
  }

  void removeAtIndexFromGLNListAS(int index) {
    GLNListAS.removeAt(index);
  }

  void updateGLNListASAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    GLNListAS[index] = updateFn(_GLNListAS[index]);
  }

  void insertAtIndexInGLNListAS(int index, String value) {
    GLNListAS.insert(index, value);
  }

  List<String> _PrinterListAS = [];
  List<String> get PrinterListAS => _PrinterListAS;
  set PrinterListAS(List<String> value) {
    _PrinterListAS = value;
  }

  void addToPrinterListAS(String value) {
    PrinterListAS.add(value);
  }

  void removeFromPrinterListAS(String value) {
    PrinterListAS.remove(value);
  }

  void removeAtIndexFromPrinterListAS(int index) {
    PrinterListAS.removeAt(index);
  }

  void updatePrinterListASAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    PrinterListAS[index] = updateFn(_PrinterListAS[index]);
  }

  void insertAtIndexInPrinterListAS(int index, String value) {
    PrinterListAS.insert(index, value);
  }

  String _ssccAS = '';
  String get ssccAS => _ssccAS;
  set ssccAS(String value) {
    _ssccAS = value;
  }

  String _defaultPrinter = '';
  String get defaultPrinter => _defaultPrinter;
  set defaultPrinter(String value) {
    _defaultPrinter = value;
    prefs.setString('ff_defaultPrinter', value);
  }

  bool _ShipWithPack = false;
  bool get ShipWithPack => _ShipWithPack;
  set ShipWithPack(bool value) {
    _ShipWithPack = value;
  }

  bool _UnPackWithReceive = false;
  bool get UnPackWithReceive => _UnPackWithReceive;
  set UnPackWithReceive(bool value) {
    _UnPackWithReceive = value;
  }

  List<String> _ReturnsShipReason = [
    'Product does not match',
    'Quantity does not match',
    'Permit and Delivery Order mismatch',
    'Serial number mismatch',
    'Seal broken',
    'Packaging damaged',
    'Storage conditions violated',
    'Multiple supporting documents missing'
  ];
  List<String> get ReturnsShipReason => _ReturnsShipReason;
  set ReturnsShipReason(List<String> value) {
    _ReturnsShipReason = value;
  }

  void addToReturnsShipReason(String value) {
    ReturnsShipReason.add(value);
  }

  void removeFromReturnsShipReason(String value) {
    ReturnsShipReason.remove(value);
  }

  void removeAtIndexFromReturnsShipReason(int index) {
    ReturnsShipReason.removeAt(index);
  }

  void updateReturnsShipReasonAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ReturnsShipReason[index] = updateFn(_ReturnsShipReason[index]);
  }

  void insertAtIndexInReturnsShipReason(int index, String value) {
    ReturnsShipReason.insert(index, value);
  }

  String _recevierGLN = '';
  String get recevierGLN => _recevierGLN;
  set recevierGLN(String value) {
    _recevierGLN = value;
  }

  String _Reason = '';
  String get Reason => _Reason;
  set Reason(String value) {
    _Reason = value;
  }

  String _UnpackingObjectParent = '';
  String get UnpackingObjectParent => _UnpackingObjectParent;
  set UnpackingObjectParent(String value) {
    _UnpackingObjectParent = value;
  }

  String _ShipMSGID = '';
  String get ShipMSGID => _ShipMSGID;
  set ShipMSGID(String value) {
    _ShipMSGID = value;
  }

  int _scannedListSize = 0;
  int get scannedListSize => _scannedListSize;
  set scannedListSize(int value) {
    _scannedListSize = value;
  }

  String _PrinterIP = '';
  String get PrinterIP => _PrinterIP;
  set PrinterIP(String value) {
    _PrinterIP = value;
    prefs.setString('ff_PrinterIP', value);
  }

  String _printerPort = '';
  String get printerPort => _printerPort;
  set printerPort(String value) {
    _printerPort = value;
    prefs.setString('ff_printerPort', value);
  }

  String _recipe = '';
  String get recipe => _recipe;
  set recipe(String value) {
    _recipe = value;
    prefs.setString('ff_recipe', value);
  }

  String _gtin = '';
  String get gtin => _gtin;
  set gtin(String value) {
    _gtin = value;
    prefs.setString('ff_gtin', value);
  }

  String _batchNumber = '';
  String get batchNumber => _batchNumber;
  set batchNumber(String value) {
    _batchNumber = value;
    prefs.setString('ff_batchNumber', value);
  }

  String _EXP = '';
  String get EXP => _EXP;
  set EXP(String value) {
    _EXP = value;
    prefs.setString('ff_EXP', value);
  }

  String _MFG = '';
  String get MFG => _MFG;
  set MFG(String value) {
    _MFG = value;
    prefs.setString('ff_MFG', value);
  }

  String _Quantity = '';
  String get Quantity => _Quantity;
  set Quantity(String value) {
    _Quantity = value;
    prefs.setString('ff_Quantity', value);
  }

  String _companyName = '';
  String get companyName => _companyName;
  set companyName(String value) {
    _companyName = value;
    prefs.setString('ff_companyName', value);
  }

  String _companyPrefix = '';
  String get companyPrefix => _companyPrefix;
  set companyPrefix(String value) {
    _companyPrefix = value;
    prefs.setString('ff_companyPrefix', value);
  }

  String _extensionDigit = '';
  String get extensionDigit => _extensionDigit;
  set extensionDigit(String value) {
    _extensionDigit = value;
    prefs.setString('ff_extensionDigit', value);
  }

  String _DateFormat = '';
  String get DateFormat => _DateFormat;
  set DateFormat(String value) {
    _DateFormat = value;
    prefs.setString('ff_DateFormat', value);
  }

  List<AggregatedCartonStruct> _AggregatedPallet = [];
  List<AggregatedCartonStruct> get AggregatedPallet => _AggregatedPallet;
  set AggregatedPallet(List<AggregatedCartonStruct> value) {
    _AggregatedPallet = value;
  }

  void addToAggregatedPallet(AggregatedCartonStruct value) {
    AggregatedPallet.add(value);
  }

  void removeFromAggregatedPallet(AggregatedCartonStruct value) {
    AggregatedPallet.remove(value);
  }

  void removeAtIndexFromAggregatedPallet(int index) {
    AggregatedPallet.removeAt(index);
  }

  void updateAggregatedPalletAtIndex(
    int index,
    AggregatedCartonStruct Function(AggregatedCartonStruct) updateFn,
  ) {
    AggregatedPallet[index] = updateFn(_AggregatedPallet[index]);
  }

  void insertAtIndexInAggregatedPallet(
      int index, AggregatedCartonStruct value) {
    AggregatedPallet.insert(index, value);
  }

  int _palletCounter = 0;
  int get palletCounter => _palletCounter;
  set palletCounter(int value) {
    _palletCounter = value;
    prefs.setInt('ff_palletCounter', value);
  }

  String _userLevel = '';
  String get userLevel => _userLevel;
  set userLevel(String value) {
    _userLevel = value;
  }

  List<String> _CartonsToAggregate = [];
  List<String> get CartonsToAggregate => _CartonsToAggregate;
  set CartonsToAggregate(List<String> value) {
    _CartonsToAggregate = value;
  }

  void addToCartonsToAggregate(String value) {
    CartonsToAggregate.add(value);
  }

  void removeFromCartonsToAggregate(String value) {
    CartonsToAggregate.remove(value);
  }

  void removeAtIndexFromCartonsToAggregate(int index) {
    CartonsToAggregate.removeAt(index);
  }

  void updateCartonsToAggregateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    CartonsToAggregate[index] = updateFn(_CartonsToAggregate[index]);
  }

  void insertAtIndexInCartonsToAggregate(int index, String value) {
    CartonsToAggregate.insert(index, value);
  }

  List<String> _BatchCartons = [];
  List<String> get BatchCartons => _BatchCartons;
  set BatchCartons(List<String> value) {
    _BatchCartons = value;
  }

  void addToBatchCartons(String value) {
    BatchCartons.add(value);
  }

  void removeFromBatchCartons(String value) {
    BatchCartons.remove(value);
  }

  void removeAtIndexFromBatchCartons(int index) {
    BatchCartons.removeAt(index);
  }

  void updateBatchCartonsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    BatchCartons[index] = updateFn(_BatchCartons[index]);
  }

  void insertAtIndexInBatchCartons(int index, String value) {
    BatchCartons.insert(index, value);
  }

  bool _verify = false;
  bool get verify => _verify;
  set verify(bool value) {
    _verify = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
