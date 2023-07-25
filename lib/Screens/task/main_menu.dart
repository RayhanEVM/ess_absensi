import 'package:ess_app/Screens/task/absen.dart';
import 'package:ess_app/Screens/task/profile.dart';
import 'package:ess_app/Style/Colors.dart';
import 'package:flutter/material.dart';



class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int currentIndex = 0;

  List<IconData> navigationIcon = [
    Icons.home,
    Icons.person,

  ];


  
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
      resizeToAvoidBottomInset: false,
          
          body: IndexedStack(
            index: currentIndex,
            children: [
              Absen(),
              ProfileMenu(),
            ],
          )  ,
          bottomNavigationBar: Container(
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(40)),
              // BoxShadow({
              //   Color color: black,
              //   double blurRadius: 10,
              //   }) 
            ),
          
            child: ClipRRect(
              child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i = 0; i < navigationIcon.length; i++)... <Expanded>{
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        currentIndex = i;
                      });
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            navigationIcon[i],
                            color: i == currentIndex ? blue : Colors.grey,
                            size: i == currentIndex ? 30 : 26,
                    ),
                          i == currentIndex ? Container(
                            height: 3,
                            width: 20,
                            color: black,
                    ) : const SizedBox(),
                        ],
                      ),
                  
                    
                    ),
                  )
                  )
                }
              ],
              ),
            ),
            ),
       );
    }
}