// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pick_video_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PickVideoViewState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get processDescription => throw _privateConstructorUsedError;

  /// Create a copy of PickVideoViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PickVideoViewStateCopyWith<PickVideoViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickVideoViewStateCopyWith<$Res> {
  factory $PickVideoViewStateCopyWith(
          PickVideoViewState value, $Res Function(PickVideoViewState) then) =
      _$PickVideoViewStateCopyWithImpl<$Res, PickVideoViewState>;
  @useResult
  $Res call({bool isLoading, String? processDescription});
}

/// @nodoc
class _$PickVideoViewStateCopyWithImpl<$Res, $Val extends PickVideoViewState>
    implements $PickVideoViewStateCopyWith<$Res> {
  _$PickVideoViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PickVideoViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? processDescription = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      processDescription: freezed == processDescription
          ? _value.processDescription
          : processDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PickVideoViewStateImplCopyWith<$Res>
    implements $PickVideoViewStateCopyWith<$Res> {
  factory _$$PickVideoViewStateImplCopyWith(_$PickVideoViewStateImpl value,
          $Res Function(_$PickVideoViewStateImpl) then) =
      __$$PickVideoViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? processDescription});
}

/// @nodoc
class __$$PickVideoViewStateImplCopyWithImpl<$Res>
    extends _$PickVideoViewStateCopyWithImpl<$Res, _$PickVideoViewStateImpl>
    implements _$$PickVideoViewStateImplCopyWith<$Res> {
  __$$PickVideoViewStateImplCopyWithImpl(_$PickVideoViewStateImpl _value,
      $Res Function(_$PickVideoViewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PickVideoViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? processDescription = freezed,
  }) {
    return _then(_$PickVideoViewStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      processDescription: freezed == processDescription
          ? _value.processDescription
          : processDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PickVideoViewStateImpl implements _PickVideoViewState {
  const _$PickVideoViewStateImpl(
      {required this.isLoading, this.processDescription});

  @override
  final bool isLoading;
  @override
  final String? processDescription;

  @override
  String toString() {
    return 'PickVideoViewState(isLoading: $isLoading, processDescription: $processDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickVideoViewStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.processDescription, processDescription) ||
                other.processDescription == processDescription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, processDescription);

  /// Create a copy of PickVideoViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PickVideoViewStateImplCopyWith<_$PickVideoViewStateImpl> get copyWith =>
      __$$PickVideoViewStateImplCopyWithImpl<_$PickVideoViewStateImpl>(
          this, _$identity);
}

abstract class _PickVideoViewState implements PickVideoViewState {
  const factory _PickVideoViewState(
      {required final bool isLoading,
      final String? processDescription}) = _$PickVideoViewStateImpl;

  @override
  bool get isLoading;
  @override
  String? get processDescription;

  /// Create a copy of PickVideoViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PickVideoViewStateImplCopyWith<_$PickVideoViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
