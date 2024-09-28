import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viral_video_client/src/data/api.dart';
import 'package:viral_video_client/src/navigation/navigation_manager.dart';
import 'package:viral_video_client/src/presentation/pick_video/view_state/pick_video_view_state.dart';

import '../../service/repository/video_repository.dart';

class PickVideoViewModel extends StateNotifier<PickVideoViewState> {
  final Api _api;
  final VideoRepository _localRepo, _webRepo;
  final NavigationManager _navigationManager;

  PickVideoViewModel({
    required Api api,
    required VideoRepository localRepo,
    required VideoRepository webRepo,
    required NavigationManager navigationManager,
  })  : _api = api,
        _localRepo = localRepo,
        _webRepo = webRepo,
        _navigationManager = navigationManager,
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
      state = state.copyWith(isLoading: false);
      return;
    }
    state = state.copyWith(
      processDescription: 'Загружаем файл ${file.name}...',
    );
    final path = await _api.saveFile(file);

    state = state.copyWith(
      isLoading: false,
      processDescription: 'Файл загружен успешно',
    );

    // todo: run model
    print(path);
  }
}
