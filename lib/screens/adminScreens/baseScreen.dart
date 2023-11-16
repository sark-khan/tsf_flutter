// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tsf/utils/AppConstants.dart';
import 'package:tsf/utils/commonFunctions.dart';

import '../../utils/stateController.dart';

// ignore: must_be_immutable
class BaseUI extends StatelessWidget {
  Widget child;
  String headline;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _roleController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  BaseUI({required this.child, required this.headline, super.key});
  StateController stateController = Get.find<StateController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[300],
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width < 500 ? 20 : 220,
            top: 50,
            right: 20),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    headline,
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      stateController.headline.value == "Sub Admins"
                          ? MaterialButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => new AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          content: Builder(
                                            builder: (context) {
                                              var height =
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height;
                                              var width = MediaQuery.of(context)
                                                  .size
                                                  .width;

                                              return Container(
                                                height: height - 200,
                                                width: width - 800,
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          IconButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              icon: Icon(
                                                                Icons
                                                                    .close_rounded,
                                                              )),
                                                        ],
                                                      ),
                                                      Form(
                                                        key: _formKey,
                                                        child: Wrap(
                                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.all(12.0),
                                                              child: Text("Add Sub-Admin", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold,fontSize: 30),),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(12),
                                                              child: TextFormField(
                                                                controller:
                                                                    _emailController,                                   
                                                                     decoration: InputDecoration(
                                                                                    fillColor: AppColors().textFillColor,
                                                                                    filled: true,
                                                                                    hintText: TextConstants().EMAIL,
                                                                                    prefixIcon: const Padding(
                                                                                      padding: EdgeInsets.all(15.0),
                                                                                      child: Icon(Icons.email),
                                                                                    ),
                                                                                    border: OutlineInputBorder(
                                                                                        borderRadius: BorderRadius.circular(10)),
                                                                                  ),
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                          null ||
                                                                      value
                                                                          .isEmpty) {
                                                                    return 'Email is required';
                                                                  }
                                                                  return null;
                                                                },
                                                              ),
                                                            ),
                               
                                                            Padding(
                                                              padding: const EdgeInsets.all(12),
                                                              child: TextFormField(
                                                                controller:
                                                                    _roleController,
                                                                                                                      
                                                                       decoration: InputDecoration(
                                                                                    fillColor: AppColors().textFillColor,
                                                                                    filled: true,
                                                                                    hintText: "ROLE",
                                                                                    prefixIcon: const Padding(
                                                                                      padding: EdgeInsets.all(15.0),
                                                                                      child: Icon(Icons.email),
                                                                                    ),
                                                                                    border: OutlineInputBorder(
                                                                                        borderRadius: BorderRadius.circular(10)),
                                                                                  ),
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                          null ||
                                                                      value
                                                                          .isEmpty) {
                                                                    return 'Role is required';
                                                                  }
                                                                  return null;
                                                                },
                                                              ),
                                                            ),
                                                            
                                                            Padding(
                                                              padding: const EdgeInsets.all(12),
                                                              child: TextFormField(
                                                                controller:
                                                                    _nameController,
                                                                    decoration: InputDecoration(
                                                                                    fillColor: AppColors().textFillColor,
                                                                                    filled: true,
                                                                                    hintText: "Name",
                                                                                    prefixIcon: const Padding(
                                                                                      padding: EdgeInsets.all(15.0),
                                                                                      child: Icon(Icons.email),
                                                                                    ),
                                                                                    border: OutlineInputBorder(
                                                                                        borderRadius: BorderRadius.circular(10)),
                                                                                  ),
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                          null ||
                                                                      value
                                                                          .isEmpty) {
                                                                    return 'Name is required';
                                                                  }
                                                                  return null;
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(12),
                                                              child: TextFormField(
                                                                controller:
                                                                    _passwordController,
                                                                      decoration: InputDecoration(
                                                                                    fillColor: AppColors().textFillColor,
                                                                                    filled: true,
                                                                                    
                                                                                    hintText: TextConstants().PASSWORD,
                                                                                    prefixIcon: const Padding(
                                                                                      padding: EdgeInsets.all(15.0),
                                                                                      child: Icon(Icons.email),
                                                                                    ),
                                                                                    border: OutlineInputBorder(
                                                                                        borderRadius: BorderRadius.circular(10)),
                                                                                  ),
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                          null ||
                                                                      value
                                                                          .isEmpty) {
                                                                    return 'Password is required';
                                                                  }
                                                                  return null;
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(12),
                                                              child: ElevatedButton(
                                                                onPressed: () async {
                                                                  if (_formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                    // Submit the form data
                                                                    print(
                                                                        'Email: ${_emailController.text}');
                                                                    print(
                                                                        'Role: ${_roleController.text}');
                                                                    print(
                                                                        'Name: ${_nameController.text}');
                                                                    print(
                                                                        'Password: ${_passwordController.text}');

                                                                      ReturnObj res =   await CommonFunctions().AddSubAdmin(_emailController.text, _passwordController.text, _nameController.text);
                                                                       Fluttertoast.showToast(msg: res.message);
                                                                      if(res.status){
                                                                        _passwordController.text = '';
                                                                       return Navigator.of(context).pop();
                                                                      }
                                                                  }
                                                                },
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(2.0),
                                                                  child: const Text(
                                                                      'Submit', style: TextStyle(color: Colors.white, fontSize: 30),),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ]),
                                              );
                                            },
                                          ),
                                        ));
                              },
                              color: Colors.blueGrey,
                              height: 50,
                              child: Text(
                                "Add Sub-Admin",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          : stateController.headline.value == "Notifications"
                              ? Container()
                              : InkWell(
                                  onTap: () {
                                    stateController.headline.value =
                                        'Notifications';
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Stack(
                                        children: [
                                          const Icon(
                                            Icons.notifications,
                                            size: 40,
                                            color: Color.fromARGB(117, 2, 2, 2),
                                          ),
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red,
                                              ),
                                              child: Text(
                                                '3', // Replace with dynamic count variable
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Notifications",
                                        style:
                                            TextStyle(color: Colors.blueGrey),
                                      )
                                    ],
                                  ),
                                ),
                      InkWell(
                        onTap: () {
                          // Navigator.of(context).pushNamed("/login");
                          // Storage.clearUser();
                          print(stateController.headline.value);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30.0, top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: IconButton(
                                    splashColor: Colors.blueGrey,
                                    onPressed: () {
                                      print(stateController.headline.value);
                                      //             Navigator.of(context).pushNamed("/login");
                                      // Storage.clearUser();
                                    },
                                    icon: const Icon(
                                      Icons.login_outlined,
                                      color: Color.fromARGB(117, 2, 2, 2),
                                      size: 40,
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Logout",
                                style: TextStyle(color: Colors.blueGrey),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: child,
              ),
              Divider()
            ]),
      ),
    );
  }
}
