import 'package:ess_app/Widget/textfield.dart';
import 'package:ess_app/controller/register_controller.dart';
import 'package:ess_app/utils/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() => runApp(const SignUpApp2());

class SignUpApp2 extends StatelessWidget {
  const SignUpApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SignUpScreen2(),
      },
    );
  }
}

class SignUpScreen2 extends StatelessWidget {
  const SignUpScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Register Menu'),
        centerTitle: true,
      ),
      body: const Center(
        child: SizedBox(
          width: 600,
          child: Card(
            child: SignUpForm2(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm2 extends StatefulWidget {
  const SignUpForm2({super.key});

  @override
  State<SignUpForm2> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm2> {
  RegisterController registerController = Get.put(RegisterController()); 
  final _confirmpasswordController = TextEditingController();
  bool _confirmobscureText = true;

  void toggleconfirmobsecure() {
    setState(() {
      _confirmobscureText = !_confirmobscureText;
    });
  }

  // ignore: prefer_final_fields
  double _formProgress = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(value: _formProgress),
          Text('Register', style: Theme.of(context).textTheme.headlineMedium),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.10,
              vertical: 5.10,
            ),
            child: NIKTextFieldWidget(
                registerController.employee_id_Controller, 'NIK'
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.10,
              vertical: 5.10,
            ),
            child: NIKTextFieldWidget(
                registerController.employee_name_Controller, 'Name'
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.10,
              vertical: 5.10,
            ),
            child: UserInputTextFieldWidget(
                registerController.usernameController, 'Username'
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.10,
              vertical: 5.10,
            ),
            child: PassInputTextFieldWidget(
                registerController.passwordController, 'Password',
                obscureText: true,
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.10,
              vertical: 5.10,
            ),
            child: TextFormField(
              controller: _confirmpasswordController,    
              obscureText: _confirmobscureText,
              decoration:  InputDecoration(
                  prefixIcon: const Padding(
                    padding:
                        EdgeInsets.only(top: 15), // add padding to adjust icon
                    child: Icon(Icons.lock),
                  ),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        toggleconfirmobsecure();
                      },
                      child: Icon(Icons.remove_red_eye),
                    ),
                  hintText: 'Confirm Password'),
            ),
          ),
         ElevatedButton(  
                onPressed: () async {
                if (_confirmpasswordController.text == registerController.passwordController.text) {
                      registerController.registrasi();
                 } else {
                  showMessage(
                        message: "Password dan Confirm Password tidak sama",
                        context: context);                     
                }
              },
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(285, 40),
                shape: const RoundedRectangleBorder()
              ),
              child: const Text('Login'),
        //  SubmitButton(
        //   onPressed: if (),
        //    onPressed: () => registerController.registrasi(),
        //   title: 'Register',
        // ),
      )],
      ),
    );
  }
}
