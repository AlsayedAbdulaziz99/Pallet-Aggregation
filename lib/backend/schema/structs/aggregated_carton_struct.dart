// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AggregatedCartonStruct extends BaseStruct {
  AggregatedCartonStruct({
    String? cartonSSCC,
    String? palletSSCC,
  })  : _cartonSSCC = cartonSSCC,
        _palletSSCC = palletSSCC;

  // "CartonSSCC" field.
  String? _cartonSSCC;
  String get cartonSSCC => _cartonSSCC ?? '';
  set cartonSSCC(String? val) => _cartonSSCC = val;

  bool hasCartonSSCC() => _cartonSSCC != null;

  // "PalletSSCC" field.
  String? _palletSSCC;
  String get palletSSCC => _palletSSCC ?? '';
  set palletSSCC(String? val) => _palletSSCC = val;

  bool hasPalletSSCC() => _palletSSCC != null;

  static AggregatedCartonStruct fromMap(Map<String, dynamic> data) =>
      AggregatedCartonStruct(
        cartonSSCC: data['CartonSSCC'] as String?,
        palletSSCC: data['PalletSSCC'] as String?,
      );

  static AggregatedCartonStruct? maybeFromMap(dynamic data) => data is Map
      ? AggregatedCartonStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'CartonSSCC': _cartonSSCC,
        'PalletSSCC': _palletSSCC,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'CartonSSCC': serializeParam(
          _cartonSSCC,
          ParamType.String,
        ),
        'PalletSSCC': serializeParam(
          _palletSSCC,
          ParamType.String,
        ),
      }.withoutNulls;

  static AggregatedCartonStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AggregatedCartonStruct(
        cartonSSCC: deserializeParam(
          data['CartonSSCC'],
          ParamType.String,
          false,
        ),
        palletSSCC: deserializeParam(
          data['PalletSSCC'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AggregatedCartonStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AggregatedCartonStruct &&
        cartonSSCC == other.cartonSSCC &&
        palletSSCC == other.palletSSCC;
  }

  @override
  int get hashCode => const ListEquality().hash([cartonSSCC, palletSSCC]);
}

AggregatedCartonStruct createAggregatedCartonStruct({
  String? cartonSSCC,
  String? palletSSCC,
}) =>
    AggregatedCartonStruct(
      cartonSSCC: cartonSSCC,
      palletSSCC: palletSSCC,
    );
