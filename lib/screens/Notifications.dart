import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tsf/components/Cards.dart';
import 'package:tsf/components/WidgetStyle.dart';
import 'package:tsf/utils/AppConstants.dart';
import 'package:tsf/utils/NotificationListData.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State createState() => _NotificationState();
}

class _NotificationState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Login.png"), fit: BoxFit.cover)),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              TopLayer().topLayerWidget("Notifications", context),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: NotificationListData().cardData.length,
                  itemBuilder: (context, index) {
                    return NotificationCard().notifCard(
                      NotificationListData().cardData[index]['title']!,
                      NotificationListData().cardData[index]['description']!,
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
