import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef DataBuilder<T> = Widget Function(BuildContext, T state);
typedef LoadingBuilder = Widget Function(BuildContext);
typedef ErrorBuilder = Widget Function(BuildContext);

class StateNotifierWidget<T> extends StatelessWidget {
  final StateNotifier<T> notifier;
  final DataBuilder<T> dataBuilder;
  final LoadingBuilder? loadingBuilder;
  final ErrorBuilder? errorBuilder;

  const StateNotifierWidget({
    required this.notifier,
    required this.dataBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) => StreamBuilder(
        initialData: notifier.state,
        stream: notifier.stream.distinct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return dataBuilder(context, snapshot.requireData);
          }

          if (snapshot.hasError) {
            if (errorBuilder != null) {
              return errorBuilder!(context);
            } else {
              return const SizedBox.shrink();
            }
          }

          if (loadingBuilder != null) {
            return loadingBuilder!(context);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
}
