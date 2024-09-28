import 'package:cross_file/cross_file.dart';

abstract class VideoRepository {
  Future<XFile?> loadVideo([String? path]);
}
