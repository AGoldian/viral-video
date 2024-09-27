import 'package:flutter/material.dart';
import 'package:viral_video_client/src/di/service_providers.dart';
import 'package:viral_video_client/src/di/view_model_providers.dart';
import 'package:viral_video_client/src/presentation/pick_video/pick_video_view.dart';
import 'package:viral_video_client/src/presentation/theme/color_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viral Video AI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorTheme.controlMain),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKeyProvider,
      home: PickVideoView(
        viewModel: pickVideoViewModelProvider,
      ),
    );
  }
}
