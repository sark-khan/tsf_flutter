import 'package:flutter/material.dart';
import 'package:tsf/components/background.dart';
import 'package:tsf/screens/ForgotPassword.dart';
import 'package:tsf/screens/HomeScreen.dart';
import 'package:tsf/screens/Login.dart';
import 'package:tsf/screens/Notifications.dart';
import 'package:tsf/screens/OrderDetails.dart';
import 'package:tsf/screens/ResetPassword.dart';
import 'package:tsf/screens/ResetPasswordSuccess.dart';
import 'package:tsf/screens/adminDashboard.dart';
import 'package:tsf/screens/adminScreens/NotificationScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    print("here =? ${settings.name}");
    final args = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case '/login':
        return FadeRoute(
          page: Login(),
        );
      case '/admin-dashboard':
        return FadeRoute(
          page: const AdminDashboard(),
        );
      case '/forgot-password':
        return FadeRoute(page: const ForgotPassword());
      case '/order-details':
        return MaterialPageRoute(
            builder: (_) => OrderDetails(
                  orderId: args!["orderId"],
                  isOrderPage: args["isOrderPage"],
                ));
      case '/home':
        return FadeRoute(page: HomeScreen());
      case '/notification':
        return FadeRoute(page: const Notifications());
      case '/admin-notifications':
        return MaterialPageRoute(builder: (_) => AdminNotifications());
      case '/reset-password':
        return MaterialPageRoute(builder: (_) => ResetPassword());
      case "/reset-password-success":
        return MaterialPageRoute(builder: (_) => const ResetPasswordSuccess());
      case '/splash-screen':
        return FadeRoute(page: SplashScreen());
    }
    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;

  FadeRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
