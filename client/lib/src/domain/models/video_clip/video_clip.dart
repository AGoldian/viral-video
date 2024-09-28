import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_clip.freezed.dart';
part 'video_clip.g.dart';

@freezed
class VideoClip with _$VideoClip {
  const factory VideoClip({
    required String from,
    required String to,
    required String reason,
    required String fileLink,
  }) = _VideoClip;

  factory VideoClip.fromJson(Map<String, Object?> json) =>
      _$VideoClipFromJson(json);
}
