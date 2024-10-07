// ignore_for_file: constant_identifier_names
import 'package:hobapp/app/modules/auth/forgot_password/forgotpass_binding.dart';
import 'package:hobapp/app/modules/auth/forgot_password/forgotpass_view.dart';
import 'package:hobapp/app/modules/auth/login/login_binding.dart';
import 'package:hobapp/app/modules/auth/login/login_view.dart';
import 'package:hobapp/app/modules/auth/new_password/new_password_binding.dart';
import 'package:hobapp/app/modules/auth/new_password/new_password_view.dart';
import 'package:hobapp/app/modules/auth/register/register_binding.dart';
import 'package:hobapp/app/modules/auth/register/register_view.dart';
import 'package:hobapp/app/modules/home/home_binding.dart';
import 'package:hobapp/app/modules/home/home_view.dart';
import 'package:hobapp/app/modules/mood/mood_binding.dart';
import 'package:hobapp/app/modules/mood/mood_view.dart';
import 'package:hobapp/app/modules/recommended/recommended_binding.dart';
import 'package:hobapp/app/modules/recommended/recommended_view.dart';
import 'package:hobapp/app/modules/splash/splash_binding.dart';
import 'package:hobapp/app/modules/splash/splash_view.dart';
import 'package:get/get.dart';
import 'package:hobapp/app/modules/weekly/weekly_binding.dart';
import 'package:hobapp/app/modules/weekly/weekly_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.SPLASH;
  static const HOME = Routes.LOGIN;
  static final routes = [
    GetPage(
        name: _Paths.SPLASH,
        page: () => const SplashView(),
        binding: SplashBinding(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(seconds: 0, milliseconds: 0),
        preventDuplicates: true),
    GetPage(
        name: _Paths.LOGIN,
        page: () => const LoginView(),
        binding: LoginBinding(),
        transition: Transition.noTransition,
        transitionDuration: const Duration(seconds: 0, milliseconds: 0),
        preventDuplicates: true),
    GetPage(
        name: _Paths.REGISTER,
        page: () => const RegisterView(),
        binding: RegisterBinding(),
        preventDuplicates: true),
    GetPage(
        name: _Paths.FORGOTPASS,
        page: () => const ForgotPasswordView(),
        binding: ForgotPasswordBinding(),
        preventDuplicates: true),
    GetPage(
        name: _Paths.NEWPASS,
        page: () => const NewPasswordView(),
        binding: NewPasswordBinding(),
        preventDuplicates: true),
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        preventDuplicates: true),
    GetPage(
        name: _Paths.MOOD,
        page: () => const MoodView(),
        binding: MoodBinding(),
        preventDuplicates: true),
    GetPage(
        name: _Paths.RECOMMENDED,
        page: () => const RecommendedView(),
        binding: RecommendedBinding(),
        preventDuplicates: true),
    GetPage(
        name: _Paths.WEEKLY,
        page: () => const WeeklyView(),
        binding: WeeklyBinding(),
        preventDuplicates: true),
  ];
}
