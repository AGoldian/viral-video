import 'dart:math';

import 'package:flutter/material.dart';
import 'package:viral_video_client/src/common/state_notifier_widget.dart';
import 'package:viral_video_client/src/presentation/pick_video/pick_video_view_model.dart';

import '../common/pretty_button.dart';
import '../theme/app_text_theme.dart';
import '../theme/color_theme.dart';

class PickVideoView extends StatelessWidget {
  final PickVideoViewModel viewModel;

  const PickVideoView({
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) => StateNotifierWidget(
        notifier: viewModel,
        dataBuilder: (context, state) => Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: min(MediaQuery.of(context).size.width * 0.05, 64),
            ),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(child: SizedBox()),
                const Text(
                  'Крутейший конвертер вашего видео',
                  style: AppTextTheme.h1,
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'в виральные клипы',
                  style: AppTextTheme.body2,
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Уникальное решение основанное на\u{00A0}отечественных\u{00A0}технологиях\n' // мб добавить \u{00A0} в нужных местах
                  'позволит вырезать захватывающие клипы из\u{00A0}самых\u{00A0}длинных\u{00A0}видео\n'
                  'и наложить текст, для последующей публикации',
                  textAlign: TextAlign.center,
                  style: AppTextTheme.caption1,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: TextField(
                    enabled: !state.isLoading,
                    maxLines: 3,
                    style: AppTextTheme.caption1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ColorTheme.controlMain,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ColorTheme.controlMain,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText:
                          '[Опционально] введите промпт для генерации клипов с определенными параметрами',
                    ),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: _InputWidget(
                        onSubmit: viewModel.onSubmit,
                        enabled: !state.isLoading,
                      ),
                    ),
                    SizedBox(
                      width:
                          min(MediaQuery.of(context).size.width * 0.0128, 16),
                    ),
                    const Text(
                      'или',
                    ),
                    SizedBox(
                      width:
                          min(MediaQuery.of(context).size.width * 0.0128, 16),
                    ),
                    PrettyButton.secondary(
                      text: 'Загрузить видео',
                      enabled: !state.isLoading,
                      onTap: () => viewModel.onPickFile(),
                    ),
                  ],
                ),
                if (state.isLoading)
                  Container(
                    margin: const EdgeInsets.only(top: 32),
                    height: 64,
                    width: 64,
                    child: const CircularProgressIndicator(),
                  ),
                if (state.processDescription != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Text(
                      state.processDescription!,
                      style: AppTextTheme.body2,
                    ),
                  ),
                const Expanded(
                  flex: 3,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ),
      );
}

class _InputWidget extends StatefulWidget {
  final void Function(String) onSubmit;
  final bool enabled;

  const _InputWidget({
    required this.onSubmit,
    required this.enabled,
  });

  @override
  createState() => _InputWidgetState();
}

class _InputWidgetState extends State<_InputWidget> {
  final textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextField(
        controller: textEditingController,
        enabled: widget.enabled,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorTheme.controlMain,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorTheme.controlMain,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          prefixIcon: const Icon(Icons.ondemand_video),
          hintText: 'Вставьте ссылку на RuTube',
          suffixIcon: PrettyButton.action(
            text: 'Создать клипы',
            enabled: textEditingController.text.isNotEmpty && widget.enabled,
            padding: const EdgeInsets.all(8),
            onTap: () => widget.onSubmit(
              textEditingController.text,
            ),
          ),
        ),
      );
}
