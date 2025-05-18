import 'dart:async';

import 'package:flutter/material.dart';
import 'package:machine_project_2/widget/Uihelper.dart';
import 'package:machine_project_2/domain/constant/appcolors.dart';
import 'package:machine_project_2/Repository/screens/Loginpage/loginscreen.dart';


class Splashscreen extends StatefulWidget{
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>(Loginscreen())));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.scaffoldbackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 700,
              child:  UiHelper.customImage(img: "image1.jpg", width: 700, height: 700),
            ),
            SizedBox(
              height: 100,
              child: UiHelper.customImage(img: "image2.jpg", width: 100, height: 100),
            ),
          ],
        ),
      ),
    );
  }
}