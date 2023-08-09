import 'package:app_laundry/domain/constants/routes.dart';
import 'package:app_laundry/presentation/home/home_page.dart';
import 'package:app_laundry/presentation/login/login_screen.dart';
import 'package:app_laundry/presentation/spash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes =
    <String, Widget Function(BuildContext)>{
  NamedRoutes.homeScreen.route: (BuildContext context) => const HomePage(),
  NamedRoutes.splashScreen.route: (BuildContext context) =>
      const SplashScreen(),
  NamedRoutes.loginScreen.route: (BuildContext context) => const LoginScreen(),
};
