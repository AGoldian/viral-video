import 'package:flutter/cupertino.dart';
import 'package:viral_video_client/src/presentation/theme/color_theme.dart';

abstract class AppTextTheme {
  static const h1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const body2 = TextStyle(
    fontSize: 18,
  );

  static const caption1 = TextStyle(
    fontSize: 16,
    color: ColorTheme.textMinor,
  );
}
