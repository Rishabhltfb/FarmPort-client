import 'package:farmport_app/ui/screens/auth/auth_screen.dart';
import 'package:farmport_app/ui/screens/crop_market/crop_market_screen.dart';
import 'package:farmport_app/ui/screens/crops_upload/crops_upload.dart';
import 'package:farmport_app/ui/screens/home/home_screen.dart';
import 'package:farmport_app/ui/screens/my_crop/my_crop.dart';
import 'package:farmport_app/ui/screens/onboarding/onboading_screen.dart';
import 'package:farmport_app/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case OnboardingScreen.route:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case AuthScreen.route:
        return MaterialPageRoute(
          builder: (context) => const AuthScreen(),
        );
      case HomeScreen.route:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case CropsUpload.route:
        return MaterialPageRoute(
          builder: (context) => const CropsUpload(),
        );
      case MyCropScreen.route:
        return MaterialPageRoute(
          builder: (context) => const MyCropScreen(),
        );
      case CropMarketScreen.route:
        return MaterialPageRoute(
          builder: (context) => const CropMarketScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
