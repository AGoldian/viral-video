import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class StateNotifierBase<T> extends StateNotifier<T> {
  StateNotifierBase(super.value);

  void refresh();
}

abstract class AsyncStateNotifier<T> extends StateNotifierBase<AsyncValue<T>> {
  AsyncStateNotifier() : super(const AsyncLoading()) {
    _init();
  }

  Future<void> _init() async {
    try {
      final value = await source();
      state = AsyncData(value);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  Future<T> source();

  @override
  void refresh() {
    state = const AsyncLoading();
    source().then((value) => state = AsyncData(value));
  }

  T? get dataOrNull => state.when(
        data: (data) => data,
        error: (_, __) => null,
        loading: () => null,
      );

  void updateData(T value) => state = AsyncData(value);
}

abstract class DelegateAsyncStateNotifier<M, V>
    extends StateNotifierBase<AsyncValue<V>> {
  final AsyncStateNotifier<M> _notifier;

  DelegateAsyncStateNotifier(this._notifier) : super(AsyncLoading<V>()) {
    _notifier.stream.distinct().listen(
      (m) {
        if (m is AsyncData<M>) {
          return updateData(select(m.value));
        }
      },
    );

    final notifierData = _notifier.dataOrNull;
    final notifierState = _notifier.state;

    if (notifierData != null) {
      updateData(select(notifierData));
    } else if (notifierState.hasError) {
      state = AsyncError(
        notifierState.error ?? Object(),
        notifierState.stackTrace ?? StackTrace.current,
      );
    }
  }

  void updateData(V value) => state = AsyncData(value);

  V select(M state);

  V? get dataOrNull => state.when(
        data: (data) => data,
        error: (_, __) => null,
        loading: () => null,
      );

  @override
  void refresh() {
    state = const AsyncLoading();
    _notifier.refresh();
  }
}
