import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_rent_house/config.dart';

class DioHttp {
  // final String path;

  Dio? _client;
  BuildContext? context;

  static DioHttp of(BuildContext context) {
    return DioHttp._internal(context);
  }

  DioHttp._internal(BuildContext ctx) {
    if (_client == null || ctx != context) {
      context = ctx;
      var options = BaseOptions(
          baseUrl: Config.baseUrl,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 3),
          extra: {'context': context});

      var dio = Dio(options);
      _client = dio;
    }
  }

  Future<Response<Map<String, dynamic>>> get(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return await _client!.get(path, queryParameters: params, options: options);
  }

  Future<Response<Map<String, dynamic>>> post(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return await _client!.post(path, data: params, options: options);
  }

  Future<Response<Map<String, dynamic>>> postFormData(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(
      contentType: Headers.multipartFormDataContentType,
      headers: {'Authorization': token},
    );
    return await _client!.post(path, data: params, options: options);
  }
}
