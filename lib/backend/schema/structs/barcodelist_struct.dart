// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BarcodelistStruct extends BaseStruct {
  BarcodelistStruct({
    String? barcode,
  }) : _barcode = barcode;

  // "barcode" field.
  String? _barcode;
  String get barcode => _barcode ?? '';
  set barcode(String? val) => _barcode = val;

  bool hasBarcode() => _barcode != null;

  static BarcodelistStruct fromMap(Map<String, dynamic> data) =>
      BarcodelistStruct(
        barcode: data['barcode'] as String?,
      );

  static BarcodelistStruct? maybeFromMap(dynamic data) => data is Map
      ? BarcodelistStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'barcode': _barcode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'barcode': serializeParam(
          _barcode,
          ParamType.String,
        ),
      }.withoutNulls;

  static BarcodelistStruct fromSerializableMap(Map<String, dynamic> data) =>
      BarcodelistStruct(
        barcode: deserializeParam(
          data['barcode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BarcodelistStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BarcodelistStruct && barcode == other.barcode;
  }

  @override
  int get hashCode => const ListEquality().hash([barcode]);
}

BarcodelistStruct createBarcodelistStruct({
  String? barcode,
}) =>
    BarcodelistStruct(
      barcode: barcode,
    );
