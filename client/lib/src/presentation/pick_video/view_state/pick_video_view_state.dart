import 'package:freezed_annotation/freezed_annotation.dart';

part 'pick_video_view_state.freezed.dart';

@freezed
class PickVideoViewState with _$PickVideoViewState {
  const factory PickVideoViewState({
    required bool isLoading,
    String? processDescription,
  }) = _PickVideoViewState;
}
