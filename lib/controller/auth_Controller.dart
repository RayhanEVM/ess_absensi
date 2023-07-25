// ignore_for_file: avoid_print, prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names

import 'dart:convert';
import 'package:ess_app/Screens/Auth/login.dart';
import 'package:ess_app/Screens/task/main_menu.dart';
import 'package:ess_app/url/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ErrorModel{
  String? message;


  ErrorModel({this.message});
  ErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];

  }

  Map<String, dynamic> toJson(decode) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = message;
    return data;
  }
}

var udin;
String ucup = udin.toString();
int empang = int.parse(udin);



class AuthController extends GetxController{
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginlah() async {
 
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
        AppUrl.baseUrl + AppUrl.authEndPoints.login);
      Map body = {
        'username': usernameController.text,
        'password': passwordController.text.trim(),

      };

      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        // print(response.body);
        final json = jsonDecode(response.body);
        print(json['code']);
        if (json['code'] == 200) {
        print(json ['data']);

        if (json ['data'] != null){
          var token = json ['data']['token'];
          
          print(token);
          print('ini token lho');

  
          final SharedPreferences prefs = await _prefs;
          await prefs.setString('token', token);

          udin = token;
          print(udin);
          print('ini udin');

          usernameController.clear();
          passwordController.clear();
          Get.to(() => MainMenu());
        }else{
          throw jsonDecode(response.body)['message'];
        }
        
        

        }
         else if (json['code'] == 1) {
          throw jsonDecode(response.body)['message'];
        }
      } else {
        throw jsonDecode(response.body)["message"] ?? "Uknown Error";
      }
   
    }catch (Error){
      // Get.back();
      showDialog(context: Get.context!, builder: (context){
        return SimpleDialog(
          title: Text('Error'),
          contentPadding: EdgeInsets.all(20),
          children: [Text(Error.toString())],
        );
      });
    }
  }

  //cekin
    Future<void> cekinlah() async {
    try {
      var headers = {
        // 'Authorization' : 'Bearer '+ empang, 
        'Authorization' : 'Bearer '+ udin, 
        'Accept' : 'application/json',
        'Content-Type': 'application/json',
        'Charset': 'utf-8'
      };

      var url = Uri.parse(
        AppUrl.baseUrl + AppUrl.authEndPoints.checkin);

      Map body = {
        'longitude': longController.text,
        'latitude': latController.text,
      };
      
      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);
      print(response.statusCode);
      print(response.body);

      // print(json.decode(response.body));
      if (response.statusCode == 200) {
        final json = await jsonDecode(response.body);
        
        print(json['code']);
        latController.clear();
        longController.clear();
        
        Get.to(() => MainMenu());
        showDialog(context: Get.context!, builder: (context){
        return SimpleDialog(
          title: Text('Attention'),
          contentPadding: EdgeInsets.all(20),
          children: [Text(jsonDecode(response.body)["message"])],
        );
      });
        

        
      }else if (response.statusCode == 1) {
          throw jsonDecode(response.body)['message'];
        }
      else {
        print(response.statusCode);
        print(udin);
        print(response);
        showDialog(context: Get.context!, builder: (context){
        return SimpleDialog(
          title: Text('Alert'),
          contentPadding: EdgeInsets.all(20),
          children: [Text(jsonDecode(response.body)["message"])],
        );
      });

      }
    }catch (Error){

      showDialog(context: Get.context!, builder: (context){
        return SimpleDialog(
          title: Text('Error'),
          contentPadding: EdgeInsets.all(20),
          children: [Text(Error.toString())],
        );
      });
    }
  }
  //cekout
  //  Future<void> cekoutlah() async {
  //   try {
  //     var headers = {
  //       // 'Authorization' : 'Bearer $udin', 
  //       'Authorization' : 'Bearer ' +ucup, 
  //       'Accept' : 'application/json',
  //       'Content-Type': 'application/json',
  //       'Charset': 'utf-8' 
  //       };
  //     var url = Uri.parse(
  //       AppUrl.baseUrl + AppUrl.authEndPoints.checkout);
  //     Map body = {
  //       'Longtitude': longController.text,
  //       'Latitude': latController.text,


  //     };

  //     http.Response response =
  //     await http.post(url, body: jsonEncode(body), headers: headers);
  //     print(response.statusCode);
  //     print(body);

  //     if (response.statusCode == 200) {
  //       // print(response.body);
  //       final json = await jsonDecode(response.body);
  //       print(json['code']);

  //       latController.clear();
  //       longController.clear();
  //       Get.to(() => Absen());
  //       } else {
  //           print(response.statusCode);
  //           print(ucup);
  //           print(response);
  //         throw jsonDecode(response.body)["message"] ?? "Uknown Error";
  //     }
  //     }catch (Error){
  //     Get.back();
  //     showDialog(context: Get.context!, builder: (context){
  //       return SimpleDialog(
  //         title: Text('Error'),
  //         contentPadding: EdgeInsets.all(20),
  //         children: [Text(Error.toString())],
  //       );
  //     });
  //   }
  // }
  void logOut(BuildContext context) async {
    final value = await _prefs;

    value.clear();
    Get.to(() => LoginPage());
  }
}
