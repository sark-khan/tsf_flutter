import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tsf/components/WidgetStyle.dart';
import 'package:tsf/utils/DropDownItems.dart';
import 'package:tsf/utils/AppConstants.dart';
import 'package:tsf/utils/responses/OrdersResponse.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  String selectedItem = "High";

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
          Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            TopLayer().topLayerWidget("Order Details", context),
            Padding(
              padding: EdgeInsets.only(
                  top: 30,
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  // minHeight: MediaQuery.of(context).size.height * 0.6,
                  maxHeight: MediaQuery.of(context).size.height * 0.6,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 20,
                  shadowColor: AppColors().textFieldShadow,
                  color: AppColors().white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text("Order#: 5523456",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(color: AppColors().grey),
                                  // letterSpacing: 1.1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text("10-Sept-2023, 3:00 PMd",
                              style: GoogleFonts.montserrat(
                                  textStyle:
                                      TextStyle(color: AppColors().lightGrey),
                                  // letterSpacing: 1.1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text("Estimated Deleviery on 21 Dec",
                              style: GoogleFonts.montserrat(
                                  textStyle:
                                      TextStyle(color: AppColors().green),
                                  // letterSpacing: 1.1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text("Priority :",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: AppColors().lightGrey),
                                      // letterSpacing: 1.1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              //padding: EdgeInsets.all(4),
                              height: 25,
                              decoration: BoxDecoration(
                                color: AppColors().lightGrey,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: DropdownButton(
                                padding: const EdgeInsets.only(left: 15),
                                items: MyDropDown().dropdownItems,
                                value: selectedItem,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedItem = newValue!;
                                  });
                                },
                                underline: Container(
                                  height:
                                      0.0, // Set the height to 0.0 to remove the underline
                                  color: Colors
                                      .transparent, // You can also set the color to transparent
                                ),
                              ),
                            )
                          ],
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SingleChildScrollView(
                              // scrollDirection: Axis.vertical,
                              child: Text(TextConstants().exampleText,
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: AppColors().textBlack),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: MaterialButton(
                  // elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: AppColors().gold,
                  onPressed: () {
                    Navigator.of(context).pushNamed("/home");
                  },
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(TextConstants().SUBMIT,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(color: AppColors().white),
                              fontWeight: FontWeight.bold)),
                    ),
                  )),
            ),
          ]),
        ],
      ),
    );
  }
}
