import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../theme/app_text_theme.dart';

class PreviewWidget extends StatefulWidget {
  final VideoPlayerController controller;
  final String comment;

  const PreviewWidget({
    required this.controller,
    required this.comment,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _PreviewWidgetState();
}

class _PreviewWidgetState extends State<PreviewWidget> {
  @override
  void didUpdateWidget(covariant PreviewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.controller.initialize().then(
      (_) {
        setState(() {});
      },
    );
  }

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
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: widget.controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: widget.controller.value.aspectRatio,
                        child: VideoPlayer(widget.controller),
                      )
                    : Container(),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Почему это видео Вам понравится:',
                    style: AppTextTheme.body2,
                  ),
                  Text(
                    widget.comment,
                    style: AppTextTheme.caption1,
                  ),
                ],
              ),
            ),
          ],
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
