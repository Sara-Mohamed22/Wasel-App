
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wasel/views/onBoarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(milliseconds: 5000 ), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OnBoardingScreen()));
    });

  }
  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 300,
        width: double.infinity ,
        alignment: AlignmentDirectional.center ,

        decoration: BoxDecoration(
            color: Colors.white ,
            image: DecorationImage(
              image: AssetImage('assets/images/splash.png', ),

              fit: BoxFit.cover ,
              opacity: 1 ,


            )
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Image.asset('assets/images/Logo.png',
              // width: 150,
              width: MediaQuery.of(context).size.width ,
              height: 150,) ,


          ],
        ),
      );


  }
}
