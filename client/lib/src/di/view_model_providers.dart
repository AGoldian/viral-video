import 'package:viral_video_client/src/presentation/pick_video/pick_video_view_model.dart';

import '../presentation/video_preview/video_preview_gallery_view_model.dart';
import 'package:viral_video_client/src/service/repository/local_video_repository.dart';
import 'package:viral_video_client/src/service/repository/web_video_repository.dart';
import 'package:viral_video_client/src/di/service_providers.dart';

final pickVideoViewModelProvider = PickVideoViewModel(
  api: apiProvider,
  localRepo: const LocalVideoRepository(),
  webRepo: const WebVideoRepository(),
  navigationManager: navigationManagerProvider,
  galleryViewModel: galleryViewModelProvider,
);

final galleryViewModelProvider = VideoPreviewGalleryViewModel(
  api: apiProvider,
  navigationManager: navigationManagerProvider,
);
