part of 'onboarding_session_cubit.dart';

@freezed
class OnboardingSessionState with _$OnboardingSessionState {
  const factory OnboardingSessionState({
    @Default(OnboardingSessionStatus.initial) OnboardingSessionStatus status,
    @Default(null) String? errorMessage,
  }) = _OnboardingSessionState;
}

enum OnboardingSessionStatus {
  initial,
  loading,
  success,
  failure,
}
