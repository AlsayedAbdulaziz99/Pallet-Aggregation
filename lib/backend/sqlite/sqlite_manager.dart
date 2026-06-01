import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'remote_aggregation',
      'RemoteAggDB.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<ReadSSCCCounterRow>> readSSCCCounter({
    String? companyPrefix,
  }) =>
      performReadSSCCCounter(
        _database,
        companyPrefix: companyPrefix,
      );

  Future<List<ReadPalletConfigRow>> readPalletConfig({
    String? companyPrefix,
  }) =>
      performReadPalletConfig(
        _database,
        companyPrefix: companyPrefix,
      );

  Future<List<CheckCartonParentRelationRow>> checkCartonParentRelation({
    String? cartonSSCC,
  }) =>
      performCheckCartonParentRelation(
        _database,
        cartonSSCC: cartonSSCC,
      );

  Future<List<LoadGeneratedSSCCsRow>> loadGeneratedSSCCs({
    String? generatedSSCC,
  }) =>
      performLoadGeneratedSSCCs(
        _database,
        generatedSSCC: generatedSSCC,
      );

  Future<List<ReadAllSsccDataRow>> readAllSsccData() => performReadAllSsccData(
        _database,
      );

  Future<List<ReadAllBatchSerialsRow>> readAllBatchSerials() =>
      performReadAllBatchSerials(
        _database,
      );

  Future<List<ValidateUserRow>> validateUser({
    String? username,
    String? password,
  }) =>
      performValidateUser(
        _database,
        username: username,
        password: password,
      );

  Future<List<LoadBatchSerialsSnapShotRow>> loadBatchSerialsSnapShot() =>
      performLoadBatchSerialsSnapShot(
        _database,
      );

  Future<List<LoadUsersRow>> loadUsers() => performLoadUsers(
        _database,
      );

  Future<List<ReadAllAggregationConfigRow>> readAllAggregationConfig() =>
      performReadAllAggregationConfig(
        _database,
      );

  Future<List<CheckIfCartonInBatchRow>> checkIfCartonInBatch({
    String? cartonsscc,
  }) =>
      performCheckIfCartonInBatch(
        _database,
        cartonsscc: cartonsscc,
      );

  Future<List<ReadCartonsInPalletsCountRow>> readCartonsInPalletsCount({
    String? palletSSCC,
  }) =>
      performReadCartonsInPalletsCount(
        _database,
        palletSSCC: palletSSCC,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future insertBatchSerials({
    String? cartonSSCC,
    String? palletSSCC,
  }) =>
      performInsertBatchSerials(
        _database,
        cartonSSCC: cartonSSCC,
        palletSSCC: palletSSCC,
      );

  Future updateSSCCDataScanTime({
    String? palletSSCC,
    String? scanTimestamp,
  }) =>
      performUpdateSSCCDataScanTime(
        _database,
        palletSSCC: palletSSCC,
        scanTimestamp: scanTimestamp,
      );

  Future addPalletToSSCCData({
    String? palletSSCC,
    String? printTimestamp,
  }) =>
      performAddPalletToSSCCData(
        _database,
        palletSSCC: palletSSCC,
        printTimestamp: printTimestamp,
      );

  Future updatePalletCounter({
    int? palletCounter,
    String? companyPrefix,
  }) =>
      performUpdatePalletCounter(
        _database,
        palletCounter: palletCounter,
        companyPrefix: companyPrefix,
      );

  Future deleteFromSSCCData({
    String? palletsscc,
  }) =>
      performDeleteFromSSCCData(
        _database,
        palletsscc: palletsscc,
      );

  Future deleteFromBatchSerials({
    String? palletsscc,
  }) =>
      performDeleteFromBatchSerials(
        _database,
        palletsscc: palletsscc,
      );

  Future updateSerialsAfterImporting({
    String? shippersscc,
    String? palletsscc,
  }) =>
      performUpdateSerialsAfterImporting(
        _database,
        shippersscc: shippersscc,
        palletsscc: palletsscc,
      );

  Future deleteAllBatchSerials() => performDeleteAllBatchSerials(
        _database,
      );

  Future addUsers({
    String? username,
    String? password,
    String? level,
  }) =>
      performAddUsers(
        _database,
        username: username,
        password: password,
        level: level,
      );

  Future insertAggregationConfig({
    int? shipperCount,
    String? companyPrefix,
    int? palletCounter,
    int? extensionDigit,
  }) =>
      performInsertAggregationConfig(
        _database,
        shipperCount: shipperCount,
        companyPrefix: companyPrefix,
        palletCounter: palletCounter,
        extensionDigit: extensionDigit,
      );

  Future deleteAllSsccData() => performDeleteAllSsccData(
        _database,
      );

  Future deleteAllUsers() => performDeleteAllUsers(
        _database,
      );

  Future deleteAggregationConfig() => performDeleteAggregationConfig(
        _database,
      );

  Future insertGeneratedSerial({
    String? palletSSCC,
    String? status,
  }) =>
      performInsertGeneratedSerial(
        _database,
        palletSSCC: palletSSCC,
        status: status,
      );

  Future insertBatchCartons({
    String? cartonsscc,
  }) =>
      performInsertBatchCartons(
        _database,
        cartonsscc: cartonsscc,
      );

  Future deleteBatchCartons() => performDeleteBatchCartons(
        _database,
      );

  Future updateBatchSerials({
    String? palletSSCC,
    String? cartonSSCC,
  }) =>
      performUpdateBatchSerials(
        _database,
        palletSSCC: palletSSCC,
        cartonSSCC: cartonSSCC,
      );

  /// END UPDATE QUERY CALLS
}
