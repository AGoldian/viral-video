import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:viral_video_client/src/presentation/video_preview/view_state/video_preview_view_state.dart';

const _previewSide = 96.0;

class PreviewItemWidget extends StatefulWidget {
  final VideoPreviewViewState viewState;

  const PreviewItemWidget({
    required this.viewState,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _PreviewItemWidget();
}

class _PreviewItemWidget extends State<PreviewItemWidget> {
  @override
  void didUpdateWidget(covariant PreviewItemWidget oldWidget) {
    widget.viewState.previewController.initialize().then(
      (_) {
        setState(() {});
      },
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    widget.viewState.previewController.initialize().then(
      (_) {
        setState(() {});
      },
    );
  }

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
                child: widget.viewState.previewController.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: widget
                            .viewState.previewController.value.aspectRatio,
                        child: VideoPlayer(widget.viewState.previewController),
                      )
                    : Container(),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.viewState.title),
                    Text(widget.viewState.duration.asPrettyString)
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  @override
  void dispose() {
    widget.viewState.previewController.dispose();
    super.dispose();
  }
}
