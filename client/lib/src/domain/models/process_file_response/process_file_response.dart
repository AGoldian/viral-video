import 'package:freezed_annotation/freezed_annotation.dart';

import '../video_clip/video_clip.dart';

part 'process_file_response.freezed.dart';
part 'process_file_response.g.dart';

@freezed
class ProcessFileResponse with _$ProcessFileResponse {
  const factory ProcessFileResponse({
    required String videoName,
    required List<VideoClip> clips,
  }) = _ProcessFileResponse;

  factory ProcessFileResponse.fromJson(Map<String, Object?> json) =>
      _$ProcessFileResponseFromJson(json);
}
