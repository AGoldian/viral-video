import '../../service/repository/video_repository.dart';

class PickVideoViewModel {
  final VideoRepository _localRepo, _webRepo;
  const PickVideoViewModel({
    required VideoRepository localRepo,
    required VideoRepository webRepo,
  })  : _localRepo = localRepo,
        _webRepo = webRepo;

  Future<void> onSubmit(String path) async {}

  Future<void> onPickFile() async {
    final file = await _localRepo.loadVideo();

    if (file == null) {
      // todo: show scaffold toast?
      return;
    }

    file.create();

    // todo: post file path
  }
}
