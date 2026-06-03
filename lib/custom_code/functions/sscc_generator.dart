import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';

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
