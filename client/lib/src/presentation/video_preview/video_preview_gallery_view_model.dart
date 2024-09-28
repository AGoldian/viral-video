import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viral_video_client/src/navigation/navigation_manager.dart';
import 'package:viral_video_client/src/presentation/video_preview/view_state/gallery_view_state.dart';
import 'package:viral_video_client/src/presentation/video_preview/view_state/video_preview_view_state.dart';

import '../../domain/models/process_file_response/process_file_response.dart';

class VideoPreviewGalleryViewModel extends StateNotifier<GalleryViewState> {
  final NavigationManager _navigationManager;
  VideoPreviewGalleryViewModel({
    required NavigationManager navigationManager,
  })  : _navigationManager = navigationManager,
        super(const GalleryViewState.empty());

  void onBack() => _navigationManager.pop();

  void updateDataWithNewModel(ProcessFileResponse model,
      [bool loading = false]) {
    if (model.clips.isNotEmpty) {
      state = GalleryViewState.data(
        appBarTitle: model.videoName,
        appBarSubtitle: 'тут еще что-то напишем',
        videoPreviews: model.clips
            .map(
              (clip) => const VideoPreviewViewState(
                title: 'title',
                duration: Duration(seconds: 10), // TODO: fill from backed
              ),
            )
            .toList(),
        isLoading: loading,
      );
    }
  }
}
