import 'package:get/get.dart';

import '../features/authentication/presentation/screens/forgot_password_screen.dart';
import '../features/authentication/presentation/screens/login_screen.dart';
import '../features/authentication/presentation/screens/otp_screen.dart';
import '../features/authentication/presentation/screens/signup_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../features/onboarding/presentation/screens/take_selfie_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import '../features/notification/presentation/screens/notification_screen.dart';

class AppRoute {
  static const String splashScreen = '/';
  static const String loginScreen = '/loginScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String homeScreen = '/homeScreen';
  static const String takeSelfieScreen = '/takeSelfieScreen';
  static const String onboardingScreen = '/onboardingScreen';
  static const String otpScreen = '/otpScreen';
  static const String notificationScreen = '/notificationScreen';

  static String getSplashScreen() => splashScreen;
  static String getLoginScreen() => loginScreen;
  static String getSignUpScreen() => signUpScreen;
  static String getForgotPasswordScreen() => forgotPasswordScreen;
  static String getHomeScreen() => homeScreen;
  static String getTakeSelfieScreen() => takeSelfieScreen;
  static String getOnboardingScreen() => onboardingScreen;
  static String getOtpScreen() => otpScreen;
  static String getNotificationScreen() => notificationScreen;

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: signUpScreen, page: () => const SignUpScreen()),
    GetPage(
      name: forgotPasswordScreen,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: takeSelfieScreen, page: () => const TakeSelfieScreen()),
    GetPage(name: onboardingScreen, page: () => const OnboardingScreen()),
    GetPage(name: otpScreen, page: () => const OTPScreen()),
    GetPage(name: notificationScreen, page: () => const NotificationScreen()),
  ];
}
