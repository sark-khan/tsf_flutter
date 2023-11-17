import 'package:flutter/material.dart';

class ResetPasswordSuccess extends StatefulWidget {
  const ResetPasswordSuccess({super.key});

  @override
  State createState() => _ResetPasswordSuccess();
}

class _ResetPasswordSuccess extends State<ResetPasswordSuccess> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Colors.green, // Tick mark icon
            ),
            SizedBox(height: 24),
            Text(
              'Password reset successfully',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
