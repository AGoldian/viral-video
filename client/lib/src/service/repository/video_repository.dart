import 'dart:io';

abstract class VideoRepository {
  Future<File?> loadVideo([String? path]);
}
