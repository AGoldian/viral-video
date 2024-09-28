import 'package:viral_video_client/src/data/api.dart';
import 'package:viral_video_client/src/navigation/navigation_manager.dart';

import '../../service/repository/video_repository.dart';

class PickVideoViewModel {
  final Api _api;
  final VideoRepository _localRepo, _webRepo;
  final NavigationManager _navigationManager;

  const PickVideoViewModel({
    required Api api,
    required VideoRepository localRepo,
    required VideoRepository webRepo,
    required NavigationManager navigationManager,
  })  : _api = api,
        _localRepo = localRepo,
        _webRepo = webRepo,
        _navigationManager = navigationManager;

  Future<void> onSubmit(String path) async {
    _navigationManager.openVideoPreviewGallery();
  }

  Future<void> onPickFile() async {
    final file = await _localRepo.loadVideo();

    if (file == null) {
      // todo: show scaffold toast?
      return;
    }
    final path = await _api.saveFile(file);

    print(path);

    // file.create();

    // todo: post file path
  }
}
