

import 'package:flutter/material.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';
import 'package:wasel/views/homeScreen/homeScreen.dart';

class SendOrderScreen extends StatelessWidget {
  const SendOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Image.asset('assets/images/bag.png',),

                SizedBox(height: 10,),

                   createString(
                    title: 'Send Request Successfully',
                    color: btnColor,
                   weight: FontWeightManager.bold ,
                     fontSize: 16
                   ),

                SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: [
                    createString(
                        title: 'Request Number ',
                        color: defColor,
                        weight: FontWeightManager.semiBold ,
                        fontSize: 13
                    ),
                    createString(
                        title: '# ${12} ',
                        color: btnColor,
                        weight: FontWeightManager.bold,
                        fontSize: 18
                    ),

                    createString(
                        title: 'send sms successfully !',
                        color: defColor,
                        weight: FontWeightManager.semiBold ,
                        fontSize: 13
                    ),
                  ],
                ),

                SizedBox(height: 10,),

                createString(
                    title: 'You can confirm your request \n from your request\'s page. ',
                    color: defColor,
                    weight: FontWeightManager.semiBold ,
                    fontSize: 14
                ),


                SizedBox(height: 30,),

                Container(
                  width: MediaQuery.of(context).size.width/2.2,
                  height: 40,
                  decoration: BoxDecoration(
                      color: defColor,
                      // border: Border.all(),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: MaterialButton(onPressed: (){

                    // Navigator.pushReplacement(context,
                    //   MaterialPageRoute(builder: (context) => MapScreen()),
                    // );

                    print('my orders');

                  } , child: Text('My Orders',
                    style: TextStyle(
                      color: Colors.white ,
                      fontWeight: FontWeightManager.semiBold ,
                      fontFamily: fontFamily ,
                      fontSize: FontSizeManager.s15 ,
                    ),  ),),
                ),

                SizedBox(height: 20,),

                Container(
                  width: MediaQuery.of(context).size.width/2.2,
                  height: 40,
                  decoration: BoxDecoration(
                      // color: defColor,
                      border: Border.all(color: btnColor),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: MaterialButton(onPressed: (){

                    Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );

                    print('back to home ');

                  } , child: Text('Go To Home',
                    style: TextStyle(
                      color: btnColor ,
                      fontWeight: FontWeightManager.semiBold ,
                      fontFamily: fontFamily ,
                      fontSize: FontSizeManager.s15 ,
                    ),  ),),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
