// // ignore_for_file: avoid_print, prefer_const_constructors

// import 'dart:convert';

// import 'package:ess_app/url/url.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class CheckOutController extends GetxController{
//   TextEditingController latController = TextEditingController();
//   TextEditingController longController = TextEditingController();


//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

//   Future<void> cekoutlah() async {
//     try {
//       var headers = {'Content-Type': 'application/json'};
//       var url = Uri.parse(
//         AppUrl.baseUrl + AppUrl.authEndPoints.checkout);
//       Map body = {
//         'Latitude': latController.text,
//         'Longtitude': longController.text,

//       };

//       http.Response response =
//       await http.post(url, body: jsonEncode(body), headers: headers);
//       print(response.statusCode);

//       if (response.statusCode == 201) {
//         // print(response.body);
//         final json = await jsonDecode(response.body);
//         print(json['code']);
//         if (json['code'] == 201) {
//         var token = json ['data']['token'];
        
//         print(token);
//         final SharedPreferences? prefs = await _prefs;

//         await prefs?.setString('token', token);
//         latController.clear();
//         longController.clear();
//         Get.to(() => MainMenu());
        

//         } else if (json['code'] == 1) {
//           throw jsonDecode(response.body)['message'];
//         }
//       } else {
//         throw jsonDecode(response.body)["message"] ?? "Uknown Error";
//       }
//     }catch (Error){
//       Get.back();
//       showDialog(context: Get.context!, builder: (context){
//         return SimpleDialog(
//           title: Text('Error'),
//           contentPadding: EdgeInsets.all(20),
//           children: [Text(Error.toString())],
//         );
//       });
//     }
//   }

// }