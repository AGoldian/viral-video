// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_preview_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VideoPreviewViewState {
  String get title => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;

  /// Create a copy of VideoPreviewViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoPreviewViewStateCopyWith<VideoPreviewViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoPreviewViewStateCopyWith<$Res> {
  factory $VideoPreviewViewStateCopyWith(VideoPreviewViewState value,
          $Res Function(VideoPreviewViewState) then) =
      _$VideoPreviewViewStateCopyWithImpl<$Res, VideoPreviewViewState>;
  @useResult
  $Res call({String title, Duration duration});
}

/// @nodoc
class _$VideoPreviewViewStateCopyWithImpl<$Res,
        $Val extends VideoPreviewViewState>
    implements $VideoPreviewViewStateCopyWith<$Res> {
  _$VideoPreviewViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoPreviewViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoPreviewViewStateImplCopyWith<$Res>
    implements $VideoPreviewViewStateCopyWith<$Res> {
  factory _$$VideoPreviewViewStateImplCopyWith(
          _$VideoPreviewViewStateImpl value,
          $Res Function(_$VideoPreviewViewStateImpl) then) =
      __$$VideoPreviewViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, Duration duration});
}

/// @nodoc
class __$$VideoPreviewViewStateImplCopyWithImpl<$Res>
    extends _$VideoPreviewViewStateCopyWithImpl<$Res,
        _$VideoPreviewViewStateImpl>
    implements _$$VideoPreviewViewStateImplCopyWith<$Res> {
  __$$VideoPreviewViewStateImplCopyWithImpl(_$VideoPreviewViewStateImpl _value,
      $Res Function(_$VideoPreviewViewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoPreviewViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? duration = null,
  }) {
    return _then(_$VideoPreviewViewStateImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$VideoPreviewViewStateImpl implements _VideoPreviewViewState {
  const _$VideoPreviewViewStateImpl(
      {required this.title, required this.duration});

  @override
  final String title;
  @override
  final Duration duration;

  @override
  String toString() {
    return 'VideoPreviewViewState(title: $title, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoPreviewViewStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, duration);

  /// Create a copy of VideoPreviewViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoPreviewViewStateImplCopyWith<_$VideoPreviewViewStateImpl>
      get copyWith => __$$VideoPreviewViewStateImplCopyWithImpl<
          _$VideoPreviewViewStateImpl>(this, _$identity);
}

abstract class _VideoPreviewViewState implements VideoPreviewViewState {
  const factory _VideoPreviewViewState(
      {required final String title,
      required final Duration duration}) = _$VideoPreviewViewStateImpl;

  @override
  String get title;
  @override
  Duration get duration;

  /// Create a copy of VideoPreviewViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoPreviewViewStateImplCopyWith<_$VideoPreviewViewStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
