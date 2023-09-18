import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tsf/utils/AppConstants.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //   leading: Padding(
      //     padding: const EdgeInsets.all(20.0),
      //     child: IconButton(
      //       icon: const Icon(
      //         Icons.arrow_back,
      //         color: Colors.white,
      //         size: 30,
      //       ),
      //       onPressed: () => Navigator.of(context).pop(),
      //     ),
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(20.0),
      //       child: IconButton(
      //           onPressed: () {},
      //           icon: const Icon(
      //             Icons.notifications_none_outlined,
      //             color: Colors.white,
      //             size: 30,
      //           )),
      //     )
      //   ],
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      // ),
      // extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Login.png"), fit: BoxFit.cover)),
          ),
          Column(children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.white,
                          ))),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_none_outlined,
                        size: 30,
                        color: AppColors().white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: Text(
                      "Order Details",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: AppColors().white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                width: double.infinity,
                color: AppColors().white,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1000)),
                  elevation: 20,
                  shadowColor: AppColors().textFieldShadow,
                  color: AppColors().white,
                  child: Column(children: [Text("Order ID:. 99")]),
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
