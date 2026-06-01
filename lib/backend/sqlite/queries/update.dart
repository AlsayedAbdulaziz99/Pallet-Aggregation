import 'package:sqflite/sqflite.dart';

/// BEGIN INSERT BATCH SERIALS
Future performInsertBatchSerials(
  Database database, {
  String? cartonSSCC,
  String? palletSSCC,
}) {
  final query = '''
INSERT INTO  batch_serials  (shipper_sscc, pallet_sscc) VALUES ('${cartonSSCC}','${palletSSCC}');
''';
  return database.rawQuery(query);
}

/// END INSERT BATCH SERIALS

/// BEGIN UPDATE SSCC DATA SCAN TIME
Future performUpdateSSCCDataScanTime(
  Database database, {
  String? palletSSCC,
  String? scanTimestamp,
}) {
  final query = '''
UPDATE sscc_data   SET  pallet_sscc_scan_timestamp = '${scanTimestamp}' WHERE
pallet_sscc = '${palletSSCC}';
''';
  return database.rawQuery(query);
}

/// END UPDATE SSCC DATA SCAN TIME

/// BEGIN ADD PALLET TO SSCC DATA
Future performAddPalletToSSCCData(
  Database database, {
  String? palletSSCC,
  String? printTimestamp,
}) {
  final query = '''
INSERT INTO sscc_data (`pallet_sscc`, `pallet_sscc_Print_timestamp`)  VALUES ('${palletSSCC}','${printTimestamp}');
''';
  return database.rawQuery(query);
}

/// END ADD PALLET TO SSCC DATA

/// BEGIN UPDATE PALLET COUNTER
Future performUpdatePalletCounter(
  Database database, {
  int? palletCounter,
  String? companyPrefix,
}) {
  final query = '''
UPDATE aggregation_config SET pallet_counter = ${palletCounter} WHERE 
company_prefix_value = '${companyPrefix}';
''';
  return database.rawQuery(query);
}

/// END UPDATE PALLET COUNTER

/// BEGIN DELETEFROMSSCCDATA
Future performDeleteFromSSCCData(
  Database database, {
  String? palletsscc,
}) {
  final query = '''
DELETE FROM sscc_data WHERE pallet_sscc = '${palletsscc}';
''';
  return database.rawQuery(query);
}

/// END DELETEFROMSSCCDATA

/// BEGIN DELETEFROMBATCHSERIALS
Future performDeleteFromBatchSerials(
  Database database, {
  String? palletsscc,
}) {
  final query = '''
DELETE FROM batch_serials WHERE pallet_sscc = '${palletsscc}';
''';
  return database.rawQuery(query);
}

/// END DELETEFROMBATCHSERIALS

/// BEGIN UPDATESERIALSAFTERIMPORTING
Future performUpdateSerialsAfterImporting(
  Database database, {
  String? shippersscc,
  String? palletsscc,
}) {
  final query = '''
INSERT INTO batch_serials (shipper_sscc, pallet_sscc) VALUES ('${shippersscc}','${palletsscc}');
''';
  return database.rawQuery(query);
}

/// END UPDATESERIALSAFTERIMPORTING

/// BEGIN DELETE ALL BATCH SERIALS
Future performDeleteAllBatchSerials(
  Database database,
) {
  final query = '''
DELETE FROM batch_serials;
''';
  return database.rawQuery(query);
}

/// END DELETE ALL BATCH SERIALS

/// BEGIN ADDUSERS
Future performAddUsers(
  Database database, {
  String? username,
  String? password,
  String? level,
}) {
  final query = '''
INSERT INTO user (username, password, level) VALUES ("${username}", "${password}", "${level}");
''';
  return database.rawQuery(query);
}

/// END ADDUSERS

/// BEGIN INSERT AGGREGATION CONFIG
Future performInsertAggregationConfig(
  Database database, {
  int? shipperCount,
  String? companyPrefix,
  int? palletCounter,
  int? extensionDigit,
}) {
  final query = '''
INSERT INTO aggregation_config (pallet_shipper_count, company_prefix_value, pallet_counter, extension_digit) VALUES(
  "${shipperCount}","${companyPrefix}", ${palletCounter}, ${extensionDigit});
''';
  return database.rawQuery(query);
}

/// END INSERT AGGREGATION CONFIG

/// BEGIN DELETE ALL SSCC DATA
Future performDeleteAllSsccData(
  Database database,
) {
  final query = '''
DELETE FROM sscc_data;
''';
  return database.rawQuery(query);
}

/// END DELETE ALL SSCC DATA

/// BEGIN DELETE ALL USERS
Future performDeleteAllUsers(
  Database database,
) {
  final query = '''
DELETE FROM user;
''';
  return database.rawQuery(query);
}

/// END DELETE ALL USERS

/// BEGIN DELETE AGGREGATION CONFIG
Future performDeleteAggregationConfig(
  Database database,
) {
  final query = '''
DELETE FROM aggregation_config;
''';
  return database.rawQuery(query);
}

/// END DELETE AGGREGATION CONFIG

/// BEGIN INSERTGENERATEDSERIAL
Future performInsertGeneratedSerial(
  Database database, {
  String? palletSSCC,
  String? status,
}) {
  final query = '''
INSERT INTO generated_pallets (SSCC, consumed) VALUES ("${palletSSCC}", "${status}");
''';
  return database.rawQuery(query);
}

/// END INSERTGENERATEDSERIAL

/// BEGIN INSERTBATCHCARTONS
Future performInsertBatchCartons(
  Database database, {
  String? cartonsscc,
}) {
  final query = '''
INSERT INTO generated_cartons (carton_sscc) VALUES ("${cartonsscc}");
''';
  return database.rawQuery(query);
}

/// END INSERTBATCHCARTONS

/// BEGIN DELETE BATCH CARTONS
Future performDeleteBatchCartons(
  Database database,
) {
  final query = '''
DELETE FROM generated_Cartons;
''';
  return database.rawQuery(query);
}

/// END DELETE BATCH CARTONS

/// BEGIN UPDATE BATCH SERIALS
Future performUpdateBatchSerials(
  Database database, {
  String? palletSSCC,
  String? cartonSSCC,
}) {
  final query = '''
UPDATE batch_serials SET pallet_sscc = "${palletSSCC}" WHERE shipper_sscc = "${cartonSSCC}";
''';
  return database.rawQuery(query);
}

/// END UPDATE BATCH SERIALS
