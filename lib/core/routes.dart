import 'package:flutter/material.dart';
import 'package:new_project/presentation/forgot_password/forgot_password_view.dart';
import 'package:new_project/presentation/home/home_view.dart';
import 'package:new_project/presentation/login/login_view.dart';
import 'package:new_project/presentation/register/register_view.dart';
import 'package:new_project/presentation/splash/splash_view.dart';
import 'package:new_project/presentation/store_details/store_details_view.dart';

class Routes {
  static const String splashRoute = '/splash';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String homeRoute = '/home';
  static const String storeDetailsRoute = '/storeDetails';
}

class RouteGenerator {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (context) => const RegisterView());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (context) => const ForgotPasswordView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (context) => const StoreDetailsView());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(body: Center(child: Text('No Route Found'))),
        );
    }
  }
}
