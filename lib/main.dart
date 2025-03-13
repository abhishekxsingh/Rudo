import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rudo/blocs/app/app_bloc.dart';
import 'package:rudo/blocs/app/app_event.dart';
import 'package:rudo/blocs/navigation/navigation_bloc.dart';
import 'package:rudo/blocs/navigation/navigation_state.dart';
import 'package:rudo/blocs/onboarding/onboarding_bloc.dart';
import 'package:rudo/screens/loginpage.dart';
import 'package:rudo/screens/onboarding_page_1.dart';
import 'package:rudo/screens/onboarding_page_2.dart';
import 'package:rudo/screens/onboarding_page_3.dart';
import 'package:rudo/screens/splashscreen_page_1.dart';
import 'package:rudo/screens/splashscreen_page_2.dart';
import 'package:rudo/services/firebase_auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    debugPrint("Firebase initialization error: $e");
  }

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
        debugShowCheckedModeBanner: false,
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
              case AppRoute.onboarding1:
                return const OnboardingPage1();
              case AppRoute.onboarding2:
                return OnboardingPage2();
              case AppRoute.onboarding3:
                return const OnboardingPage3();
              case AppRoute.login:
                return const LoginScreen();
              case AppRoute.home:
                return const SplashScreenPage1();
              default:
                return const OnboardingPage3();
            }
          },
        ),
      ),
    );
  }
}
