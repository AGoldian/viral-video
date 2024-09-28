import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viral_video_client/src/data/api.dart';
import 'package:viral_video_client/src/navigation/navigation_manager.dart';
import 'package:viral_video_client/src/presentation/pick_video/view_state/pick_video_view_state.dart';
import 'dart:async';

import '../../service/repository/video_repository.dart';
import '../video_preview/video_preview_gallery_view_model.dart';

class PickVideoViewModel extends StateNotifier<PickVideoViewState> {
  final Api _api;
  final VideoRepository _localRepo, _webRepo;
  final NavigationManager _navigationManager;
  final VideoPreviewGalleryViewModel _galleryViewModel;
  late final Timer _pollingTimer;
  var _timerTicks = 0;

  PickVideoViewModel({
    required Api api,
    required VideoRepository localRepo,
    required VideoRepository webRepo,
    required NavigationManager navigationManager,
    required VideoPreviewGalleryViewModel galleryViewModel,
  })  : _api = api,
        _localRepo = localRepo,
        _webRepo = webRepo,
        _navigationManager = navigationManager,
        _galleryViewModel = galleryViewModel,
        super(const PickVideoViewState(isLoading: false));

  Future<void> onSubmit(String path) async {
    _navigationManager.openVideoPreviewGallery();
  }

  Future<void> onPickFile() async {
    state = state.copyWith(
      isLoading: true,
      processDescription: 'Выберите файл в открывшемся окне',
    );
    final file = await _localRepo.loadVideo();

    if (file == null) {
      // todo: show scaffold toast?
      state = state.copyWith(
        isLoading: false,
        processDescription: 'Выбор файла был отменён :(',
      );
      return;
    }
    state = state.copyWith(
      processDescription: 'Загружаем файл ${file.name}...',
    );
    final path = await _api.saveFile(file);

    state = state.copyWith(
      processDescription: 'Вырезаем лучшие моменты...',
    );

    _pollingTimer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) async {
        if (_timerTicks == 0) {
          _navigationManager.openVideoPreviewGallery();
        }
        _timerTicks += 1;
        // TODO: poll until result is not completed
        // final response = await _api.poll(ProcessFileRequest(path: path));
        // _galleryViewModel.updateDataWithNewModel(response, true);
      },
    );

    final model = await _api.processFile(
      path,
    );

    _galleryViewModel.updateDataWithNewModel(model);
  }
}
