import 'dart:convert';
import 'dart:html';
import 'dart:js_interop';

import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:tsf/utils/Storage.dart';
import 'package:tsf/utils/responses/CheckUser.dart';
import 'package:tsf/utils/responses/LoginResponse.dart';
import 'package:tsf/utils/responses/OrdersResponse.dart';

class CommonFunctions {
  static Dio dio = Dio();
  static String APIURL = "http://192.168.10.10:2000";
  static var headers = {'Content-Type': 'application/json'};

  static Future<dynamic> Login(String email, String password) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var data =
          json.encode({"accountNumberOrEmail": email, "password": password});
      var dio = Dio();
      var response = await dio.request(
        '$APIURL/api/auth/login',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        Storage.addJwtToken(loginResponse.token);
        print(Storage.getJwtToken());
        return ReturnObj(status: true, message: "Login Successfull");
      } else {
        return ReturnObj(status: false, message: "Credintials did not match");
      }
    } catch (error) {
      print("error is $error");
      return ReturnObj(status: false, message: "Login Unsuccessfull");
    }
  }

  static Future<ReturnObj> CheckUser(String accountNumberOrEmail) async {
    try {
      if (accountNumberOrEmail.isEmpty) {
        return ReturnObj(message: "Please Enter the Email", status: false);
      }
      var headers = {
        'Content-Type': 'application/json',
      };
      var bodyData =
          json.encode({"accountNumberOrEmail": accountNumberOrEmail});
      var response = await dio.request(
        "$APIURL/api/auth/check-user",
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: bodyData,
      );
      if (response.statusCode == 200) {
        CheckUserResponse _checkUserResponse =
            CheckUserResponse.fromJson(response.data);
        if (_checkUserResponse.accountRejected) {
          return ReturnObj(message: "Account is ", status: false);
        }
        if (_checkUserResponse.activationRequested) {
          return ReturnObj(status: false, message: "Activation Request Sent");
        }
        if (_checkUserResponse.isRequestSent) {
          return ReturnObj(status: false, message: "Waiting for Approval");
        }
        if (_checkUserResponse.insertNewPassword) {
          return ReturnObj(message: "Insert New Message", status: true);
        }
        return ReturnObj(status: true, message: "Enter Password");
      } else if (response.statusCode == 400) {
        return ReturnObj(message: "Bad Request", status: false);
      } else {
        if (response.statusCode == 404) {
          return ReturnObj(message: "User Not Found", status: false);
        }
        return ReturnObj(status: false, message: "User Does not exists");
      }
    } catch (error) {
      print("error inn CheckUser $error");
      return ReturnObj(status: false, message: "Login UnSuccessfull");
    }
  }

  Future<dynamic> getOrders() async {
    String token = Storage.getJwtToken();
    // var headers = {'token': token, 'Content-Type': 'application/json'};
    headers['token'] = token;
    // var headers = {
    //   'token':
    //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhcmlrLnNhay5raGFuQGdtYWlsLmNvbSIsIm5hbWUiOiJzYXJpa19sb2NhbCIsInJvbGUiOiJVc2VyIiwidXNlcklkIjoiNjUyM2E2ZGMxNTYwODEyMTg0MGRkMmZlIiwiYWNjb3VudE51bWJlciI6IjEyMzQ1Njc4OTAiLCJpYXQiOjE2OTgzMDM3ODN9.vLxV-JhTIQOF50YAeqtNQ54W0yuEre1ktZu1AchfeWU',
    //   'Content-Type': 'application/json'
    // };
    var data = json.encode({"limit": "123", "skip": "0"});
    var response = await dio.request(
      '$APIURL/api/order/get-order-list',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      Orders ordersMap = Orders.fromJson(response.data);
      print(ordersMap.orders);
      print(">>>>>>>>>${getUserType()}");
      return {
        ordersMap.orders,
      };
    } else {
      return {};
    }
  }
}

class ReturnObj {
  bool status;
  String message;
  ReturnObj({required this.message, required this.status});
}

getUserType() => Jwt.parseJwt("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhcmlrLnNhay5raGFuQGdtYWlsLmNvbSIsIm5hbWUiOiJzYXJpa19sb2NhbCIsInJvbGUiOiJVc2VyIiwidXNlcklkIjoiNjUyM2E2ZGMxNTYwODEyMTg0MGRkMmZlIiwiYWNjb3VudE51bWJlciI6IjEyMzQ1Njc4OTAiLCJpYXQiOjE2OTkzNTM0Njh9.P_3Ta5DBqQ_ZYsW3WOhwTBjhMyIdJ7FjKHyaIAX_bCQ")["role"];

