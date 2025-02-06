import 'package:blocs/blocs.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_session_state.dart';
part 'onboarding_session_cubit.freezed.dart';

class OnboardingSessionCubit extends Cubit<OnboardingSessionState> {
  OnboardingSessionCubit(this._userRepository)
      : super(const OnboardingSessionState());

  final UserRepository _userRepository;

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: OnboardingSessionStatus.loading));
    await Future.delayed(const Duration(seconds: 1));
    final result = await _userRepository.signUp(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
    result.fold(
      (token) => emit(state.copyWith(status: OnboardingSessionStatus.success)),
      (error) => emit(
        state.copyWith(
          status: OnboardingSessionStatus.failure,
          errorMessage: error,
        ),
      ),
    );
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: OnboardingSessionStatus.loading));
    await Future.delayed(const Duration(seconds: 1));
    final result = await _userRepository.login(
      email: email,
      password: password,
    );
    result.fold(
      (token) => emit(state.copyWith(status: OnboardingSessionStatus.success)),
      (error) => emit(
        state.copyWith(
          status: OnboardingSessionStatus.failure,
          errorMessage: error,
        ),
      ),
    );
  }
}
