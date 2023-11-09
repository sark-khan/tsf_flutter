import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:tsf/components/Buttons.dart';
import 'package:tsf/components/Cards.dart';
import 'package:tsf/components/WidgetStyle.dart';
import 'package:tsf/utils/AppConstants.dart';
import 'package:tsf/utils/NotificationListData.dart';
import 'package:tsf/utils/commonFunctions.dart';
import 'package:tsf/utils/responses/NotificationResponse.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State createState() => _NotificationState();
}

class _NotificationState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
            child: Text(TextConstants().NOTIFICATION),
          ),
          toolbarHeight: 80.0,
          actions: [Buttons().logoutButton(context)]),
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
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
                height: 90,
              ),
              // TopLayer().topLayerWidget("Notifications", context),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                // height: MediaQuery.of(context).size.height * 0.75,
                // width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                  future: CommonFunctions().getNotifications(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Message> notifResponse =
                          snapshot.data["notifications"];
                      return notifResponse.isEmpty
                          ? Column(
                              children: [
                                Lottie.asset('NotFound.json',
                                    width: 300, height: 300),
                                const Text("No Orders Found",
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ))
                              ],
                            )
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: notifResponse.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: NotificationCard().notifCard(
                                    notifResponse[index].createdAt,
                                    notifResponse[index].notificationText,
                                  ),
                                );
                              },
                            );
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    } else {
                      return const Center(
                          child: CircularProgressIndicator(color: Colors.blue));
                    }
                  },
                  // child: ListView.builder(
                  //   padding: EdgeInsets.zero,
                  //   itemCount: NotificationListData().cardData.length,
                  //   itemBuilder: (context, index) {
                  //     return Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 20),
                  //       child: NotificationCard().notifCard(
                  //         NotificationListData().cardData[index]['title']!,
                  //         NotificationListData().cardData[index]['description']!,
                  //       ),
                  //     );
                  //   },
                  // ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
