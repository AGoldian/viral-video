import 'package:flutter/material.dart';
import 'package:viral_video_client/src/common/state_notifier_widget.dart';
import 'package:viral_video_client/src/presentation/theme/app_text_theme.dart';
import 'package:viral_video_client/src/presentation/theme/color_theme.dart';
import 'package:viral_video_client/src/presentation/video_preview/preview_item_widget.dart';
import 'package:viral_video_client/src/presentation/video_preview/preview_widget.dart';
import 'package:viral_video_client/src/presentation/video_preview/video_preview_gallery_view_model.dart';
import 'package:collection/collection.dart';

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
          print('Rebuild stateNotifierWidget: $state');

          return state.map(
            data: (state) => Scaffold(
              appBar: AppBar(
                leading: BackButton(
                  onPressed: () => widget.viewModel.onBack(),
                ),
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        ...state.videoPreviews.mapIndexed(
                          (index, item) => InkWell(
                            onTap: () =>
                                widget.viewModel.onSelectPreview(index),
                            child: PreviewItemWidget(
                              viewState: item,
                            ),
                          ),
                        ),
                        if (state.isLoading)
                          const SizedBox(
                            width: _previewSide * 4,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  width: 32,
                                  height: 32,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Обработка видео еще\u{00A0}не\u{00A0}заверешена',
                                  style: AppTextTheme.body2,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'новые клипы появятся тут сразу\u{00A0}после\u{00A0}обработки',
                                  style: AppTextTheme.caption1,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: const Color(0xFFF7F8F9),
                      child: controller != null
                          ? PreviewWidget(
                              controller: controller,
                              comment: state
                                  .videoPreviews[state.previewIndex!].comment,
                            )
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
