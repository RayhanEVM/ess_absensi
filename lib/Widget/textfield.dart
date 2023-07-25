

// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class UserInputTextFieldWidget extends StatelessWidget {
  final TextEditingController usertextEditingController;
  final String hintText;


  UserInputTextFieldWidget(this.usertextEditingController, this.hintText, {super.key});
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 46,
      child: TextField(
        controller: usertextEditingController,
        decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(top: 15), // add padding to adjust icon
              child: Icon(Icons.people),
            ),
            alignLabelWithHint: true,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            fillColor: Colors.white54,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.only(bottom: 15),
            focusColor: Colors.white60),
      ),
    );
  }
}

class PassInputTextFieldWidget extends StatefulWidget {
  final TextEditingController passtextEditingController;
  final String hintText;

  
  PassInputTextFieldWidget(this.passtextEditingController, this.hintText, {super.key, required bool obscureText});

  @override
  State<PassInputTextFieldWidget> createState() => _PassInputTextFieldWidgetState();
}

class _PassInputTextFieldWidgetState extends State<PassInputTextFieldWidget> {
  bool _obscureText = true;

  void toggleobsecure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 46,
      child: TextField(
        controller: widget.passtextEditingController,
        obscureText: _obscureText,
        decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                top: 15), 
              child: Icon(Icons.lock),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                toggleobsecure();
              },
              child: Icon(Icons.remove_red_eye),
            ),
            alignLabelWithHint: true,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            fillColor: Colors.white54,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.only(bottom: 15),
            focusColor: Colors.white60),
            
      ),
    );
  }
}

class KoordinatTextFieldWidget extends StatelessWidget {
  final TextEditingController koordinattextEditingController;
    final String hintText;
  KoordinatTextFieldWidget(this.koordinattextEditingController, this.hintText, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 
      const EdgeInsets.symmetric(
              horizontal: 110.10,
              vertical: 5.10,
      ),
      height: 46,
      child: TextFormField(
        controller: koordinattextEditingController,
        readOnly: true,
        
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            fillColor: Colors.white54,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.only(bottom: 15, left: 45),
            focusColor: Colors.white60),
      ),
    );
  }
}

class NIKTextFieldWidget extends StatelessWidget {
  final TextEditingController niktextEditingController;
    final String hintText;
  NIKTextFieldWidget(this.niktextEditingController, this.hintText, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 
      const EdgeInsets.symmetric(
              horizontal: 40.10,
              vertical: 5.10,
      ),
      height: 46,
      child: TextFormField( 
        controller: niktextEditingController,
        readOnly: true,
        
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            fillColor: Colors.white54,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.only(bottom: 15, left: 15),
            focusColor: Colors.white60),
      ),
    );
  }
}


