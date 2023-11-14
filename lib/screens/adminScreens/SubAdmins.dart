


import 'package:flutter/material.dart';

import 'baseScreen.dart';

class SubAdmins extends StatelessWidget {
  const SubAdmins({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body:BaseUI(
        headline: "SUB ADMINS",
        child: Container(color: Colors.red,))
    );
  }
}