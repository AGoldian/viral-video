import 'package:cross_file/cross_file.dart';
import 'package:viral_video_client/src/service/repository/video_repository.dart';

class WebVideoRepository implements VideoRepository {
  const WebVideoRepository();

  @override
  Future<XFile?> loadVideo([String? path]) async {
    // TODO: download??
    return null;
  }
}
