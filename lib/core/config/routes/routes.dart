import 'package:currency_converter/core/config/routes/page_route_names.dart';
import 'package:currency_converter/presentation/features/home_feature/pages/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../presentation/features/splash_screen_feature/splash_screen.dart';

class Routes {
  static Route<dynamic> onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteNames.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case PageRouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
