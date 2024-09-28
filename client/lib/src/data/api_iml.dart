import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:viral_video_client/src/data/api.dart';
import 'package:viral_video_client/src/domain/models/process_file_response/process_file_response.dart';

const _base = 'http://127.0.0.1:8000';

class ApiImp implements Api {
  final Dio _dio;

  const ApiImp({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<ProcessFileResponse> processFile(String path) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '$_base/process_file',
      data: {'path': path},
    );

    return ProcessFileResponse.fromJson(response.data!);
  }

  @override
  Future<String> saveFile(XFile file) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '$_base/load_file',
      data: MultipartFile.fromBytes(await file.readAsBytes()).finalize(),
      options: Options(
        contentType: 'application/octet-stream',
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    return response.data!['filePath'];
  }

  @override
  Future<ProcessFileResponse> poll(String path) {
    // TODO: implement poll
    throw UnimplementedError();
  }

  @override
  Future<XFile> getFile(String path) async {
    final response = await _dio.get(
      '$_base/files/$path',
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
      ),
    );

    return XFile.fromData(response.data);
  }
}
