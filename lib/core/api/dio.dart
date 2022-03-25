import 'dart:developer';
import 'package:dio/dio.dart';
import 'send_request.dart';
import 'http_method.dart';


class ApiDio {

  Future<dynamic> request<T>(
    String path, {
      HttpMethod method = HttpMethod.get,
      Map<String, String> headers = const {},
      Map<String, dynamic> queryParameters = const {},
      dynamic body,
      int timeout = 10000
    }) async {
      int? statusCode;
      dynamic data;
      try {
       

        final response = await sendRequest(path, method, headers, body, timeout, queryParameters);
        data = response.data ?? '';
        statusCode = response.statusCode;
        log('data: $data');
        log('statusCodes: $statusCode');       

        return response;
      } catch (e,s) {
        if (e is DioError) {
          log('error runtimeType: ${e.runtimeType.toString()}');
          log('error runtimeType name: ${e.type.name}');
          log('error response data: ${e.response!.data}');
          log('error runtimeType headers: ${e.response!.headers}');
          log('error runtimeType requestOptions: ${e.response!.requestOptions}');
          log('error message: ${e.message}');
          log('statusCode: ${e.response!.statusCode.toString()}');
        } else {
          log('error $e');
          log('stacktrace $s');
        }    
        return e;


      }

    }
}