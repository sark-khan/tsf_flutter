import 'package:flutter/material.dart';
import 'package:tsf/components/background.dart';
import 'package:tsf/screens/ForgotPassword.dart';
import 'package:tsf/screens/Login.dart';
import 'package:tsf/screens/OrderDetails.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/Login':
        return MaterialPageRoute(
          builder: (_) => Login(),
        );
      case '/forgot-password':
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case '/order-details':
        return MaterialPageRoute(builder: (_) => const OrderDetails());
      // case '/home':
      //   return MaterialPageRoute(builder: (_) => HomePage());
      //   case '/edit':
      //   return MaterialPageRoute(builder: (_) => EditProfile());
      default:
        return _errorRoute();
    }
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
