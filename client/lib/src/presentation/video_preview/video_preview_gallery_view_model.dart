import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:viral_video_client/src/data/api.dart';
import 'package:viral_video_client/src/navigation/navigation_manager.dart';
import 'package:viral_video_client/src/presentation/video_preview/view_state/gallery_view_state.dart';
import 'package:viral_video_client/src/presentation/video_preview/view_state/video_preview_view_state.dart';

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
      for (final clip in model.clips) {
        final video = await _api.getFile(clip.fileLink);
        previews.add(
          VideoPreviewViewState(
            title: 'title',
            duration: const Duration(seconds: 10),
            video: video,
          ),
        );
      }

      state = GalleryViewState.data(
        appBarTitle: model.videoName,
        appBarSubtitle: 'тут еще что-то напишем',
        videoPreviews: previews,
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
