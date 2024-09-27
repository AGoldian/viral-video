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
  String get appBarTitle => throw _privateConstructorUsedError;
  String get appBarSubtitle => throw _privateConstructorUsedError;
  List<VideoPreviewViewState> get videoPreviews =>
      throw _privateConstructorUsedError;

  /// Create a copy of GalleryViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GalleryViewStateCopyWith<GalleryViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryViewStateCopyWith<$Res> {
  factory $GalleryViewStateCopyWith(
          GalleryViewState value, $Res Function(GalleryViewState) then) =
      _$GalleryViewStateCopyWithImpl<$Res, GalleryViewState>;
  @useResult
  $Res call(
      {String appBarTitle,
      String appBarSubtitle,
      List<VideoPreviewViewState> videoPreviews});
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
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appBarTitle = null,
    Object? appBarSubtitle = null,
    Object? videoPreviews = null,
  }) {
    return _then(_value.copyWith(
      appBarTitle: null == appBarTitle
          ? _value.appBarTitle
          : appBarTitle // ignore: cast_nullable_to_non_nullable
              as String,
      appBarSubtitle: null == appBarSubtitle
          ? _value.appBarSubtitle
          : appBarSubtitle // ignore: cast_nullable_to_non_nullable
              as String,
      videoPreviews: null == videoPreviews
          ? _value.videoPreviews
          : videoPreviews // ignore: cast_nullable_to_non_nullable
              as List<VideoPreviewViewState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GalleryViewStateImplCopyWith<$Res>
    implements $GalleryViewStateCopyWith<$Res> {
  factory _$$GalleryViewStateImplCopyWith(_$GalleryViewStateImpl value,
          $Res Function(_$GalleryViewStateImpl) then) =
      __$$GalleryViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String appBarTitle,
      String appBarSubtitle,
      List<VideoPreviewViewState> videoPreviews});
}

/// @nodoc
class __$$GalleryViewStateImplCopyWithImpl<$Res>
    extends _$GalleryViewStateCopyWithImpl<$Res, _$GalleryViewStateImpl>
    implements _$$GalleryViewStateImplCopyWith<$Res> {
  __$$GalleryViewStateImplCopyWithImpl(_$GalleryViewStateImpl _value,
      $Res Function(_$GalleryViewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GalleryViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appBarTitle = null,
    Object? appBarSubtitle = null,
    Object? videoPreviews = null,
  }) {
    return _then(_$GalleryViewStateImpl(
      appBarTitle: null == appBarTitle
          ? _value.appBarTitle
          : appBarTitle // ignore: cast_nullable_to_non_nullable
              as String,
      appBarSubtitle: null == appBarSubtitle
          ? _value.appBarSubtitle
          : appBarSubtitle // ignore: cast_nullable_to_non_nullable
              as String,
      videoPreviews: null == videoPreviews
          ? _value._videoPreviews
          : videoPreviews // ignore: cast_nullable_to_non_nullable
              as List<VideoPreviewViewState>,
    ));
  }
}

/// @nodoc

class _$GalleryViewStateImpl implements _GalleryViewState {
  const _$GalleryViewStateImpl(
      {required this.appBarTitle,
      required this.appBarSubtitle,
      required final List<VideoPreviewViewState> videoPreviews})
      : _videoPreviews = videoPreviews;

  @override
  final String appBarTitle;
  @override
  final String appBarSubtitle;
  final List<VideoPreviewViewState> _videoPreviews;
  @override
  List<VideoPreviewViewState> get videoPreviews {
    if (_videoPreviews is EqualUnmodifiableListView) return _videoPreviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoPreviews);
  }

  @override
  String toString() {
    return 'GalleryViewState(appBarTitle: $appBarTitle, appBarSubtitle: $appBarSubtitle, videoPreviews: $videoPreviews)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryViewStateImpl &&
            (identical(other.appBarTitle, appBarTitle) ||
                other.appBarTitle == appBarTitle) &&
            (identical(other.appBarSubtitle, appBarSubtitle) ||
                other.appBarSubtitle == appBarSubtitle) &&
            const DeepCollectionEquality()
                .equals(other._videoPreviews, _videoPreviews));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appBarTitle, appBarSubtitle,
      const DeepCollectionEquality().hash(_videoPreviews));

  /// Create a copy of GalleryViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GalleryViewStateImplCopyWith<_$GalleryViewStateImpl> get copyWith =>
      __$$GalleryViewStateImplCopyWithImpl<_$GalleryViewStateImpl>(
          this, _$identity);
}

abstract class _GalleryViewState implements GalleryViewState {
  const factory _GalleryViewState(
          {required final String appBarTitle,
          required final String appBarSubtitle,
          required final List<VideoPreviewViewState> videoPreviews}) =
      _$GalleryViewStateImpl;

  @override
  String get appBarTitle;
  @override
  String get appBarSubtitle;
  @override
  List<VideoPreviewViewState> get videoPreviews;

  /// Create a copy of GalleryViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GalleryViewStateImplCopyWith<_$GalleryViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
