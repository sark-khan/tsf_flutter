import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tsf/utils/AppConstants.dart';
import 'package:tsf/utils/Storage.dart';
import 'package:tsf/utils/commonFunctions.dart';

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
    String token = Storage.getJwtToken();
    Future.delayed(const Duration(seconds: 2), () {
      if (token.isEmpty) {
        Navigator.of(context).pushReplacementNamed("/login");
      } else {
        getUserRole() == "Admin" || getUserRole() == "Subadmin"
            ? Navigator.pushNamed(context, "/admin-dashboard")
            : Navigator.pushNamed(context, "/home");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Background(context, BackgroundImagePath().SPLASHBACKGROUND)
          ],
        ),
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
