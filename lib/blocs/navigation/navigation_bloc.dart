import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rudo/blocs/navigation/navigation_event.dart';
import 'package:rudo/blocs/navigation/navigation_state.dart';
import 'dart:async';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState.initial()) {
    on<NavigateToSplashScreen2>(_onNavigateToSplashScreen2);
    on<NavigateToOnboarding>(_onNavigateToOnboarding);
    on<NavigateToOnboarding2>(_onNavigateToOnboarding2);
    on<NavigateToOnboarding3>(_onNavigateToOnboarding3);
    on<NavigateToHome>(_onNavigateToHome);
    on<NavigateToLogin>(_onNavigateToLogin);

    // Auto-trigger navigation after delays
    _startSplashTimer();
  }

  void _startSplashTimer() {
    // First transition: splash1 -> splash2 after 2 seconds
    Timer(const Duration(seconds: 2), () {
      add(NavigateToSplashScreen2());

      // Second transition: splash2 -> onboarding after 3 seconds
      Timer(const Duration(seconds: 3), () {
        add(NavigateToOnboarding());
      });
    });
  }

  void _onNavigateToSplashScreen2(
    NavigateToSplashScreen2 event,
    Emitter<NavigationState> emit,
  ) {
    emit(state.copyWith(currentRoute: AppRoute.splash2));
  }

  void _onNavigateToOnboarding(
    NavigateToOnboarding event,
    Emitter<NavigationState> emit,
  ) {
    emit(state.copyWith(currentRoute: AppRoute.onboarding1));
  }

  void _onNavigateToOnboarding2(
    NavigateToOnboarding2 event,
    Emitter<NavigationState> emit,
  ) {
    emit(state.copyWith(currentRoute: AppRoute.onboarding2));
  }

  void _onNavigateToOnboarding3(
    NavigateToOnboarding3 event,
    Emitter<NavigationState> emit,
  ) {
    emit(state.copyWith(currentRoute: AppRoute.onboarding3));
  }

  void _onNavigateToHome(
    NavigateToHome event,
    Emitter<NavigationState> emit,
  ) {
    emit(state.copyWith(currentRoute: AppRoute.savingscreen));
  }

  void _onNavigateToLogin(
    NavigateToLogin event,
    Emitter<NavigationState> emit,
  ) {
    emit(state.copyWith(currentRoute: AppRoute.login));
  }
}
