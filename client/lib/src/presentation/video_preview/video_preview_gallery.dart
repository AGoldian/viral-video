import 'package:flutter/material.dart';
import 'package:viral_video_client/src/presentation/video_preview/view_state/gallery_view_state.dart';
import 'package:viral_video_client/src/presentation/video_preview/view_state/video_preview_view_state.dart';

class VideoPreviewGallery extends StatelessWidget {
  final GalleryViewState galleryViewState;

  const VideoPreviewGallery({
    required this.galleryViewState,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              // TODO: onBack
            },
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(galleryViewState.appBarTitle),
              Text(galleryViewState.appBarSubtitle),
            ],
          ),
        ),
        body: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.white,
              child: Column(
                children: galleryViewState.videoPreviews
                    .map(
                      (item) => _PreviewItem(
                        viewState: item,
                      ),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              child: Container(
                color: const Color(0xFFF7F8F9),
              ),
            ),
          ],
        ),
      );
}

class _PreviewItem extends StatelessWidget {
  static const _previewSide = 96.0;

  final VideoPreviewViewState viewState;

  const _PreviewItem({
    required this.viewState,
  });

  @override
  Widget build(BuildContext context) => Card(
        child: Container(
          height: _previewSide,
          width: _previewSide * 4,
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Container(
                height: _previewSide,
                width: _previewSide,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFEFF1F4),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(viewState.title),
                    Text(viewState.duration.asPrettyString)
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
