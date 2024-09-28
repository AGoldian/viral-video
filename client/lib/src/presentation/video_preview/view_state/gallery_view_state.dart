import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viral_video_client/src/presentation/video_preview/view_state/video_preview_view_state.dart';

part 'gallery_view_state.freezed.dart';

@freezed
class GalleryViewState with _$GalleryViewState {
  const factory GalleryViewState.data({
    required String appBarTitle,
    required String appBarSubtitle,
    required List<VideoPreviewViewState> videoPreviews,
    required bool isLoading,
  }) = GalleryDataViewState;

  const factory GalleryViewState.empty() = GalleryEmptyViewState;
}
