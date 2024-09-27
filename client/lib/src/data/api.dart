import 'dart:io';

import '../domain/models/process_file_request/process_file_request.dart';
import '../domain/models/process_file_response/process_file_response.dart';

abstract class Api {
  Future<String> saveFile(File file);
  Future<ProcessFileResponse> processFile(ProcessFileRequest request);
}
