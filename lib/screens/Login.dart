import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tsf/components/WidgetStyle.dart';
import 'package:tsf/components/background.dart';
import 'package:tsf/components/customLoader.dart';
import 'package:tsf/utils/AppConstants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tsf/utils/Constants.dart';

import '../utils/commonFunctions.dart';

class Login extends StatefulWidget {
  @override
  State createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  String? email;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  bool isPasswordFieldVisible = false;
  bool isPasswordVisible = false;
  String buttonText = TextConstants().SUBMIT;
  bool obscureText = true;
  bool userChecked = false;

  @override
  void dispose() {
    emailController!.dispose(); // Don't forget to dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Stack(
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
                        AppColors().textFieldShadow,
                        2.0,
                        5.0,
                        const Offset(0, 3)),
                    child: TextField(
                      controller: emailController,
                      // autocorrect: false,
                      // autofocus: true,
                      // autofillHints: false,
                      decoration: InputDecoration(
                        fillColor: AppColors().textFillColor,
                        filled: true,
                        // enabled: !isPasswordFieldVisible,
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
                          AppColors().textFieldShadow,
                          2,
                          5.0,
                          const Offset(0, 3)),
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
                                  color:
                                      obscureText ? Colors.grey : Colors.blue,
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
                              Navigator.of(context)
                                  .pushNamed("/forgot-password")
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
                          AppColors().textFieldShadow,
                          2,
                          5,
                          const Offset(0, 2)),
                      child: MaterialButton(
                        // elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: AppColors().gold,

                        onPressed: hasConnectionWrapper(
                          () async {
                            if (!userChecked) {
                              email = emailController!.text;
                              ReturnObj returnObj =
                                  await CommonFunctions().CheckUser(email!);
                              // await CommonFunctions()
                              //     .CheckUser("admin@gmail.com");
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
                              if (emailController!.text == "") {
                                return Fluttertoast.showToast(
                                    msg: "Please enter the email");
                              }
                              if (passwordController!.text == "") {
                                return Fluttertoast.showToast(
                                    msg: "Please enter Password");
                              }
                              ReturnObj returnObj = await CommonFunctions()
                      
                                  .Login(emailController!.text,
                                      passwordController!.text);
                              Fluttertoast.showToast(msg: returnObj.message);
                              if (returnObj.status) {
                                getUserRole() == "Admin"
                                    ? Navigator.pushNamed(
                                        context, "/admin-dashboard")
                                    : Navigator.pushNamed(context, "/home");
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
                                    textStyle:
                                        TextStyle(color: AppColors().white),
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
        ),
      ),
    );
  }
}
