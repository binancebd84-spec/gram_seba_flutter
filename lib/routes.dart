import 'package:flutter/material.dart';

import 'features/onboarding/intro_screen.dart';
import 'features/auth/login_screen.dart';
import 'features/auth/register_screen.dart';
import 'features/home/home_screen.dart';
import 'features/emergency/emergency_screen.dart';
import 'features/services/service_list_screen.dart';
import 'features/services/service_details_screen.dart';
import 'features/services/models/service_model.dart';

class AppRoutes {
  static const intro = '/intro';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const emergency = '/emergency';
  static const services = '/services';
  static const serviceDetails = '/service-details';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case intro:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case emergency:
        return MaterialPageRoute(builder: (_) => const EmergencyScreen());
      case services:
        return MaterialPageRoute(builder: (_) => const ServiceListScreen());
      case serviceDetails:
        final service = settings.arguments as ServiceModel;
        return MaterialPageRoute(builder: (_) => ServiceDetailsScreen(service: service));
      default:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
    }
  }
}