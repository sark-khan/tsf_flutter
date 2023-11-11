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
    Future.delayed(Duration(seconds: 2), () {
      if (!Storage.getJwtToken()) {
        Navigator.of(context).pushReplacementNamed("/login");
      } else {
        Navigator.of(context).pushReplacementNamed("/home");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // Future.delayed((Duration(seconds: 2)), () {
    //   // Storage.addJwtToken(
    //   //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhcmlrLnNhay5raGFuQGdtYWlsLmNvbSIsIm5hbWUiOiJzYXJpa19sb2NhbCIsInJvbGUiOiJVc2VyIiwidXNlcklkIjoiNjUyM2E2ZGMxNTYwODEyMTg0MGRkMmZlIiwiYWNjb3VudE51bWJlciI6IjEyMzQ1Njc4OTAiLCJpYXQiOjE2OTk0MzQzNDJ9.NH5get8DFsvRVEOomA4lbyGQyVVQd6uEbLbFqkVxMPY");
    //   if (!Storage.getJwtToken()) {
    //     return Navigator.of(context).pushNamed("/login");
    //   } else {
    //     return Navigator.of(context).pushNamed("/home");
    //   }
    // });

    // , arguments: "6524fbbcf78efb4533d83999"
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
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
        image: DecorationImage(
      image: AssetImage(imagePath),
      fit: BoxFit.cover,
    )),
  );
}
