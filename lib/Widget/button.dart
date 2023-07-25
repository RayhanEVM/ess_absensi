import 'package:flutter/material.dart';


class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const SubmitButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 40,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
            color: Colors.white.withOpacity(0.25),
            offset: const Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 1)
      ]),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(285, 40),
                shape: const RoundedRectangleBorder(),
          ),
          onPressed: onPressed,
          child: Text(title,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ))),
    );
  }
}
class LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const LogoutButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 50,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
            color: Colors.white.withOpacity(0.25),
            offset: const Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 1)
      ]),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(285, 40),
                shape: const RoundedRectangleBorder(),
          ),
          onPressed: onPressed,
          child: Text(title,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ))),
    );
  }
}

class AbsenButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const AbsenButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
            color: Colors.white.withOpacity(0.25),
            offset: const Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 1)
      ]),
      child: ElevatedButton(
        
        
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(175, 40),
   
          ),
          onPressed: onPressed,
          child: Text(title,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ))),
    );
  }
}