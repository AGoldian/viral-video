import 'package:cross_file/cross_file.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_preview_view_state.freezed.dart';

@freezed
class VideoPreviewViewState with _$VideoPreviewViewState {
  const factory VideoPreviewViewState({
    required String title,
    required Duration duration,
    required XFile video,
    required String comment,
  }) = _VideoPreviewViewState;
}

extension Formatter on Duration {
  String get asPrettyString {
    var microseconds = inMicroseconds;

    final hours = microseconds ~/ Duration.microsecondsPerHour;
    microseconds = microseconds.remainder(Duration.microsecondsPerHour);

    final minutes = microseconds ~/ Duration.microsecondsPerMinute;
    microseconds = microseconds.remainder(Duration.microsecondsPerMinute);

    final minutesPadding = minutes < 10 ? "0" : "";

    final seconds = microseconds ~/ Duration.microsecondsPerSecond;
    microseconds = microseconds.remainder(Duration.microsecondsPerSecond);

    var secondsPadding = seconds < 10 ? "0" : "";

    if (hours == 0) {
      return "$minutesPadding$minutes:"
          "$secondsPadding$seconds";
    }
    return "$hours:"
        "$minutesPadding$minutes:"
        "$secondsPadding$seconds";
  }
}
