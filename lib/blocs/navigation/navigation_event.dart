import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigateToSplashScreen2 extends NavigationEvent {}

class NavigateToOnboarding extends NavigationEvent {}

class NavigateToOnboarding2 extends NavigationEvent {}

class NavigateToOnboarding3 extends NavigationEvent {}

class NavigateToHome extends NavigationEvent {}

class NavigateToLogin extends NavigationEvent {}
