import 'dart:io';

import 'package:flutter/material.dart';
import 'package:viral_video_client/src/presentation/video_preview/view_state/gallery_view_state.dart';
import 'package:viral_video_client/src/presentation/video_preview/view_state/video_preview_view_state.dart';

import '../presentation/video_editor/video_editor_view.dart';
import '../presentation/video_preview/video_preview_gallery.dart';

class NavigationManager {
  final GlobalKey<NavigatorState> _navigatorKey;

  const NavigationManager({
    required GlobalKey<NavigatorState> navigatorKey,
  }) : _navigatorKey = navigatorKey;

  BuildContext get _context => _navigatorKey.currentContext!;

  Future<void> openVideoPreviewGallery() => Navigator.of(_context).push(
        MaterialPageRoute(
          builder: (_) => const VideoPreviewGallery(
            galleryViewState: GalleryViewState(
              appBarTitle: 'Be Able To Let People Go',
              appBarSubtitle: 'Sep 28, 2024 00:53',
              videoPreviews: [
                VideoPreviewViewState(
                  title: 'Be Able To Let People Go',
                  duration: Duration(seconds: 48),
                ),
              ],
            ),
          ),
        ),
      );

  Future<File?> openVideoEdit(File file) => Navigator.of(_context).push(
        MaterialPageRoute(
          builder: (_) => VideoEditor(
            file: file,
          ),
        ),
      );
}
