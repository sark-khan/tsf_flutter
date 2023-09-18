import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tsf/components/WidgetStyle.dart';
import 'package:tsf/utils/AppConstants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _bgState createState() => _bgState();
}

class _bgState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed((Duration(seconds: 2)), () {
      Navigator.of(context).pushNamed("/Login");
    });
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [Background(context)],
      ),
    );
  }
}

Widget Background(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
      image: AssetImage("assets/Login.png"),
      fit: BoxFit.cover,
    )),
  );
}
