import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rudo/blocs/app/app_bloc.dart';
import 'package:rudo/blocs/app/app_event.dart';
import 'package:rudo/blocs/navigation/navigation_bloc.dart';
import 'package:rudo/blocs/navigation/navigation_state.dart';
import 'package:rudo/blocs/onboarding/onboarding_bloc.dart';
import 'package:rudo/screens/onboarding_page_1.dart';
import 'package:rudo/screens/onboarding_page_2.dart';
import 'package:rudo/screens/splashscreen_page_1.dart';
import 'package:rudo/screens/splashscreen_page_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (context) => AppBloc()..add(AppStarted() as AppEvent),
        ),
        BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider<OnboardingBloc>(
          create: (context) => OnboardingBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'RuDo App',
        debugShowCheckedModeBanner: false, // Remove debug banner
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            switch (state.currentRoute) {
              case AppRoute.splash1:
                return const SplashScreenPage1();
              case AppRoute.splash2:
                return const SplashScreenPage2();
              case AppRoute.onboarding:
                return const OnboardingScreen();
              case AppRoute.onboarding1:
                return const SavingsScreen();
              case AppRoute.home:
                return const Scaffold();
            }
          },
        ),
      ),
    );
  }
}

class AppStarted {}
