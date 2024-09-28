import 'package:cross_file/cross_file.dart';

import '../domain/models/process_file_response/process_file_response.dart';

abstract class Api {
  Future<String> saveFile(XFile file);
  Future<ProcessFileResponse> processFile(String path);
  Future<ProcessFileResponse> poll(String path);
  Future<XFile> getFile(String path);
}
