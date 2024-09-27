import 'package:freezed_annotation/freezed_annotation.dart';

part 'process_file_request.freezed.dart';

@freezed
class ProcessFileRequest with _$ProcessFileRequest {
  const factory ProcessFileRequest({
    required String path,
  }) = _ProcessFileRequest;
}
