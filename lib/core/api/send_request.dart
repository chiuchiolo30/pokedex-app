

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'http_method.dart';


dynamic _parseBody(dynamic body){
  try {
    return jsonEncode(body);
  } catch (_) {
    return body;
  }
}

Future<Response> sendRequest(
  String path,
  HttpMethod method,
  Map<String, String> headers,
  dynamic body,
  int timeout,
  Map<String, dynamic>? queryParameters
){
  var dio = Dio();
  var finalHeaders = {...headers};

  if (method != HttpMethod.get) {
    final contentType = headers["Content-Type"];

    if (contentType == null || contentType.contains("application/json")) {
      finalHeaders["Content-Type"] = "application/json; charset=utf-8;";
      body = _parseBody(body);
    }
  }

  if (!path.contains('https://') && !path.contains('http://')) {
    dio.options.baseUrl         = dotenv.env['BASE_URL']!;
  }
  
  dio.options.connectTimeout  = timeout;
  dio.options.headers         = finalHeaders;

  switch(method) {
    case HttpMethod.delete:
      return dio.delete(path, data:body);
    case HttpMethod.get:
      return dio.get(path, queryParameters: queryParameters);
    case HttpMethod.patch:
      return dio.patch(path, data:body);
    case HttpMethod.post:
      return dio.post(path, data:body);
    case HttpMethod.put:
      return dio.put(path, data:body);
  }
}