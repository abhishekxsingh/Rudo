import 'package:flutter/material.dart';
import 'package:rudo/blocs/navigation/navigation_bloc.dart';
import 'package:rudo/blocs/navigation/navigation_event.dart';

class OnboardingPage2 extends StatelessWidget {
  OnboardingPage2({super.key})
      : _pageController = PageController(),
        _currentPage = 0;

  final PageController _pageController;
  final int _currentPage;
  final int _totalPages = 3;

  get context => null;

  void _nextPage() {
    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Use NavigationBloc to navigate to onboarding2
      context.read<NavigationBloc>().add(NavigateToOnboarding3());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 1),

              // Home icon and goal
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[900],
                      ),
                      child: Icon(
                        Icons.home,
                        color: Colors.amber[200],
                        size: 30,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Buy dream home',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '₹',
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          '10.4 Lakh',
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Icon(
                      Icons.arrow_upward,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Contributors section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildContributor('You', '₹5.2 Lakh'),
                  const SizedBox(width: 20),
                  _buildContributor('Your wife', '₹5.2 Lakh'),
                ],
              ),

              const Spacer(flex: 2),

              // Bottom text
              const Text(
                'Grow your wealth together.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: 'Be Vietnam Pro',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Invest with your family member and build wealth, together.',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 18,
                  fontFamily: 'Be Vietnam Pro',
                  fontWeight: FontWeight.w400,
                ),
              ),

              const Spacer(),

              // Continue button
              GestureDetector(
                onTap: () {
                  _nextPage();
                  // Using direct navigation instead of named routes
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const OnboardingScreenPage3()),
                  // );
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  margin: const EdgeInsets.only(bottom: 40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Be Vietnam Pro',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom indicator
              Center(
                child: Container(
                  width: 120,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContributor(String title, String amount) {
    return Container(
      width: 160,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            amount,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
