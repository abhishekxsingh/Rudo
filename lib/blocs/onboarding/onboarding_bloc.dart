import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rudo/blocs/onboarding/onboarding_event.dart';
import 'package:rudo/blocs/onboarding/onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState.initial()) {
    on<PageChanged>(_onPageChanged);
    on<NextPageRequested>(_onNextPageRequested);
    on<OnboardingFinished>(_onOnboardingFinished);
  }

  void _onPageChanged(
    PageChanged event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(currentPage: event.pageIndex));
  }

  void _onNextPageRequested(
    NextPageRequested event,
    Emitter<OnboardingState> emit,
  ) {
    final nextPage = state.currentPage + 1;

    if (nextPage < state.totalPages) {
      emit(state.copyWith(currentPage: nextPage));
    } else {
      add(OnboardingFinished());
    }
  }

  void _onOnboardingFinished(
    OnboardingFinished event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(isComplete: true));
  }
}
