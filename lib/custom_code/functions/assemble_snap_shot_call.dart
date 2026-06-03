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
