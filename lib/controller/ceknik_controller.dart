// // ignore_for_file: avoid_print, prefer_const_constructors

// import 'dart:convert';
// import 'package:ess_app/Screens/Auth/login.dart';
// import 'package:ess_app/Screens/Auth/register.dart';
// import 'package:ess_app/url/url.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;


// class CekNikController extends GetxController{
//   TextEditingController employee_id_Controller = TextEditingController();



  

//   Future<void> cekniklah() async {
//     try {
//       var headers = {'Content-Type': 'application/json'};
//       var url = Uri.parse(
//         AppUrl.baseUrl + AppUrl.authEndPoints.ceknik);
//       Map body = {
//         'employee_id': employee_id_Controller.text,


//       };

//       http.Response response =
//       await http.post(url, body: jsonEncode(body), headers: headers);
//       print(response.statusCode);

//       if (response.statusCode == 200) {
//         final json = jsonDecode(response.body);
//         print(json['code']);
//         if (json['code'] == 20) {
//         // var token = json ['data'];
//         // print(token);

//         employee_id_Controller.clear();
//         Get.to(() => SignUpApp2());

//          } else if (json['code'] == 404) {
//           throw jsonDecode(response.body)['message'];
//         }
//       } else {
//         print(response.body);
//         print(response.statusCode);
//         Get.to(() => LoginPage());
//         throw jsonDecode(response.body)["message"] ?? "Maaf NIK tidak ada didalam database";
//       }
//     }catch (Error){
//       Get.to(() => LoginPage());
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