import 'package:flutter/material.dart';
import 'package:tsf/components/background.dart';
import 'package:tsf/screens/ForgotPassword.dart';
import 'package:tsf/screens/HomeScreen.dart';
import 'package:tsf/screens/Login.dart';
import 'package:tsf/screens/Notifications.dart';
import 'package:tsf/screens/OrderDetails.dart';
import 'package:tsf/screens/adminDashboard.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Login());
      case '/login':
        return MaterialPageRoute(
          builder: (_) => Login(),
        );
      case '/admin-dashboard':
        return MaterialPageRoute(
          builder: (_) => const AdminDashboard(),
        );
      case '/forgot-password':
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case '/order-details':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => OrderDetails(
                    orderId: args,
                  ));
        }
        break;
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/notification':
        return MaterialPageRoute(builder: (_) => const Notifications());
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
