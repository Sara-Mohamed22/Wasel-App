import 'package:flutter/material.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';

import 'loginScreen2.dart';
import 'registerScreen3.dart';

class LoginScreen1 extends StatelessWidget {
  const LoginScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          Image.asset('assets/images/Logo.png',
            // width: 150,
            width: MediaQuery.of(context).size.width ,
            height: 150,),

           Text(loginString , style: TextStyle(
               fontWeight: FontWeightManager.regular ,
               fontFamily: fontFamily ,
               fontSize: FontSizeManager.s18 ,
           color: defColor ),),

          SizedBox(height: 30,),

          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Color(0xff7EC242),
                borderRadius: BorderRadius.circular(20)
            ),
            child: MaterialButton(onPressed: (){

                Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen2()),
                );


            } , child: Text('تسجيل الدخول',
              style: TextStyle(
                  color: Colors.white ,
                  fontWeight: FontWeightManager.semiBold ,
                  fontFamily: fontFamily ,
                  fontSize: FontSizeManager.s18 ,
              ),  ),),
          ),

          SizedBox(height: 30,),

          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color:defborderColor),
                borderRadius: BorderRadius.circular(20)
            ),
            child: MaterialButton(onPressed: (){

              Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );


            } , child: Text(regString,
              style: TextStyle(
                color: defborderColor ,
                fontWeight: FontWeightManager.semiBold ,
                fontFamily: fontFamily ,
                fontSize: FontSizeManager.s18 ,
              ),  ),),
          ),

        ],),
      )),
    );
  }
}
