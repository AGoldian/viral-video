import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:viral_video_client/src/di/view_model_providers.dart';

import '../presentation/video_editor/video_editor_page.dart';
import '../presentation/video_preview/preview_widget.dart';
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

  Future<void> openEditorPage(String path) => Navigator.of(_context).push(
        MaterialPageRoute(
          builder: (_) => VideoEditor(
            file: File(path),
          ),
        ),
      );

  Future<void> openPreviewPage(
          VideoPlayerController controller, String comment) =>
      Navigator.of(_context).push(
        MaterialPageRoute(
          builder: (_) => PreviewWidget(
            controller: controller,
            comment: comment,
          ),
        ),
      );
}
