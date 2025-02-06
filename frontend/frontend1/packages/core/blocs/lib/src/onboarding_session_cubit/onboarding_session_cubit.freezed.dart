// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_session_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OnboardingSessionState {
  OnboardingSessionStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of OnboardingSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnboardingSessionStateCopyWith<OnboardingSessionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingSessionStateCopyWith<$Res> {
  factory $OnboardingSessionStateCopyWith(OnboardingSessionState value,
          $Res Function(OnboardingSessionState) then) =
      _$OnboardingSessionStateCopyWithImpl<$Res, OnboardingSessionState>;
  @useResult
  $Res call({OnboardingSessionStatus status, String? errorMessage});
}

/// @nodoc
class _$OnboardingSessionStateCopyWithImpl<$Res,
        $Val extends OnboardingSessionState>
    implements $OnboardingSessionStateCopyWith<$Res> {
  _$OnboardingSessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnboardingSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OnboardingSessionStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnboardingSessionStateImplCopyWith<$Res>
    implements $OnboardingSessionStateCopyWith<$Res> {
  factory _$$OnboardingSessionStateImplCopyWith(
          _$OnboardingSessionStateImpl value,
          $Res Function(_$OnboardingSessionStateImpl) then) =
      __$$OnboardingSessionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OnboardingSessionStatus status, String? errorMessage});
}

/// @nodoc
class __$$OnboardingSessionStateImplCopyWithImpl<$Res>
    extends _$OnboardingSessionStateCopyWithImpl<$Res,
        _$OnboardingSessionStateImpl>
    implements _$$OnboardingSessionStateImplCopyWith<$Res> {
  __$$OnboardingSessionStateImplCopyWithImpl(
      _$OnboardingSessionStateImpl _value,
      $Res Function(_$OnboardingSessionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$OnboardingSessionStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OnboardingSessionStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OnboardingSessionStateImpl implements _OnboardingSessionState {
  const _$OnboardingSessionStateImpl(
      {this.status = OnboardingSessionStatus.initial,
      this.errorMessage = null});

  @override
  @JsonKey()
  final OnboardingSessionStatus status;
  @override
  @JsonKey()
  final String? errorMessage;

  @override
  String toString() {
    return 'OnboardingSessionState(status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingSessionStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage);

  /// Create a copy of OnboardingSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingSessionStateImplCopyWith<_$OnboardingSessionStateImpl>
      get copyWith => __$$OnboardingSessionStateImplCopyWithImpl<
          _$OnboardingSessionStateImpl>(this, _$identity);
}

abstract class _OnboardingSessionState implements OnboardingSessionState {
  const factory _OnboardingSessionState(
      {final OnboardingSessionStatus status,
      final String? errorMessage}) = _$OnboardingSessionStateImpl;

  @override
  OnboardingSessionStatus get status;
  @override
  String? get errorMessage;

  /// Create a copy of OnboardingSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardingSessionStateImplCopyWith<_$OnboardingSessionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
