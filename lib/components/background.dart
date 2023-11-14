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
      Navigator.of(context).pushNamed("/admin-dashboard");
    });
    return Scaffold(
      body: Stack(
        children: [
          Background(context, BackgroundImagePath().SPLASHBACKGROUND)
          // Column(
          //   children: [
          //     SizedBox(
          //       height: MediaQuery.of(context).size.height * 0.04,
          //     ),
          //     TopLayer().topLayerWidget("Home", context),
          //   ],
          // )
        ],
      ),
    );
  }
}

Widget Background(BuildContext context, String imagePath) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
      image: AssetImage(imagePath),
      fit: BoxFit.fill,
    )),
  );
}
