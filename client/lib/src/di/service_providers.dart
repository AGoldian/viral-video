import 'package:flutter/cupertino.dart';
import 'package:viral_video_client/src/navigation/navigation_manager.dart';

final navigatorKeyProvider = GlobalKey<NavigatorState>(
  debugLabel: 'navigationManager',
);

final navigationManagerProvider = NavigationManager(
  navigatorKey: navigatorKeyProvider,
);
