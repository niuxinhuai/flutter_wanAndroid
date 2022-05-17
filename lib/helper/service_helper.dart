import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_wanandroid/constants/uri.dart';

class ServiceHelper {
  static Dio _dio = Dio(BaseOptions(
      baseUrl: Uri.baseUri,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      contentType: "application/x-www-form-urlencoded; charset=utf-8"));

  static Future<T> post<T>(
    String path, {
    data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio
        .post<T>(path,
            options: options,
            data: data,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress)
        .then((value) => value.data!);
  }

  static Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio
        .get<T>(path,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress)
        .then((value) => value.data!);
  }

  static Future<Response> download(
    String? urlPath,
    savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    lengthHeader = HttpHeaders.contentLengthHeader,
    data,
    Options? options,
  }) {
    return _dio.download(urlPath!, savePath,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        lengthHeader: lengthHeader,
        data: data,
        options: options);
  }

  static Future<T> upload<T>(String urlPath, Map<String, dynamic> data) {
    var formData = FormData.fromMap(data);
    return _dio.post<T>(urlPath, data: formData).then((value) => value.data!);
  }
}
