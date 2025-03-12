import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigateToSplashScreen2 extends NavigationEvent {}

class NavigateToOnboarding extends NavigationEvent {}

class NavigateToHome extends NavigationEvent {}
