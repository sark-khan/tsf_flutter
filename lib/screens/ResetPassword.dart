import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tsf/utils/commonFunctions.dart';

class ResetPassword extends StatefulWidget {
  @override
  State createState() => _ResetPassword();
}

class _ResetPassword extends State<ResetPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Check if the screen width is more than 600 which might be a desktop browser size
          bool isDesktop = constraints.maxWidth > 600;

          // Adjust padding based on the screen size
          double padding = isDesktop ? constraints.maxWidth * 0.3 : 20;

          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (isDesktop)
                        // SizedBox(
                        //     height: constraints.maxHeight *
                        //         0.00), // Dynamic spacing
                        Container(
                          width: isDesktop
                              ? double.infinity
                              : 150, // Adjust the size based on the screen width
                          height: isDesktop ? 150 : 150,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/toppan.png"),
                                  fit: BoxFit.fill)),
                        ),
                      const SizedBox(height: 30),
                      Text(
                        'Reset Password',
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true, // Ensures the password is hidden
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: confirmPasswordController,
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true, // Ensures the password is hidden
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () async {
                          // Implement submission logic
                          if (passwordController.text ==
                              confirmPasswordController.text) {
                            ReturnObj response = await CommonFunctions()
                                .ResetPassword(passwordController.text,
                                    confirmPasswordController.text);
                            if (response.status) {
                              Navigator.of(context).pushReplacementNamed(
                                  "/reset-password-success");
                            } else {
                              Fluttertoast.showToast(msg: response.message);
                            }
                          } else {
                            Fluttertoast.showToast(
                                msg: "Please fill both fields");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
