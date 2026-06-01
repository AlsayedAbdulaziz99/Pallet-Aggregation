import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';

String? barcodelistjsonfromat(List<BarcodelistStruct>? barcodelist) {
  if (barcodelist == null || barcodelist.isEmpty) {
    return '[]';
  }
  final buffer = StringBuffer('[');
  for (int i = 0; i < barcodelist.length; i++) {
    buffer.write('{"barcode":"${barcodelist[i].barcode}"}');
    if (i < barcodelist.length - 1) {
      buffer.write(',');
    }
  }
  buffer.write(']');
}

String ssccGenerator(
  String companyPrefix,
  String extensionDigit,
  String palletCounter,
) {
  // Ensure inputs are valid
  /* if (companyPrefix.length != 7 ||
      extensionDigit.length != 1 ||
      gS1Prefix.length != 3) {
    throw ArgumentError('Invalid input lengths');
  }*/

  // Calculate serial number with leading zeros
  // Calculate serial number with leading zeros
  int companyPrefixLength = companyPrefix.length;
  int remainingDigits = 16 - companyPrefixLength;

  // Calculate serial number with leading zeros
  int serialNumber = int.parse(palletCounter) + 1;
  int serialNumberLength = serialNumber.toString().length;
  String serialNumberStr =
      serialNumber.toString().padLeft(remainingDigits, '0');

  // Combine all parts except the check digit
  String ssccWithoutCheck = '$extensionDigit$companyPrefix$serialNumberStr';

  // Calculate check digit using Modulo 10 algorithm
  int sum = 0;
  for (int i = 0; i < ssccWithoutCheck.length; i++) {
    int digit = int.parse(ssccWithoutCheck[i]);
    sum += digit * (i % 2 == 0 ? 3 : 1);
  }

  int checkDigitNum = (10 - (sum % 10)) % 10;
  String checkDigit = checkDigitNum.toString();

  // Return the full SSCC
  return '$ssccWithoutCheck$checkDigit';
}

String getCurrentTimestamp() {
  String now = DateTime.now().toLocal().toString();
  return now;
}

int getGeneratedSSCCQuerySize(List<LoadGeneratedSSCCsRow>? queryOutput) {
  // custome function that takes the response of a read SQLLite Query which is one column and return the size of it, and if it's null, return 0
  return queryOutput?.length ?? 0;
}

int getShippersQuerySize(List<CheckCartonParentRelationRow>? queryOutput) {
  return queryOutput?.length ?? 0;
}

int getValidateUserQuerySize(List<ValidateUserRow>? queryOutput) {
  return queryOutput?.length ?? 0;
}

List<AggregatedCartonStruct>? assembleSnapShotCall(
  List<String> palletsSSCC,
  List<String> cartonsSSCC,
  List<LoadBatchSerialsSnapShotRow> query,
) {
  List<AggregatedCartonStruct>? result = [];
  ;
  for (int i = 0; i < query.length; i++) {
    result!.add(AggregatedCartonStruct(
      palletSSCC: query[i].data["pallet_sscc"] as String,
      cartonSSCC: query[i].data["shipper_sscc"] as String,
    ));
  }
  ;
  return result;
}

List<String> assemblePalletsList(
    List<AggregatedCartonStruct> aggregatedPallet) {
  List<String> result = [];
  for (int i = 0; i < aggregatedPallet.length; i++) {
    result.add(aggregatedPallet[i].palletSSCC);
  }
  return result;
}

List<String> assemlbeCartonsList(
    List<AggregatedCartonStruct> aggregatedPallets) {
  List<String> result = [];
  for (int i = 0; i < aggregatedPallets.length; i++) {
    result.add(aggregatedPallets[i].cartonSSCC);
  }
  return result;
}

bool getCartonPalletRelationStatus(
  String? cartonSSCC,
  CheckCartonParentRelationRow? query,
) {
  // cstome function to check if a string is in the provided sqlrow query, if string is in the query return true, else return false
  if (cartonSSCC == null || query == null || query.data["pallet_sscc"] == "") {
    return false;
  }
  return true;
}

bool getCartonInBatchQueryStatus(
  CheckIfCartonInBatchRow? query,
  String? cartonSSCC,
) {
  // cstome function to check if a string is in the provided sqlrow query, if string is in the query return true, else return false
  if (cartonSSCC == null || query == null) {
    return false;
  }
  return true;
}
