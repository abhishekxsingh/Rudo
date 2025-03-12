import 'package:equatable/equatable.dart';

enum AppRoute {
  splash1,
  splash2,
  onboarding1,
  onboarding2,
  onboarding3,
  savingscreen,
  home,
  login,
}

class NavigationState extends Equatable {
  final AppRoute currentRoute;

  const NavigationState({required this.currentRoute});

  factory NavigationState.initial() {
    return const NavigationState(currentRoute: AppRoute.splash1);
  }

  NavigationState copyWith({AppRoute? currentRoute}) {
    return NavigationState(
      currentRoute: currentRoute ?? this.currentRoute,
    );
  }

  @override
  List<Object> get props => [currentRoute];
}
