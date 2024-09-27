// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'process_file_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProcessFileRequest {
  String get path => throw _privateConstructorUsedError;

  /// Create a copy of ProcessFileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProcessFileRequestCopyWith<ProcessFileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessFileRequestCopyWith<$Res> {
  factory $ProcessFileRequestCopyWith(
          ProcessFileRequest value, $Res Function(ProcessFileRequest) then) =
      _$ProcessFileRequestCopyWithImpl<$Res, ProcessFileRequest>;
  @useResult
  $Res call({String path});
}

/// @nodoc
class _$ProcessFileRequestCopyWithImpl<$Res, $Val extends ProcessFileRequest>
    implements $ProcessFileRequestCopyWith<$Res> {
  _$ProcessFileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProcessFileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessFileRequestImplCopyWith<$Res>
    implements $ProcessFileRequestCopyWith<$Res> {
  factory _$$ProcessFileRequestImplCopyWith(_$ProcessFileRequestImpl value,
          $Res Function(_$ProcessFileRequestImpl) then) =
      __$$ProcessFileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$ProcessFileRequestImplCopyWithImpl<$Res>
    extends _$ProcessFileRequestCopyWithImpl<$Res, _$ProcessFileRequestImpl>
    implements _$$ProcessFileRequestImplCopyWith<$Res> {
  __$$ProcessFileRequestImplCopyWithImpl(_$ProcessFileRequestImpl _value,
      $Res Function(_$ProcessFileRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcessFileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$ProcessFileRequestImpl(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProcessFileRequestImpl implements _ProcessFileRequest {
  const _$ProcessFileRequestImpl({required this.path});

  @override
  final String path;

  @override
  String toString() {
    return 'ProcessFileRequest(path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessFileRequestImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  /// Create a copy of ProcessFileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessFileRequestImplCopyWith<_$ProcessFileRequestImpl> get copyWith =>
      __$$ProcessFileRequestImplCopyWithImpl<_$ProcessFileRequestImpl>(
          this, _$identity);
}

abstract class _ProcessFileRequest implements ProcessFileRequest {
  const factory _ProcessFileRequest({required final String path}) =
      _$ProcessFileRequestImpl;

  @override
  String get path;

  /// Create a copy of ProcessFileRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProcessFileRequestImplCopyWith<_$ProcessFileRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
