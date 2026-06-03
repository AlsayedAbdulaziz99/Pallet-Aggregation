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
