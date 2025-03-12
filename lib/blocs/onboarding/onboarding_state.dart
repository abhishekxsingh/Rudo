import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int currentPage;
  final int totalPages;
  final bool isComplete;

  const OnboardingState({
    required this.currentPage,
    required this.totalPages,
    this.isComplete = false,
  });

  factory OnboardingState.initial() {
    return const OnboardingState(
      currentPage: 0,
      totalPages: 4,
    );
  }

  OnboardingState copyWith({
    int? currentPage,
    int? totalPages,
    bool? isComplete,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  @override
  List<Object> get props => [currentPage, totalPages, isComplete];
}
