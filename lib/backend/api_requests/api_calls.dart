import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class UserloginCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? url,
  }) async {
    url ??= FFAppConstants.serverip;

    final ffApiRequestBody = '''
{
  "username": "${username}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Userlogin',
      apiUrl:
          'http://\${FFAppState().apiBaseUrl}:\${FFAppState().serverport}/Tatmeen_Backend/UAM/userlogin',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic loginstatus(dynamic response) => getJsonField(
        response,
        r'''$.loginstatus''',
      );
}

class ProductVerifyListCall {
  static Future<ApiCallResponse> call({
    List<String>? barcodeListList,
  }) async {
    final barcodeList = _serializeList(barcodeListList);

    final ffApiRequestBody = '''
{
  "barcode": ${barcodeList}
 
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ProductVerifyList',
      apiUrl:
          'http://\${FFAppState().apiBaseUrl}:\${FFAppState().serverport}/Tatmeen_Backend/ProductVerifyList',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PackingEventCall {
  static Future<ApiCallResponse> call({
    List<String>? barcodeListList,
    String? parent = '',
    String? invoiceOrder = '',
  }) async {
    final barcodeList = _serializeList(barcodeListList);

    final ffApiRequestBody = '''
{
  "Childs": ${barcodeList},
  "Parent": "${parent}",
  "ship": <Ship>,
  "RecieverGLN": "<RecieverGLN>",
  "ref_no": "${invoiceOrder}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PackingEvent',
      apiUrl:
          'http://\${FFAppState().apiBaseUrl}:\${FFAppState().serverport}/Tatmeen_Backend/TatmeenEvents/PackingEvent',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? tatmeenResponse(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response''',
      ));
}

class PrinterListCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'PrinterList',
      apiUrl:
          'http://\${FFAppState().apiBaseUrl}:\${FFAppState().serverport}/Tatmeen_Backend/Settings/GetPrinterList',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? printerlist(dynamic response) => (getJsonField(
        response,
        r'''$.printerlist''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GenerateSSCCCall {
  static Future<ApiCallResponse> call({
    String? gln = '',
    String? printer = '',
  }) async {
    final ffApiRequestBody = '''
{
  "receiver_gln": "${escapeStringForJson(gln)}",
  "printer_ip": "${escapeStringForJson(printer)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'generateSSCC',
      apiUrl:
          'http://\${FFAppState().apiBaseUrl}:\${FFAppState().serverport}/Tatmeen_Backend/TatmeenEvents/SSCCPrint',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? sscc(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.sscc''',
      ));
}

class GetCompanyInfoCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetCompanyInfo',
      apiUrl:
          'http://\${FFAppState().apiBaseUrl}:\${FFAppState().serverport}/RemoteAgg/Aggregation/GetCompanyInfo',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? companyName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.company_name''',
      ));
  static String? extensionDigit(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.extension_digit''',
      ));
  static String? companyPrefix(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.company_prefix''',
      ));
  static int? palletCounter(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.pallet_counter''',
      ));
}

class GetGTINCall {
  static Future<ApiCallResponse> call({
    String? recipeName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "Recipe_Name": "${escapeStringForJson(recipeName)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetGTIN',
      apiUrl:
          'http://\${FFAppState().apiBaseUrl}:\${FFAppState().serverport}/RemoteAgg/Aggregation/GetGTIN',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? gtin(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.GTIN''',
      ));
  static String? quantity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Quantity''',
      ));
}

class GetBatchInfoCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetBatchInfo',
      apiUrl:
          'http://\${FFAppState().apiBaseUrl}:\${FFAppState().serverport}/RemoteAgg/Serialization/GetBatchInfo',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? batchNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.Batch_Number''',
      ));
  static String? exp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.exp''',
      ));
  static String? mfg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.MFG''',
      ));
  static String? productName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.Product''',
      ));
  static String? dateFormat(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DateFormat''',
      ));
}

class CartonPalletRelationCall {
  static Future<ApiCallResponse> call({
    String? btachNumber = '',
  }) async {
    final ffApiRequestBody = '''
{
  "BatchNumber": "${escapeStringForJson(btachNumber)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CartonPalletRelation',
      apiUrl:
          'http://\${FFAppState().apiBaseUrl}:\${FFAppState().serverport}/RemoteAgg/Aggregation/GetCartonsPalletsRelation',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? cartons(dynamic response) => (getJsonField(
        response,
        r'''$.carton_sscc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? pallets(dynamic response) => (getJsonField(
        response,
        r'''$.pallet_sscc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AgregationdbSnapshotCall {
  static Future<ApiCallResponse> call({
    List<String>? palletsList,
    List<String>? cartonsList,
    String? batchNumber = '',
    int? palletCount,
    String? companyName = '',
  }) async {
    final pallets = _serializeList(palletsList);
    final cartons = _serializeList(cartonsList);

    final ffApiRequestBody = '''
{
  "Pallets": ${pallets},
  "Cartons": ${cartons},
  "BatchNumber": "${escapeStringForJson(batchNumber)}",
  "palletCounter": ${palletCount},
  "companyName": "${escapeStringForJson(companyName)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AgregationdbSnapshot',
      apiUrl:
          'http://\${FFAppState().apiBaseUrl}:\${FFAppState().serverport}/RemoteAgg/Aggregation/UpdateOpennedBatchTable',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Response''',
      ));
}

class LoadUsersCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'LoadUsers',
      apiUrl:
          'http://\${FFAppState().apiBaseUrl}:\${FFAppState().serverport}/RemoteAgg/Aggregation/LoadUsers',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? users(dynamic response) => (getJsonField(
        response,
        r'''$[:].username''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? passwords(dynamic response) => (getJsonField(
        response,
        r'''$[:].password''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? levels(dynamic response) => (getJsonField(
        response,
        r'''$[:].level''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SerializationdbSnapshotCall {
  static Future<ApiCallResponse> call({
    List<String>? palletsList,
    List<String>? cartonsList,
    String? batchNumber = '',
  }) async {
    final pallets = _serializeList(palletsList);
    final cartons = _serializeList(cartonsList);

    final ffApiRequestBody = '''
{
  "Pallets": ${pallets},
  "Cartons": ${cartons},
  "BatchNumber": "${escapeStringForJson(batchNumber)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SerializationdbSnapshot',
      apiUrl:
          'http://\${FFAppState().apiBaseUrl}:\${FFAppState().serverport}/RemoteAgg/Serialization/UpdateSerializationDBAfterAggregating',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LoadBatchSerialsCall {
  static Future<ApiCallResponse> call({
    String? batchNumber = '',
  }) async {
    final ffApiRequestBody = '''
{
  "BatchNumber": "${escapeStringForJson(batchNumber)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LoadBatchSerials',
      apiUrl:
          'https://65be-197-53-170-79.ngrok-free.app/RemoteAgg/Aggregation/LoadBatchSerials',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? batchCartons(dynamic response) => (getJsonField(
        response,
        r'''$.cartonsSSCC''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
