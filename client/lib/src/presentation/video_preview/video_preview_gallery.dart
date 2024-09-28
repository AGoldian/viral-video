import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:viral_video_client/src/common/state_notifier_widget.dart';
import 'package:viral_video_client/src/presentation/theme/app_text_theme.dart';
import 'package:viral_video_client/src/presentation/theme/color_theme.dart';
import 'package:viral_video_client/src/presentation/video_preview/video_preview_gallery_view_model.dart';
import 'package:viral_video_client/src/presentation/video_preview/view_state/video_preview_view_state.dart';

const _previewSide = 96.0;

class VideoPreviewGallery extends StatefulWidget {
  final VideoPreviewGalleryViewModel viewModel;

  const VideoPreviewGallery({
    required this.viewModel,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _VideoPreviewGallery();
}

class _VideoPreviewGallery extends State<VideoPreviewGallery> {
  @override
  Widget build(BuildContext context) => StateNotifierWidget(
        notifier: widget.viewModel,
        dataBuilder: (context, state) {
          final controller = widget.viewModel.controller;

          return state.map(
            data: (state) => Scaffold(
              appBar: AppBar(
                leading: BackButton(
                  onPressed: () => widget.viewModel.onBack(),
                ),
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      state.appBarTitle,
                      style: AppTextTheme.h1,
                    ),
                    Text(
                      'уникальный идентификатор вашего клипа',
                      style: AppTextTheme.body2.copyWith(
                        color: ColorTheme.textMinor,
                      ),
                    ),
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
                      children: [
                        ...state.videoPreviews.map(
                          (item) => _PreviewItem(
                            onTap: () => widget.viewModel.onSelectPreview(0),
                            viewState: item,
                          ),
                        ),
                        if (state.isLoading)
                          const SizedBox(
                            height: _previewSide,
                            width: _previewSide * 4,
                            child: SizedBox(
                              width: 32,
                              height: 32,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Обработка видео еще не заверешена',
                                    style: AppTextTheme.body2,
                                  ),
                                  Text(
                                    'новые клипы появятся тут сразу после обработки',
                                    style: AppTextTheme.caption1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: const Color(0xFFF7F8F9),
                      child: controller != null
                          ? _PreviewWidget(controller: controller)
                          : const Center(
                              child: Text(
                                'Выберите клип для просмотра',
                                style: AppTextTheme.h1,
                              ),
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
          );
        },
      );
}

class _PreviewItem extends StatelessWidget {
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

class _PreviewWidget extends StatefulWidget {
  final VideoPlayerController controller;

  const _PreviewWidget({required this.controller});

  @override
  State<StatefulWidget> createState() => _PreviewWidgetState();
}

class _PreviewWidgetState extends State<_PreviewWidget> {
  @override
  void initState() {
    super.initState();
    widget.controller.initialize().then(
      (_) {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: widget.controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: widget.controller.value.aspectRatio,
                  child: VideoPlayer(widget.controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              widget.controller.value.isPlaying
                  ? widget.controller.pause()
                  : widget.controller.play();
            });
          },
          child: Icon(
            widget.controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      );

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
