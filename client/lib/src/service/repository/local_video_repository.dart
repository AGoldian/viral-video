import 'package:cross_file/cross_file.dart';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:viral_video_client/src/service/repository/video_repository.dart';
import 'package:file_picker/file_picker.dart';

class LocalVideoRepository implements VideoRepository {
  const LocalVideoRepository();

  @override
  Future<XFile?> loadVideo([String? path]) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      dialogTitle: 'Выберите видео для загрузки',
      allowMultiple: false,
      type: FileType.video,
    );

    if (result != null) {
      return result.files.first.xFile;
    }

    return null;
  }
}
