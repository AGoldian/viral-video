import 'dart:io';

import 'package:dio/dio.dart';
import 'package:viral_video_client/src/data/api.dart';
import 'package:viral_video_client/src/domain/models/process_file_request/process_file_request.dart';
import 'package:viral_video_client/src/domain/models/process_file_response/process_file_response.dart';

const _base = '127.0.0.1';

class ApiImp implements Api {
  final Dio _dio;

  const ApiImp({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<ProcessFileResponse> processFile(ProcessFileRequest request) async {
    final response =
        await _dio.post<Map<String, dynamic>>('$_base/process_file');

    return ProcessFileResponse.fromJson(response.data!);
  }

  @override
  Future<String> saveFile(File file) async {
    final response = await _dio.post<String>('$_base/load_file');

    return response.data!;
  }
}
