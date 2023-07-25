import 'package:ess_app/Style/Colors.dart';
import 'package:ess_app/controller/auth_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileMenu extends StatefulWidget {
  const ProfileMenu({super.key});

  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  AuthController loginController = Get.put(AuthController()); 
  showAlertDialog(BuildContext context) {

  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed:  () {},
  );
  Widget continueButton = TextButton(
    child: Text("Continue"),
    onPressed: () {
        loginController.logOut(context);
      },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text("apakah anda ingin logout?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Profile'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.2,
            vertical: 5.0,
          ),
          child: Center(
            child: Wrap(
              spacing: 100,
              children: [  
                const TextField(
                  readOnly: true,
                  scrollPadding: EdgeInsets.all(50),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nama',
                  ),
                ),
                const SizedBox(height: 45.0),

                const TextField(
                  readOnly: true,
                  scrollPadding: EdgeInsets.all(50),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Alamat',
                  ),
                ),
                const SizedBox(height: 45.0),
                 const TextField(
                  readOnly: true,
                  scrollPadding: EdgeInsets.all(50),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Kantor'
                  ),
                ),
                const SizedBox(height: 45.0),
                const TextField(
                  readOnly: true,
                  scrollPadding: EdgeInsets.all(50),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Role',
                  ),
                ),
                //padding: EdgeInsets.only(left: 25),
                const SizedBox(height: 35.0),
                 ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: grey,
                    foregroundColor: white,
                    minimumSize: const Size(450, 40),
                  ),
                  child: const Text('ambil data'),
                ),
                ElevatedButton(
                  onPressed: () {
                     Widget cancelButton = TextButton(
                          child: Text("Cancel"),
                          onPressed:  () {
                            Get.back();
                          },
                        );
                        Widget continueButton = TextButton(
                          child: Text("Continue"),
                          onPressed: () {
                              loginController.logOut(context);
                            },
                        );

                        // set up the AlertDialog
                        AlertDialog alert = AlertDialog(
                          title: Text("Perhatian"),
                          content: Text("apakah anda ingin logout?"),
                          actions: [
                            cancelButton,
                            continueButton,
                          ],
                        );

                        // show the dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          },
                        );
                      },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: grey,
                    foregroundColor: white,
                    minimumSize: const Size(450, 40),
                  ),
                  child: const Text('Logout'),
                ),
              ],
            ),
          ),
        ),
      ]),

      
    );
  }
}