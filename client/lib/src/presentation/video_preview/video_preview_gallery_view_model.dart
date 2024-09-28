import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:viral_video_client/src/data/api.dart';
import 'package:viral_video_client/src/navigation/navigation_manager.dart';
import 'package:viral_video_client/src/presentation/video_preview/view_state/gallery_view_state.dart';
import 'package:viral_video_client/src/presentation/video_preview/view_state/video_preview_view_state.dart';
import 'package:viral_video_client/src/service/utils.dart';

import '../../domain/models/process_file_response/process_file_response.dart';

class VideoPreviewGalleryViewModel extends StateNotifier<GalleryViewState> {
  final NavigationManager _navigationManager;
  final Api _api;

  VideoPlayerController? controller;

  VideoPreviewGalleryViewModel({
    required NavigationManager navigationManager,
    required Api api,
  })  : _navigationManager = navigationManager,
        _api = api,
        super(const GalleryViewState.empty());

  void onBack() => _navigationManager.pop();

  Future<void> updateDataWithNewModel(ProcessFileResponse model,
      [bool loading = false]) async {
    if (model.clips.isNotEmpty) {
      final List<VideoPreviewViewState> previews = [];
      var i = 1;
      for (final clip in model.clips) {
        final video = await _api.getFile(clip.fileLink);
        previews.add(
          VideoPreviewViewState(
            title: 'Клип #$i',
            duration: parseDuration(clip.to) - parseDuration(clip.from),
            video: video,
            comment: clip.reasons.join('\n'),
          ),
        );
        i += 1;
      }

      state = GalleryViewState.data(
        appBarTitle: model.videoName,
        videoPreviews: previews,
        isLoading: loading,
      );
    } else {
      final dataOrNull = state.map(
        data: (data) => data,
        empty: (_) => null,
      );

      if (dataOrNull == null) {
        return;
      }

      state = dataOrNull.copyWith(
        isLoading: loading,
      );
    }
  }

  void onSelectPreview(int index) {
    final dataOrNull = state.map(
      data: (data) => data,
      empty: (_) => null,
    );

    if (dataOrNull == null) {
      return;
    }

    controller = VideoPlayerController.networkUrl(
      Uri.parse(dataOrNull.videoPreviews[index].video.path),
    );

    state = dataOrNull.copyWith(previewIndex: index);
  }
}
