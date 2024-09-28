import 'package:dio/dio.dart';
import 'package:viral_video_client/src/data/api_iml.dart';
import 'package:viral_video_client/src/di/service_providers.dart';
import 'package:viral_video_client/src/presentation/pick_video/pick_video_view_model.dart';

import 'package:viral_video_client/src/service/repository/local_video_repository.dart';
import 'package:viral_video_client/src/service/repository/web_video_repository.dart';

final pickVideoViewModelProvider = PickVideoViewModel(
  api: ApiImp(
    dio: Dio(
      BaseOptions(
        headers: {
          "Access-Control-Allow-Origin": "*",
          // "Access-Control-Allow-Origin": "*",
        },
      ),
    ),
  ),
  localRepo: const LocalVideoRepository(),
  webRepo: const WebVideoRepository(),
  navigationManager: navigationManagerProvider,
);
