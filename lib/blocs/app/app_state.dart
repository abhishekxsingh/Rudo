import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final bool isOnboardingCompleted;

  const AppState({
    required this.isOnboardingCompleted,
  });

  factory AppState.initial() {
    return const AppState(
      isOnboardingCompleted: false,
    );
  }

  AppState copyWith({
    bool? isOnboardingCompleted,
  }) {
    return AppState(
      isOnboardingCompleted:
          isOnboardingCompleted ?? this.isOnboardingCompleted,
    );
  }

  @override
  List<Object> get props => [isOnboardingCompleted];
}
