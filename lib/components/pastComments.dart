import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tsf/utils/commonFunctions.dart';
import 'package:tsf/utils/responses/OrdersResponse.dart';
import 'package:tsf/utils/responses/pastComments.dart';

// Future<List<String>> fetchComments(String orderId) async {
//   final response = await http.get(Uri.parse('https://yourapi.com/orders/$orderId/comments'));

//   if (response.statusCode == 200) {
//     List<dynamic> commentsJson = json.decode(response.body);
//     return commentsJson.map((comment) => comment['text'].toString()).toList();
//   } else {
//     throw Exception('Failed to load comments');
//   }
// }

Widget pastCommentDialogBox(BuildContext context, String orderId) {
  Future<ReturnObj<List<OrderPastComment>>>? futureData;
  futureData = CommonFunctions().getPastCommments(orderId);

  return FutureBuilder<ReturnObj<List<OrderPastComment>>>(
    future: futureData,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return AlertDialog(
          title: Text('Loading Comments'),
          content: CircularProgressIndicator(),
        );
      } else if (snapshot.hasError) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Failed to load comments. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      } else if (!snapshot.hasData || snapshot.data!.data!.isEmpty) {
        return AlertDialog(
          title: Text('No Comments'),
          content: Text('There are no comments for this order.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      } else {
        List<OrderPastComment> comments = snapshot.data!.data!;
        return AlertDialog(
          title: Text('Past Comments'),
          content: SingleChildScrollView(
            child: Column(
              children: comments.map((comment) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comment.text,
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    Divider(color: Colors.grey),
                  ],
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      }
    },
  );
}
