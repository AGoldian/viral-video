// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GalleryViewState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String appBarTitle,
            List<VideoPreviewViewState> videoPreviews,
            bool isLoading,
            int? previewIndex)
        data,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String appBarTitle,
            List<VideoPreviewViewState> videoPreviews,
            bool isLoading,
            int? previewIndex)?
        data,
    TResult? Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String appBarTitle,
            List<VideoPreviewViewState> videoPreviews,
            bool isLoading,
            int? previewIndex)?
        data,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GalleryDataViewState value) data,
    required TResult Function(GalleryEmptyViewState value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GalleryDataViewState value)? data,
    TResult? Function(GalleryEmptyViewState value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GalleryDataViewState value)? data,
    TResult Function(GalleryEmptyViewState value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryViewStateCopyWith<$Res> {
  factory $GalleryViewStateCopyWith(
          GalleryViewState value, $Res Function(GalleryViewState) then) =
      _$GalleryViewStateCopyWithImpl<$Res, GalleryViewState>;
}

/// @nodoc
class _$GalleryViewStateCopyWithImpl<$Res, $Val extends GalleryViewState>
    implements $GalleryViewStateCopyWith<$Res> {
  _$GalleryViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GalleryViewState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GalleryDataViewStateImplCopyWith<$Res> {
  factory _$$GalleryDataViewStateImplCopyWith(_$GalleryDataViewStateImpl value,
          $Res Function(_$GalleryDataViewStateImpl) then) =
      __$$GalleryDataViewStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String appBarTitle,
      List<VideoPreviewViewState> videoPreviews,
      bool isLoading,
      int? previewIndex});
}

/// @nodoc
class __$$GalleryDataViewStateImplCopyWithImpl<$Res>
    extends _$GalleryViewStateCopyWithImpl<$Res, _$GalleryDataViewStateImpl>
    implements _$$GalleryDataViewStateImplCopyWith<$Res> {
  __$$GalleryDataViewStateImplCopyWithImpl(_$GalleryDataViewStateImpl _value,
      $Res Function(_$GalleryDataViewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GalleryViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appBarTitle = null,
    Object? videoPreviews = null,
    Object? isLoading = null,
    Object? previewIndex = freezed,
  }) {
    return _then(_$GalleryDataViewStateImpl(
      appBarTitle: null == appBarTitle
          ? _value.appBarTitle
          : appBarTitle // ignore: cast_nullable_to_non_nullable
              as String,
      videoPreviews: null == videoPreviews
          ? _value._videoPreviews
          : videoPreviews // ignore: cast_nullable_to_non_nullable
              as List<VideoPreviewViewState>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      previewIndex: freezed == previewIndex
          ? _value.previewIndex
          : previewIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GalleryDataViewStateImpl implements GalleryDataViewState {
  const _$GalleryDataViewStateImpl(
      {required this.appBarTitle,
      required final List<VideoPreviewViewState> videoPreviews,
      required this.isLoading,
      this.previewIndex})
      : _videoPreviews = videoPreviews;

  @override
  final String appBarTitle;
  final List<VideoPreviewViewState> _videoPreviews;
  @override
  List<VideoPreviewViewState> get videoPreviews {
    if (_videoPreviews is EqualUnmodifiableListView) return _videoPreviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoPreviews);
  }

  @override
  final bool isLoading;
  @override
  final int? previewIndex;

  @override
  String toString() {
    return 'GalleryViewState.data(appBarTitle: $appBarTitle, videoPreviews: $videoPreviews, isLoading: $isLoading, previewIndex: $previewIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryDataViewStateImpl &&
            (identical(other.appBarTitle, appBarTitle) ||
                other.appBarTitle == appBarTitle) &&
            const DeepCollectionEquality()
                .equals(other._videoPreviews, _videoPreviews) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.previewIndex, previewIndex) ||
                other.previewIndex == previewIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      appBarTitle,
      const DeepCollectionEquality().hash(_videoPreviews),
      isLoading,
      previewIndex);

  /// Create a copy of GalleryViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GalleryDataViewStateImplCopyWith<_$GalleryDataViewStateImpl>
      get copyWith =>
          __$$GalleryDataViewStateImplCopyWithImpl<_$GalleryDataViewStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String appBarTitle,
            List<VideoPreviewViewState> videoPreviews,
            bool isLoading,
            int? previewIndex)
        data,
    required TResult Function() empty,
  }) {
    return data(appBarTitle, videoPreviews, isLoading, previewIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String appBarTitle,
            List<VideoPreviewViewState> videoPreviews,
            bool isLoading,
            int? previewIndex)?
        data,
    TResult? Function()? empty,
  }) {
    return data?.call(appBarTitle, videoPreviews, isLoading, previewIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String appBarTitle,
            List<VideoPreviewViewState> videoPreviews,
            bool isLoading,
            int? previewIndex)?
        data,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(appBarTitle, videoPreviews, isLoading, previewIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GalleryDataViewState value) data,
    required TResult Function(GalleryEmptyViewState value) empty,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GalleryDataViewState value)? data,
    TResult? Function(GalleryEmptyViewState value)? empty,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GalleryDataViewState value)? data,
    TResult Function(GalleryEmptyViewState value)? empty,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class GalleryDataViewState implements GalleryViewState {
  const factory GalleryDataViewState(
      {required final String appBarTitle,
      required final List<VideoPreviewViewState> videoPreviews,
      required final bool isLoading,
      final int? previewIndex}) = _$GalleryDataViewStateImpl;

  String get appBarTitle;
  List<VideoPreviewViewState> get videoPreviews;
  bool get isLoading;
  int? get previewIndex;

  /// Create a copy of GalleryViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GalleryDataViewStateImplCopyWith<_$GalleryDataViewStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GalleryEmptyViewStateImplCopyWith<$Res> {
  factory _$$GalleryEmptyViewStateImplCopyWith(
          _$GalleryEmptyViewStateImpl value,
          $Res Function(_$GalleryEmptyViewStateImpl) then) =
      __$$GalleryEmptyViewStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GalleryEmptyViewStateImplCopyWithImpl<$Res>
    extends _$GalleryViewStateCopyWithImpl<$Res, _$GalleryEmptyViewStateImpl>
    implements _$$GalleryEmptyViewStateImplCopyWith<$Res> {
  __$$GalleryEmptyViewStateImplCopyWithImpl(_$GalleryEmptyViewStateImpl _value,
      $Res Function(_$GalleryEmptyViewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GalleryViewState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GalleryEmptyViewStateImpl implements GalleryEmptyViewState {
  const _$GalleryEmptyViewStateImpl();

  @override
  String toString() {
    return 'GalleryViewState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryEmptyViewStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String appBarTitle,
            List<VideoPreviewViewState> videoPreviews,
            bool isLoading,
            int? previewIndex)
        data,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String appBarTitle,
            List<VideoPreviewViewState> videoPreviews,
            bool isLoading,
            int? previewIndex)?
        data,
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String appBarTitle,
            List<VideoPreviewViewState> videoPreviews,
            bool isLoading,
            int? previewIndex)?
        data,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GalleryDataViewState value) data,
    required TResult Function(GalleryEmptyViewState value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GalleryDataViewState value)? data,
    TResult? Function(GalleryEmptyViewState value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GalleryDataViewState value)? data,
    TResult Function(GalleryEmptyViewState value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class GalleryEmptyViewState implements GalleryViewState {
  const factory GalleryEmptyViewState() = _$GalleryEmptyViewStateImpl;
}
