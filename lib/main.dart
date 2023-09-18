import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tsf/components/background.dart';
import 'package:tsf/screens/ForgotPassword.dart';
import 'package:tsf/screens/Login.dart';
import 'package:tsf/screens/OrderDetails.dart';
import 'package:tsf/utils/AppConstants.dart';
import 'package:get/get.dart';
import 'package:tsf/utils/routeGenerator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        initialRoute: '/', onGenerateRoute: RouteGenerator.generateRoute);
  }
}
