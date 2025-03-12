import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rudo/blocs/navigation/navigation_bloc.dart';
import 'package:rudo/blocs/navigation/navigation_event.dart';
import 'package:rudo/blocs/onboarding/onboarding_bloc.dart';
import 'package:rudo/blocs/onboarding/onboarding_event.dart';
import 'package:rudo/blocs/onboarding/onboarding_state.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  List<OnboardingPage> pages = [
    OnboardingPage(
      title: "Start investing in your life goals.",
      subtitle: "Smart, simple, and secure investing—tailored for your dreams.",
      features: [
        OnboardingFeature(
          icon: Icons.auto_graph,
          text: "Invest in your goals",
          subtext: "Retire early",
        ),
      ],
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        // When the current page changes in the bloc, update the PageView
        _pageController.animateToPage(
          state.currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );

        // When onboarding is complete, navigate to home
        if (state.isComplete) {
          context.read<NavigationBloc>().add(NavigateToHome());
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: SafeArea(
          child: Column(
            children: [
              // Progress indicator
              BlocBuilder<OnboardingBloc, OnboardingState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Row(
                      children: [
                        Text(
                          '${state.currentPage + 1} of ${state.totalPages}',
                          style: const TextStyle(
                            color: Color(0xFFAAAAAA),
                            fontSize: 14,
                            fontFamily: 'BeVietnamPro',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: LinearProgressIndicator(
                            value: (state.currentPage + 1) / state.totalPages,
                            backgroundColor: const Color(0xFF333333),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFF4CAF50)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              // Main content area
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    context.read<OnboardingBloc>().add(PageChanged(index));
                  },
                  itemBuilder: (context, index) {
                    return _buildPage(pages[index]);
                  },
                ),
              ),

              // Continue button
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: () {
                      context.read<OnboardingBloc>().add(NextPageRequested());
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'BeVietnamPro',
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingPage page) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Feature cards section
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: page.features.length,
              itemBuilder: (context, index) {
                final feature = page.features[index];
                // First card is highlighted
                final bool isHighlighted = index == 0;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isHighlighted
                          ? const Color(0xFF1E3A34)
                          : const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: isHighlighted
                                  ? const Color(0xFF2E5E55)
                                  : const Color(0xFF333333),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              feature.icon,
                              color: isHighlighted ? Colors.white : Colors.grey,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  feature.text,
                                  style: TextStyle(
                                    color: isHighlighted
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'BeVietnamPro',
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      feature.subtext,
                                      style: TextStyle(
                                        color: isHighlighted
                                            ? Colors.white
                                            : Colors.grey,
                                        fontSize: 14,
                                        fontFamily: 'BeVietnamPro',
                                      ),
                                    ),
                                    if (isHighlighted)
                                      const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Title and subtitle
          const SizedBox(height: 16),
          Text(
            page.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1.2,
              fontFamily: 'BeVietnamPro',
            ),
          ),
          const SizedBox(height: 16),
          Text(
            page.subtitle,
            style: const TextStyle(
              color: Color(0xFFAAAAAA),
              fontSize: 16,
              height: 1.5,
              fontFamily: 'BeVietnamPro',
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class OnboardingPage {
  final String title;
  final String subtitle;
  final List<OnboardingFeature> features;

  OnboardingPage({
    required this.title,
    required this.subtitle,
    required this.features,
  });
}

class OnboardingFeature {
  final IconData icon;
  final String text;
  final String subtext;

  OnboardingFeature({
    required this.icon,
    required this.text,
    required this.subtext,
  });
}
