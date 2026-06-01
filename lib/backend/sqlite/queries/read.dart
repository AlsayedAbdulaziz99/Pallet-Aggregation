import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN READ SSCC COUNTER
Future<List<ReadSSCCCounterRow>> performReadSSCCCounter(
  Database database, {
  String? companyPrefix,
}) {
  final query = '''
SELECT pallet_counter FROM aggregation_config WHERE
 company_prefix_value = '${companyPrefix}';
''';
  return _readQuery(database, query, (d) => ReadSSCCCounterRow(d));
}

class ReadSSCCCounterRow extends SqliteRow {
  ReadSSCCCounterRow(Map<String, dynamic> data) : super(data);

  int get palletCounter => data['pallet_counter'] as int;
}

/// END READ SSCC COUNTER

/// BEGIN READ PALLET CONFIG
Future<List<ReadPalletConfigRow>> performReadPalletConfig(
  Database database, {
  String? companyPrefix,
}) {
  final query = '''
SELECT pallet_shipper_count FROM aggregation_config WHERE 
  company_prefix_value = '${companyPrefix}';
''';
  return _readQuery(database, query, (d) => ReadPalletConfigRow(d));
}

class ReadPalletConfigRow extends SqliteRow {
  ReadPalletConfigRow(Map<String, dynamic> data) : super(data);

  int get palletShipperCount => data['pallet_shipper_count'] as int;
}

/// END READ PALLET CONFIG

/// BEGIN CHECK CARTON PARENT RELATION
Future<List<CheckCartonParentRelationRow>> performCheckCartonParentRelation(
  Database database, {
  String? cartonSSCC,
}) {
  final query = '''
SELECT pallet_sscc FROM batch_serials WHERE
shipper_sscc = '${cartonSSCC}';
''';
  return _readQuery(database, query, (d) => CheckCartonParentRelationRow(d));
}

class CheckCartonParentRelationRow extends SqliteRow {
  CheckCartonParentRelationRow(Map<String, dynamic> data) : super(data);

  String? get shipperSSCC => data['Shipper_SSCC'] as String?;
}

/// END CHECK CARTON PARENT RELATION

/// BEGIN LOAD GENERATED SSCCS
Future<List<LoadGeneratedSSCCsRow>> performLoadGeneratedSSCCs(
  Database database, {
  String? generatedSSCC,
}) {
  final query = '''
SELECT pallet_sscc FROM batch_serials WHERE
pallet_sscc = '${generatedSSCC}';
''';
  return _readQuery(database, query, (d) => LoadGeneratedSSCCsRow(d));
}

class LoadGeneratedSSCCsRow extends SqliteRow {
  LoadGeneratedSSCCsRow(Map<String, dynamic> data) : super(data);

  List<String> get generatedSSCCs => data['GeneratedSSCCs'] as List<String>;
}

/// END LOAD GENERATED SSCCS

/// BEGIN READ ALL SSCC DATA
Future<List<ReadAllSsccDataRow>> performReadAllSsccData(
  Database database,
) {
  final query = '''
SELECT * FROM sscc_data
''';
  return _readQuery(database, query, (d) => ReadAllSsccDataRow(d));
}

class ReadAllSsccDataRow extends SqliteRow {
  ReadAllSsccDataRow(Map<String, dynamic> data) : super(data);

  String? get palletSscc => data['pallet_sscc'] as String?;
  String? get palletSsccPrintTimestamp =>
      data['pallet_sscc_print_timestamp'] as String?;
  String? get palletSsccScanTimestamp =>
      data['pallet_sscc_scan_timestamp'] as String?;
  int get id => data['id'] as int;
}

/// END READ ALL SSCC DATA

/// BEGIN READ ALL BATCH SERIALS
Future<List<ReadAllBatchSerialsRow>> performReadAllBatchSerials(
  Database database,
) {
  final query = '''
SELECT * FROM batch_serials
''';
  return _readQuery(database, query, (d) => ReadAllBatchSerialsRow(d));
}

class ReadAllBatchSerialsRow extends SqliteRow {
  ReadAllBatchSerialsRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String? get shipperSscc => data['shipper_sscc'] as String?;
  String? get palletSscc => data['pallet_sscc'] as String?;
}

/// END READ ALL BATCH SERIALS

/// BEGIN VALIDATEUSER
Future<List<ValidateUserRow>> performValidateUser(
  Database database, {
  String? username,
  String? password,
}) {
  final query = '''
SELECT username, password, level FROM user WHERE username = '${username}' AND password = '${password}';
''';
  return _readQuery(database, query, (d) => ValidateUserRow(d));
}

class ValidateUserRow extends SqliteRow {
  ValidateUserRow(Map<String, dynamic> data) : super(data);

  String? get username => data['username'] as String?;
  String? get password => data['password'] as String?;
  String? get level => data['level'] as String?;
}

/// END VALIDATEUSER

/// BEGIN LOADBATCHSERIALSSNAPSHOT
Future<List<LoadBatchSerialsSnapShotRow>> performLoadBatchSerialsSnapShot(
  Database database,
) {
  final query = '''
SELECT shipper_sscc, pallet_sscc FROM batch_serials
''';
  return _readQuery(database, query, (d) => LoadBatchSerialsSnapShotRow(d));
}

class LoadBatchSerialsSnapShotRow extends SqliteRow {
  LoadBatchSerialsSnapShotRow(Map<String, dynamic> data) : super(data);

  String get cartonsSSCC => data['CartonsSSCC'] as String;
  String get palletsSSCC => data['PalletsSSCC'] as String;
}

/// END LOADBATCHSERIALSSNAPSHOT

/// BEGIN LOAD USERS
Future<List<LoadUsersRow>> performLoadUsers(
  Database database,
) {
  final query = '''
SELECT username, password, level FROM user;
''';
  return _readQuery(database, query, (d) => LoadUsersRow(d));
}

class LoadUsersRow extends SqliteRow {
  LoadUsersRow(Map<String, dynamic> data) : super(data);

  String? get username => data['username'] as String?;
  String? get password => data['password'] as String?;
  String? get level => data['level'] as String?;
}

/// END LOAD USERS

/// BEGIN READ ALL AGGREGATION CONFIG
Future<List<ReadAllAggregationConfigRow>> performReadAllAggregationConfig(
  Database database,
) {
  final query = '''
SELECT pallet_shipper_count, company_prefix_value, pallet_counter, extension_digit FROM aggregation_config;
''';
  return _readQuery(database, query, (d) => ReadAllAggregationConfigRow(d));
}

class ReadAllAggregationConfigRow extends SqliteRow {
  ReadAllAggregationConfigRow(Map<String, dynamic> data) : super(data);

  int? get palletShiperCount => data['pallet_shiper_count'] as int?;
  String? get companyPrefixValue => data['company_prefix_value'] as String?;
  int? get palletCounter => data['pallet_counter'] as int?;
  int? get extensionDigit => data['extension_digit'] as int?;
}

/// END READ ALL AGGREGATION CONFIG

/// BEGIN CHECKIFCARTON IN BATCH
Future<List<CheckIfCartonInBatchRow>> performCheckIfCartonInBatch(
  Database database, {
  String? cartonsscc,
}) {
  final query = '''
SELECT carton_sscc FROM generated_Cartons WHERE carton_sscc = "00${cartonsscc}";
''';
  return _readQuery(database, query, (d) => CheckIfCartonInBatchRow(d));
}

class CheckIfCartonInBatchRow extends SqliteRow {
  CheckIfCartonInBatchRow(Map<String, dynamic> data) : super(data);

  String? get cartonSscc => data['carton_sscc'] as String?;
}

/// END CHECKIFCARTON IN BATCH

/// BEGIN READ CARTONS IN PALLETS COUNT
Future<List<ReadCartonsInPalletsCountRow>> performReadCartonsInPalletsCount(
  Database database, {
  String? palletSSCC,
}) {
  final query = '''
SELECT shipper_sscc FROM batch_serials WHERE
pallet_sscc = '${palletSSCC}';
''';
  return _readQuery(database, query, (d) => ReadCartonsInPalletsCountRow(d));
}

class ReadCartonsInPalletsCountRow extends SqliteRow {
  ReadCartonsInPalletsCountRow(Map<String, dynamic> data) : super(data);

  String? get shipperSscc => data['shipper_sscc'] as String?;
}

/// END READ CARTONS IN PALLETS COUNT
