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
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';

List<String> assemlbeCartonsList(
    List<AggregatedCartonStruct> aggregatedPallets) {
  List<String> result = [];
  for (int i = 0; i < aggregatedPallets.length; i++) {
    result.add(aggregatedPallets[i].cartonSSCC);
  }
  return result;
}
