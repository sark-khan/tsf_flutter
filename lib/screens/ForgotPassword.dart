import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tsf/components/WidgetStyle.dart';
import 'package:tsf/components/background.dart';
import 'package:tsf/utils/AppConstants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tsf/utils/commonFunctions.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController forgotEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(automaticallyImplyLeading: true),
        body: Stack(
          children: [
            Background(context, BackgroundImagePath().LOGINBACKGROUND),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.20,
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1),

                      // alignment: Alignment.center,
                      child: Center(
                        child: Text(
                          TextConstants().FORGOTPASSWORDSCREENTEXT,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: AppColors().white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.20,
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1),
                      child: Container(
                        decoration: BoxShadows().customDecoration(
                            AppColors().textFieldShadow,
                            2,
                            5,
                            const Offset(0, 3)),
                        child: TextField(
                          controller: forgotEmailController,
                          decoration: InputDecoration(
                            fillColor: AppColors().textFillColor,
                            filled: true,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Icon(Icons.email),
                            ),
                            hintText: TextConstants().EMAIL,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      )),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.20,
                        left: MediaQuery.of(context).size.width * 0.1,
                        right: MediaQuery.of(context).size.width * 0.1),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxShadows().customDecoration(
                          AppColors().textFieldShadow,
                          2,
                          5,
                          const Offset(0, 2)),
                      child: MaterialButton(
                          // elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: AppColors().gold,
                          onPressed: () async {
                            ReturnObj response = await CommonFunctions()
                                .ForgotPassword(forgotEmailController.text);
                            if (response.status) {
                              Fluttertoast.showToast(
                                  msg:
                                      "Reset Password Link send to Your Registered Email");
                            } else {
                              Fluttertoast.showToast(msg: response.message);
                            }
                          },
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(TextConstants().SUBMIT,
                                  style: GoogleFonts.montserrat(
                                      textStyle:
                                          TextStyle(color: AppColors().white),
                                      fontWeight: FontWeight.bold)),
                            ),
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
