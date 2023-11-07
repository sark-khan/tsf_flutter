import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tsf/components/WidgetStyle.dart';
import 'package:tsf/components/background.dart';
import 'package:tsf/components/customLoader.dart';
import 'package:tsf/utils/AppConstants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/commonFunctions.dart';

class Login extends StatefulWidget {
  @override
  State createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool isPasswordFieldVisible = false;
  bool isPasswordVisible = false;
  String buttonText = TextConstants().SUBMIT;
  bool obscureText = true;
  bool userChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Background(context, BackgroundImagePath().LOGINBACKGROUND),
          Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TextConstants().LOGIN,
                    style: TextStyle(
                        color: AppColors().white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.40,
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1),
            child: Column(children: [
              Container(
                decoration: BoxShadows().customDecoration(
                    AppColors().textFieldShadow, 2, 5, const Offset(0, 3)),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    fillColor: AppColors().textFillColor,
                    filled: true,
                    enabled: !isPasswordFieldVisible,
                    hintText: TextConstants().EMAIL,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Icon(Icons.email),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Visibility(
                visible: isPasswordFieldVisible,
                child: Container(
                  decoration: BoxShadows().customDecoration(
                      AppColors().textFieldShadow, 2, 5.0, const Offset(0, 3)),
                  child: TextField(
                    controller: passwordController,
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      fillColor: AppColors().textFillColor,
                      filled: true,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(Icons.password_rounded),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: obscureText ? Colors.grey : Colors.blue,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                                obscureText = !obscureText;
                              });
                            }),
                      ),
                      hintText: TextConstants().PASSWORD,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: isPasswordFieldVisible,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () => {
                          Navigator.of(context).pushNamed("/forgot-password")
                        },
                        child: Text(
                          TextConstants().FORGOTPASSWORD,
                          style: TextStyle(color: AppColors().white),
                        ),
                      ),
                    )),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.10,
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1),
                child: Container(
                  width: double.infinity,
                  decoration: BoxShadows().customDecoration(
                      AppColors().textFieldShadow, 2, 5, const Offset(0, 2)),
                  child: MaterialButton(
                    // elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: AppColors().gold,

                    onPressed: hasConnectionWrapper(
                      () async {
                        print("reached here");
                        if (!userChecked) {
                          ReturnObj returnObj = await CommonFunctions.CheckUser(
                              emailController.text);
                          Fluttertoast.showToast(msg: returnObj.message);
                          if (returnObj.status) {
                            setState(() {
                              isPasswordFieldVisible = true;
                              buttonText = TextConstants().LOGIN;
                              userChecked = !userChecked;
                              // Set to true or false as needed
                            });
                          }
                        } else {
                          print("here");
                          ReturnObj returnObj = await CommonFunctions.Login(
                              emailController.text, passwordController.text);
                          Fluttertoast.showToast(msg: returnObj.message);
                          if (returnObj.status) {
                            Navigator.pushNamed(context, "/home");
                          }
                        }
                      },
                    ),
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(buttonText,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(color: AppColors().white),
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
