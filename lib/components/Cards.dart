import 'package:flutter/material.dart';
import 'package:tsf/utils/AppConstants.dart';

class NotificationCard {
  Widget notifCard(String title, String description) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              8)), // Adjust the elevation for the card shadow
      // margin: const EdgeInsets.only(
      //     left: 10,
      //     right: 10,
      //     bottom: 10,
      //     top: 0), // Adjust the margin for spacing between cards
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w100,
                color: AppColors().lightGrey,
              ),
            ),
          ),
          const SizedBox(height: 7),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: AppColors().textBlack),
            ),
          ),
        ]),
      ),
    );
  }
}

class HomeCard {
  Widget homeCard(String title, String arrivingTime, String date,
      String priority, String id, BuildContext context) {

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/order-details",
            arguments: {"orderId": id, "isOrderPage": true});
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // margin: const EdgeInsets.only(
        //   left: 20,
        //   right: 10,
        //   bottom: 10,
        //   top: 0,
        // ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                date,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.green,
                              fontSize: 10),
                          children: [
                        const TextSpan(text: "Estimated Delivery on \n"),
                        TextSpan(
                            text: arrivingTime,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12))
                      ])),

                  RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                          style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                              fontSize: 10),
                          children: [
                            TextSpan(text: "Priority \n"),
                            TextSpan(
                                text: priority,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Colors.red,
                                ))
                          ])),

                  // Row(
                  //   children: [
                  //     // Text(
                  //     //   "Priority: ",
                  //     //   textScaleFactor: 0.8,
                  //     //   style: TextStyle(
                  //     //     fontWeight: FontWeight.w300,
                  //     //     color: Colors.black,
                  //     //   ),
                  //     // ),
                  //     SizedBox(width: 4),
                  //     Text(
                  //       priority,
                  //       textScaleFactor: 0.8,
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.w300,
                  //         color: Colors.red,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dispatchCard(String title, DateTime inventoryDate, DateTime soDate,
      String id, BuildContext context) {
    // final ratio = MediaQuery.of(context).size.width <
    //         MediaQuery.of(context).size.height
    //     ? MediaQuery.of(context).size.width / MediaQuery.of(context).size.height
    //     : MediaQuery.of(context).size.height /
    //         MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/order-details",
            arguments: {"orderId": id, "isOrderPage": false});
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // margin: const EdgeInsets.only(
        //   left: 20,
        //   right: 10,
        //   bottom: 10,
        //   top: 0,
        // ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                soDate.toString().split(" ")[0],
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.green,
                              fontSize: 10),
                          children: [
                        const TextSpan(text: "Estimated Delivery on \n"),
                        TextSpan(
                            text: inventoryDate.toString().split(" ")[0],
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12))
                      ]))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
