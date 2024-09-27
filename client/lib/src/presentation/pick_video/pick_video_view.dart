import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
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
              ),
              const Text(
                'в виральные клипы',
                style: AppTextTheme.body2,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Уникальное решение основанное на отечественных технологиях\n' // мб добавить \u{00A0} в нужных местах
                'позволит вырезать захватывающие клипы из самых длинных видео\n'
                'и наложить текст, для последующей публикации',
                textAlign: TextAlign.center,
              ),
              const Expanded(child: SizedBox()),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 500,
                    ),
                    child: _InputWidget(
                      onSubmit: viewModel.onSubmit,
                    ),
                  ),
                  const Text(
                    'или',
                  ),
                  PrettyButton.secondary(
                    text: 'Загрузить видео',
                    onTap: () => viewModel.onPickFile(),
                  ),
                ],
              ),
              const Expanded(
                flex: 3,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      );
}

class _InputWidget extends StatefulWidget {
  final void Function(String) onSubmit;

  const _InputWidget({required this.onSubmit});

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
          hintText: 'Вставьте сюда ссылку на RuTube',
          suffixIcon: PrettyButton.action(
            text: 'Создать клипы',
            enabled: textEditingController.text.isNotEmpty,
            padding: const EdgeInsets.all(8),
            onTap: () => widget.onSubmit(
              textEditingController.text,
            ),
          ),
        ),
      );
}
