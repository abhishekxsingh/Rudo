import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rudo/blocs/app/app_event.dart';
import 'package:rudo/blocs/app/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initial()) {
    on<AppStarted>(_onAppStarted);
    on<OnboardingCompleted>(_onOnboardingCompleted);
  }

  void _onAppStarted(
    AppStarted event,
    Emitter<AppState> emit,
  ) {
    // Here you could load saved preferences or user data
    // For now, just initialize the state
    emit(AppState.initial());
  }

  void _onOnboardingCompleted(
    OnboardingCompleted event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(isOnboardingCompleted: true));
  }
}
