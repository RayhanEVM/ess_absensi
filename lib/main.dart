import 'package:ess_app/Screens/Auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const GetEssApp());
}

class GetEssApp extends StatelessWidget {
  const GetEssApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ESS Apps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}

