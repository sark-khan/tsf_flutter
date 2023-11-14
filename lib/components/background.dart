import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tsf/components/WidgetStyle.dart';
import 'package:tsf/utils/AppConstants.dart';
import 'package:tsf/utils/Storage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _bgState createState() => _bgState();
}

class _bgState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => navigateToNextPage());
  }

  void navigateToNextPage() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!Storage.getJwtToken()) {
        Navigator.of(context).pushReplacementNamed("/login");
      } else {
        Navigator.of(context).pushReplacementNamed("/home");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(context, BackgroundImagePath().SPLASHBACKGROUND)
        ],
      ),
    );
  }
}

Widget Background(BuildContext context, String imagePath) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
        image: DecorationImage(
      image: AssetImage(imagePath),
      fit: BoxFit.cover,
    )),
  );
}
