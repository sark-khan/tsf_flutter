import 'package:flutter/material.dart';
import 'package:tsf/components/background.dart';
import 'package:tsf/screens/ForgotPassword.dart';
import 'package:tsf/screens/HomeScreen.dart';
import 'package:tsf/screens/Login.dart';
import 'package:tsf/screens/Notifications.dart';
import 'package:tsf/screens/OrderDetails.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/login':
        return MaterialPageRoute(
          builder: (_) => Login(),
        );
      case '/forgot-password':
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case '/order-details':
        return MaterialPageRoute(
            builder: (_) => OrderDetails(
                  orderId: args!["orderId"],
                  isOrderPage: args["isOrderPage"],
                ));

        break;
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/notification':
        return FadeRoute(page: const Notifications());
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
