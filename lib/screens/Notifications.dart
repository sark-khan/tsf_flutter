import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:lottie/lottie.dart';
import 'package:tsf/components/Buttons.dart';
import 'package:tsf/components/Cards.dart';
import 'package:tsf/utils/AppConstants.dart';
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
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
                    image: AssetImage("assets/InnerBackground.png"),
                    fit: BoxFit.cover)),
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
                      ReturnObj? ret = snapshot.data;

                      if (!ret!.status) {
                        return const Center(
                            child: Text("Server is Busy",
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )));
                      }
                      List<Message> notifResponse = ret.data!.cast<Message>();
                      return notifResponse.isEmpty
                          ? Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: screenSize.height * 0.1389473684),
                                child: Column(
                                  children: [
                                    Lottie.asset(
                                      'assets/NotFound.json',
                                      width: screenSize.width * 0.694444444,
                                      height: screenSize.height * 0.328947368,
                                    ),
                                    Text(
                                      TextConstants().NOT_FOUND,
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                      printError(
                          info: "Error in Notification : ${snapshot.error}");
                      return Center(child: Text(TextConstants().SERVER_BUSY));
                    } else {
                      return const Center(
                          child:
                              CircularProgressIndicator(color: Colors.white));
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
