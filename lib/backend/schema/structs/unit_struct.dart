// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UnitStruct extends BaseStruct {
  UnitStruct({
    String? serial,
    String? batch,
    String? gtin,
    String? exp,
    String? dMString,
  })  : _serial = serial,
        _batch = batch,
        _gtin = gtin,
        _exp = exp,
        _dMString = dMString;

  // "serial" field.
  String? _serial;
  String get serial => _serial ?? '';
  set serial(String? val) => _serial = val;

  bool hasSerial() => _serial != null;

  // "batch" field.
  String? _batch;
  String get batch => _batch ?? '';
  set batch(String? val) => _batch = val;

  bool hasBatch() => _batch != null;

  // "gtin" field.
  String? _gtin;
  String get gtin => _gtin ?? '';
  set gtin(String? val) => _gtin = val;

  bool hasGtin() => _gtin != null;

  // "exp" field.
  String? _exp;
  String get exp => _exp ?? '';
  set exp(String? val) => _exp = val;

  bool hasExp() => _exp != null;

  // "DMString" field.
  String? _dMString;
  String get dMString => _dMString ?? '';
  set dMString(String? val) => _dMString = val;

  bool hasDMString() => _dMString != null;

  static UnitStruct fromMap(Map<String, dynamic> data) => UnitStruct(
        serial: data['serial'] as String?,
        batch: data['batch'] as String?,
        gtin: data['gtin'] as String?,
        exp: data['exp'] as String?,
        dMString: data['DMString'] as String?,
      );

  static UnitStruct? maybeFromMap(dynamic data) =>
      data is Map ? UnitStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'serial': _serial,
        'batch': _batch,
        'gtin': _gtin,
        'exp': _exp,
        'DMString': _dMString,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'serial': serializeParam(
          _serial,
          ParamType.String,
        ),
        'batch': serializeParam(
          _batch,
          ParamType.String,
        ),
        'gtin': serializeParam(
          _gtin,
          ParamType.String,
        ),
        'exp': serializeParam(
          _exp,
          ParamType.String,
        ),
        'DMString': serializeParam(
          _dMString,
          ParamType.String,
        ),
      }.withoutNulls;

  static UnitStruct fromSerializableMap(Map<String, dynamic> data) =>
      UnitStruct(
        serial: deserializeParam(
          data['serial'],
          ParamType.String,
          false,
        ),
        batch: deserializeParam(
          data['batch'],
          ParamType.String,
          false,
        ),
        gtin: deserializeParam(
          data['gtin'],
          ParamType.String,
          false,
        ),
        exp: deserializeParam(
          data['exp'],
          ParamType.String,
          false,
        ),
        dMString: deserializeParam(
          data['DMString'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UnitStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UnitStruct &&
        serial == other.serial &&
        batch == other.batch &&
        gtin == other.gtin &&
        exp == other.exp &&
        dMString == other.dMString;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([serial, batch, gtin, exp, dMString]);
}

UnitStruct createUnitStruct({
  String? serial,
  String? batch,
  String? gtin,
  String? exp,
  String? dMString,
}) =>
    UnitStruct(
      serial: serial,
      batch: batch,
      gtin: gtin,
      exp: exp,
      dMString: dMString,
    );
