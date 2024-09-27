import 'dart:io';

import 'package:viral_video_client/src/service/repository/video_repository.dart';

class WebVideoRepository implements VideoRepository {
  const WebVideoRepository();

  @override
  Future<File?> loadVideo([String? path]) async {
    // TODO: download??
    return null;
  }
}
