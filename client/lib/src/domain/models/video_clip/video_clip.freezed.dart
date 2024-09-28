// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_clip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VideoClip _$VideoClipFromJson(Map<String, dynamic> json) {
  return _VideoClip.fromJson(json);
}

/// @nodoc
mixin _$VideoClip {
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String get fileLink => throw _privateConstructorUsedError;

  /// Serializes this VideoClip to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VideoClip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoClipCopyWith<VideoClip> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoClipCopyWith<$Res> {
  factory $VideoClipCopyWith(VideoClip value, $Res Function(VideoClip) then) =
      _$VideoClipCopyWithImpl<$Res, VideoClip>;
  @useResult
  $Res call({String from, String to, String reason, String fileLink});
}

/// @nodoc
class _$VideoClipCopyWithImpl<$Res, $Val extends VideoClip>
    implements $VideoClipCopyWith<$Res> {
  _$VideoClipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoClip
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? reason = null,
    Object? fileLink = null,
  }) {
    return _then(_value.copyWith(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      fileLink: null == fileLink
          ? _value.fileLink
          : fileLink // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoClipImplCopyWith<$Res>
    implements $VideoClipCopyWith<$Res> {
  factory _$$VideoClipImplCopyWith(
          _$VideoClipImpl value, $Res Function(_$VideoClipImpl) then) =
      __$$VideoClipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String from, String to, String reason, String fileLink});
}

/// @nodoc
class __$$VideoClipImplCopyWithImpl<$Res>
    extends _$VideoClipCopyWithImpl<$Res, _$VideoClipImpl>
    implements _$$VideoClipImplCopyWith<$Res> {
  __$$VideoClipImplCopyWithImpl(
      _$VideoClipImpl _value, $Res Function(_$VideoClipImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoClip
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? reason = null,
    Object? fileLink = null,
  }) {
    return _then(_$VideoClipImpl(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      fileLink: null == fileLink
          ? _value.fileLink
          : fileLink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoClipImpl implements _VideoClip {
  const _$VideoClipImpl(
      {required this.from,
      required this.to,
      required this.reason,
      required this.fileLink});

  factory _$VideoClipImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoClipImplFromJson(json);

  @override
  final String from;
  @override
  final String to;
  @override
  final String reason;
  @override
  final String fileLink;

  @override
  String toString() {
    return 'VideoClip(from: $from, to: $to, reason: $reason, fileLink: $fileLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoClipImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.fileLink, fileLink) ||
                other.fileLink == fileLink));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, from, to, reason, fileLink);

  /// Create a copy of VideoClip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoClipImplCopyWith<_$VideoClipImpl> get copyWith =>
      __$$VideoClipImplCopyWithImpl<_$VideoClipImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoClipImplToJson(
      this,
    );
  }
}

abstract class _VideoClip implements VideoClip {
  const factory _VideoClip(
      {required final String from,
      required final String to,
      required final String reason,
      required final String fileLink}) = _$VideoClipImpl;

  factory _VideoClip.fromJson(Map<String, dynamic> json) =
      _$VideoClipImpl.fromJson;

  @override
  String get from;
  @override
  String get to;
  @override
  String get reason;
  @override
  String get fileLink;

  /// Create a copy of VideoClip
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoClipImplCopyWith<_$VideoClipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
