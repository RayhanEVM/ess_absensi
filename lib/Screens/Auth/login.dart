import 'package:ess_app/Screens/Auth/ceknik.dart';
import 'package:ess_app/Widget/button.dart';
import 'package:ess_app/controller/auth_Controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ess_app/Widget/textfield.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthController loginController = Get.put(AuthController()); 

  var isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                  color: Color.fromARGB(255, 2, 69, 125),
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),

            const Text(
              'Enter Username and Password to Continue',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  ),
            ),

            const SizedBox(height: 20.0),
            Image.asset('images/login.png'),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 50.10,
                vertical: 5.10,
              ),
              
              child: UserInputTextFieldWidget(
                loginController.usernameController, 'Username'
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 50.10,
                vertical: 5.10,
              ),

              child: PassInputTextFieldWidget(
                loginController.passwordController, 'Password',
                obscureText: true,
              ),
            ),

            const SizedBox(height: 30.0),
          SubmitButton(
          onPressed: () => loginController.loginlah(),
          title: 'Login',
            ),
            
              
              
            const SizedBox(height: 30.0),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 15,
                    ),
                children: [
                  const TextSpan(text: "Register "),
                  TextSpan(
                    style: const TextStyle(
                    color: Color.fromARGB(255, 2, 69, 125),
                    fontSize: 15,
                    ),
                      text: "Disini!",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const SignUpScreen();
                              },
                            ),
                          );
                        })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}