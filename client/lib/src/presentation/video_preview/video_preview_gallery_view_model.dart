import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
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

  final _cachedControllers = {};

  VideoPlayerController? controller;

  VideoPreviewGalleryViewModel({
    required NavigationManager navigationManager,
    required Api api,
  })  : _navigationManager = navigationManager,
        _api = api,
        super(const GalleryViewState.empty());

  void onBack() => _navigationManager.pop();

  Future<void> onEdit(String filename) async {
    final path =
        (await getExternalStorageDirectories(type: StorageDirectory.downloads))!
            .single
            .path;
    _navigationManager.openEditorPage('$path/$filename');
  }

  Future<void> updateDataWithNewModel(ProcessFileResponse model,
      [bool loading = false]) async {
    final dataOrNull = state.map(
      data: (data) => data,
      empty: (_) => null,
    );

    if (model.clips.isNotEmpty) {
      final List<VideoPreviewViewState> previews =
          List.from(dataOrNull?.videoPreviews ?? []);
      var i = 1;
      for (final clip in model.clips) {
        if (_cachedControllers.containsKey(clip.fileLink)) {
          i += 1;
          continue;
        }

        final video = await _api.getFile(clip.fileLink);
        final fileName = clip.fileLink.split('/')[1];
        if (!kIsWeb) {
          final path = (await getExternalStorageDirectories(
                  type: StorageDirectory.downloads))!
              .single
              .path;
          await video.saveTo('$path/$fileName');
          _cachedControllers[clip.fileLink] = VideoPlayerController.file(
            File('$path/$fileName'),
          );
        } else {
          _cachedControllers[clip.fileLink] = VideoPlayerController.networkUrl(
            Uri.parse(video.path),
          );
        }

        final previewController = _cachedControllers[clip.fileLink];
        previews.add(
          VideoPreviewViewState(
            title: 'Клип #$i',
            duration: parseDuration(clip.to) - parseDuration(clip.from),
            video: video,
            comment: clip.reason,
            previewController: previewController,
            filename: fileName,
          ),
        );
        i += 1;
      }

      state = GalleryViewState.data(
        appBarTitle: model.videoName,
        videoPreviews: previews,
        isLoading: loading,
        previewIndex: dataOrNull?.previewIndex,
      );
    } else {
      if (dataOrNull == null) {
        return;
      }

      state = dataOrNull.copyWith(
        isLoading: loading,
      );
    }
  }

  Future<void> onSelectPreview(int index) async {
    final dataOrNull = state.map(
      data: (data) => data,
      empty: (_) => null,
    );

    if (dataOrNull == null) {
      return;
    }

    if (kIsWeb) {
      state = dataOrNull.copyWith(
        previewIndex: index,
      );

      controller = VideoPlayerController.networkUrl(
        Uri.parse(dataOrNull.videoPreviews[index].video.path),
      );
    } else {
      final path = (await getExternalStorageDirectories(
              type: StorageDirectory.downloads))!
          .single
          .path;
      final filename = dataOrNull.videoPreviews[index].filename;
      _navigationManager.openPreviewPage(
        VideoPlayerController.file(
          File('$path/$filename'),
        ),
        dataOrNull.videoPreviews[index].comment,
      );
    }
  }
}
