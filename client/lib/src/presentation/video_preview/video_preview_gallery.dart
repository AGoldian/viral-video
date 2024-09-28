import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:viral_video_client/src/common/state_notifier_widget.dart';
import 'package:viral_video_client/src/presentation/theme/app_text_theme.dart';
import 'package:viral_video_client/src/presentation/video_preview/video_preview_gallery_view_model.dart';
import 'package:viral_video_client/src/presentation/video_preview/view_state/video_preview_view_state.dart';

class VideoPreviewGallery extends StatelessWidget {
  final VideoPreviewGalleryViewModel viewModel;

  const VideoPreviewGallery({
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) => StateNotifierWidget(
        notifier: viewModel,
        dataBuilder: (context, state) => state.map(
          data: (state) => Scaffold(
            appBar: AppBar(
              leading: BackButton(
                onPressed: () => viewModel.onBack(),
              ),
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.appBarTitle),
                  Text(state.appBarSubtitle),
                ],
              ),
            ),
            body: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: Colors.white,
                  child: Column(
                    children: state.videoPreviews
                        .map(
                          (item) => _PreviewItem(
                            onTap: () => viewModel.onSelectPreview(0),
                            viewState: item,
                          ),
                        )
                        .toList(),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: const Color(0xFFF7F8F9),
                    child: viewModel.controller != null
                        ? VideoPlayer(viewModel.controller!)
                        : const Text(
                            'Выберите клип для просмотра',
                            style: AppTextTheme.h1,
                          ),
                  ),
                ),
              ],
            ),
          ),
          empty: (_) => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
}

class _PreviewItem extends StatelessWidget {
  static const _previewSide = 96.0;

  final VideoPreviewViewState viewState;
  final VoidCallback onTap;

  const _PreviewItem({
    required this.viewState,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Card(
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
        ),
      );
}
