import 'package:ess_app/Screens/Auth/login.dart';
import 'package:ess_app/Widget/button.dart';
import 'package:ess_app/Widget/textfield.dart';
import 'package:ess_app/controller/register_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';


void main() => runApp(const SignUpApp());

class SignUpApp extends StatelessWidget {
  const SignUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const SignUpScreen(),
      },
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: const Text('Register Menu'),
        centerTitle: true,
      ),
      body: const Center(
        child: SizedBox(
          width: 600,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  RegisterController ceknikController = Get.put(RegisterController()); 
  

  // ignore: prefer_final_fields
  double _formProgress = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Center(
             child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                      ),
                  children: [
                    const TextSpan(text: "Jika sudah mempunyai akun maka klik "),
                    TextSpan(
                      style: const TextStyle(
                      color: Color.fromARGB(255, 2, 69, 125),
                      fontSize: 15,
                      ), // tap disini crack ad
                        text: "Disini!",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return  const LoginPage();
                                },
                              ),
                            );
                          })
                  ],
                ),
              ),
           ),
          LinearProgressIndicator(value: _formProgress),
          Text('Register', style: Theme.of(context).textTheme.headlineMedium),
          Padding(
            padding: const  EdgeInsets.symmetric(
                horizontal: 50.10,
                vertical: 5.10,
              ),
            child: UserInputTextFieldWidget(
                ceknikController.employee_id_Controller, 'NIK'
              ),
          ),
          SubmitButton(
          onPressed: () => ceknikController.cekniklah(),
          title: 'Register',
        ),
        ],
      ),
    );
  }
}