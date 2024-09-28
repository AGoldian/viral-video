// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'process_file_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProcessFileResponse _$ProcessFileResponseFromJson(Map<String, dynamic> json) {
  return _ProcessFileResponse.fromJson(json);
}

/// @nodoc
mixin _$ProcessFileResponse {
  String get videoName => throw _privateConstructorUsedError;
  List<VideoClip> get clips => throw _privateConstructorUsedError;

  /// Serializes this ProcessFileResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProcessFileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProcessFileResponseCopyWith<ProcessFileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessFileResponseCopyWith<$Res> {
  factory $ProcessFileResponseCopyWith(
          ProcessFileResponse value, $Res Function(ProcessFileResponse) then) =
      _$ProcessFileResponseCopyWithImpl<$Res, ProcessFileResponse>;
  @useResult
  $Res call({String videoName, List<VideoClip> clips});
}

/// @nodoc
class _$ProcessFileResponseCopyWithImpl<$Res, $Val extends ProcessFileResponse>
    implements $ProcessFileResponseCopyWith<$Res> {
  _$ProcessFileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProcessFileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoName = null,
    Object? clips = null,
  }) {
    return _then(_value.copyWith(
      videoName: null == videoName
          ? _value.videoName
          : videoName // ignore: cast_nullable_to_non_nullable
              as String,
      clips: null == clips
          ? _value.clips
          : clips // ignore: cast_nullable_to_non_nullable
              as List<VideoClip>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessFileResponseImplCopyWith<$Res>
    implements $ProcessFileResponseCopyWith<$Res> {
  factory _$$ProcessFileResponseImplCopyWith(_$ProcessFileResponseImpl value,
          $Res Function(_$ProcessFileResponseImpl) then) =
      __$$ProcessFileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String videoName, List<VideoClip> clips});
}

/// @nodoc
class __$$ProcessFileResponseImplCopyWithImpl<$Res>
    extends _$ProcessFileResponseCopyWithImpl<$Res, _$ProcessFileResponseImpl>
    implements _$$ProcessFileResponseImplCopyWith<$Res> {
  __$$ProcessFileResponseImplCopyWithImpl(_$ProcessFileResponseImpl _value,
      $Res Function(_$ProcessFileResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcessFileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoName = null,
    Object? clips = null,
  }) {
    return _then(_$ProcessFileResponseImpl(
      videoName: null == videoName
          ? _value.videoName
          : videoName // ignore: cast_nullable_to_non_nullable
              as String,
      clips: null == clips
          ? _value._clips
          : clips // ignore: cast_nullable_to_non_nullable
              as List<VideoClip>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessFileResponseImpl implements _ProcessFileResponse {
  const _$ProcessFileResponseImpl(
      {required this.videoName, required final List<VideoClip> clips})
      : _clips = clips;

  factory _$ProcessFileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProcessFileResponseImplFromJson(json);

  @override
  final String videoName;
  final List<VideoClip> _clips;
  @override
  List<VideoClip> get clips {
    if (_clips is EqualUnmodifiableListView) return _clips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clips);
  }

  @override
  String toString() {
    return 'ProcessFileResponse(videoName: $videoName, clips: $clips)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessFileResponseImpl &&
            (identical(other.videoName, videoName) ||
                other.videoName == videoName) &&
            const DeepCollectionEquality().equals(other._clips, _clips));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, videoName, const DeepCollectionEquality().hash(_clips));

  /// Create a copy of ProcessFileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessFileResponseImplCopyWith<_$ProcessFileResponseImpl> get copyWith =>
      __$$ProcessFileResponseImplCopyWithImpl<_$ProcessFileResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessFileResponseImplToJson(
      this,
    );
  }
}

abstract class _ProcessFileResponse implements ProcessFileResponse {
  const factory _ProcessFileResponse(
      {required final String videoName,
      required final List<VideoClip> clips}) = _$ProcessFileResponseImpl;

  factory _ProcessFileResponse.fromJson(Map<String, dynamic> json) =
      _$ProcessFileResponseImpl.fromJson;

  @override
  String get videoName;
  @override
  List<VideoClip> get clips;

  /// Create a copy of ProcessFileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProcessFileResponseImplCopyWith<_$ProcessFileResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
