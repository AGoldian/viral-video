import 'package:flutter/material.dart';
import 'package:viral_video_client/src/di/view_model_providers.dart';

import '../presentation/video_preview/video_preview_gallery.dart';

class NavigationManager {
  final GlobalKey<NavigatorState> _navigatorKey;

  const NavigationManager({
    required GlobalKey<NavigatorState> navigatorKey,
  }) : _navigatorKey = navigatorKey;

  BuildContext get _context => _navigatorKey.currentContext!;

  void pop() => Navigator.of(_context).pop();

  Future<void> openVideoPreviewGallery() => Navigator.of(_context).push(
        MaterialPageRoute(
          builder: (_) => VideoPreviewGallery(
            viewModel: galleryViewModelProvider,
          ),
        ),
      );
}
