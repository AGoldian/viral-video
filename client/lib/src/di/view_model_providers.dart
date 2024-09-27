import 'package:viral_video_client/src/presentation/pick_video/pick_video_view_model.dart';

import 'package:viral_video_client/src/service/repository/local_video_repository.dart';
import 'package:viral_video_client/src/service/repository/web_video_repository.dart';

const pickVideoViewModelProvider = PickVideoViewModel(
  localRepo: LocalVideoRepository(),
  webRepo: WebVideoRepository(),
);
