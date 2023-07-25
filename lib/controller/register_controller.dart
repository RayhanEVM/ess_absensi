// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:convert';
import 'package:ess_app/Screens/Auth/login.dart';
import 'package:ess_app/Screens/Auth/register.dart';
import 'package:ess_app/url/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class ErrorModel{
//   String? message;
//   int? code;

//   ErrorModel({this.message, this.code});
//   ErrorModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     code = json['code'];
//   }

//   Map<String, dynamic> toJson(decode) {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = message;
//     data['code'] = code;
//     return data;
//   }
// }

class RegisterController extends GetxController{
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController employee_id_Controller = TextEditingController();
  TextEditingController employee_name_Controller = TextEditingController();


  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registrasi() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
        AppUrl.baseUrl + AppUrl.authEndPoints.register);
      Map body = {
        'employee_id': employee_id_Controller.text,
        'name': employee_name_Controller.text,
        'username': usernameController.text,
        'password': passwordController.text.trim(),

      };
      print(body);
      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);
      print(response.statusCode);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(response.body);
        if (json['code'] == 200) {
        // var token = json ['data']['token'];
        // print(token);
        // final SharedPreferences? prefs = await _prefs;

        // await prefs?.setString('token', token);
        employee_id_Controller.clear();
        employee_name_Controller.clear();
        usernameController.clear();
        passwordController.clear();
        Get.to(() => LoginPage());

         } else if (json['code'] == 409) {
          print(response.body);
          throw jsonDecode(response.body)['message'];
        }
      } else {
      //  Get.to(() => SignUpApp());
        print('ini dari else');
        print(response.statusCode);
        print(response.body);
        throw jsonDecode(response.body)["message"] ?? "Uknown Error";
        
      }
    }catch (Error){
      Get.back();
      showDialog(context: Get.context!, builder: (context){
        return SimpleDialog(
          title: Text('Error'),
          contentPadding: EdgeInsets.all(20),
          children: [Text(Error.toString())],
        );
      });
    }
  }

  Future<void> cekniklah() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
        AppUrl.baseUrl + AppUrl.authEndPoints.ceknik);
      Map body = {
        'employee_id': employee_id_Controller.text,


      };

      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);
      print(response.statusCode);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json['code']);
        print(response.statusCode);
        print(response.body);
        if (json['code'] == 200) {
        var nama = json ['data']['employee_name'];
        employee_name_Controller.text = nama;
        // var token = json ['data'];
        // print(token);

  
        Get.to(() => SignUpApp2());

         } else if (json['code'] == 404) {
          throw jsonDecode(response.body)['message'];
        }
      } else {
        print(response.body);
        print(response.statusCode);
        Get.to(() => LoginPage());
        throw jsonDecode(response.body)["message"] ?? "Maaf NIK tidak ditemukan";
      }
    }catch (Error){
      // Get.to(() => LoginPage());
      showDialog(context: Get.context!, builder: (context){
        return SimpleDialog(
          title: Text('Error'),
          contentPadding: EdgeInsets.all(20),
          children: [Text(Error.toString())],
        );
      });
    }
  }
  Future<void> getdatakaryawan() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
        AppUrl.baseUrl + AppUrl.authEndPoints.register);
      Map body = {
        'employee_id': employee_id_Controller.text,
        'username': usernameController.text,
        'password': passwordController.text.trim(),

      };

      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);
      print(response.statusCode);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(response.body);
        if (json['code'] == 200) {
        // var token = json ['data']['token'];
        // print(token);
        // final SharedPreferences? prefs = await _prefs;

        // await prefs?.setString('token', token);
        // employee_id_Controller.clear();
        // usernameController.clear();
        // passwordController.clear();

         } else if (json['code'] == 1) {
          print(response.body);
          throw jsonDecode(response.body)['message'];
        }
      } else {
        print('ini dari else');
        print(response.statusCode);
        throw jsonDecode(response.body)["message"] ?? "Uknown Error";
        
      }
    }catch (Error){
      Get.back();
      showDialog(context: Get.context!, builder: (context){
        return SimpleDialog(
          title: Text('Error'),
          contentPadding: EdgeInsets.all(20),
          children: [Text(Error.toString())],
        );
      });
    }
  }
}


