import 'package:flutter/cupertino.dart';
import 'package:viral_video_client/src/navigation/navigation_manager.dart';

import 'package:dio/dio.dart';
import 'package:viral_video_client/src/data/api_impl.dart';

final navigatorKeyProvider = GlobalKey<NavigatorState>(
  debugLabel: 'navigationManager',
);

final navigationManagerProvider = NavigationManager(
  navigatorKey: navigatorKeyProvider,
);

final apiProvider = ApiImpl(
  dio: Dio(
    BaseOptions(
      headers: {
        "Access-Control-Allow-Origin": "*",
      },
    ),
  ),
);
