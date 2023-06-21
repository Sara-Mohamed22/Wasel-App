
import 'package:flutter/material.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';

import 'sendOrderScreen.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,

            children: [

              Stack(
                alignment: AlignmentDirectional.center ,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: btnColor,

                  ),

                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 100, )

                ],
              ),

              SizedBox(height: 20,),

              createString(
                  title: 'active account successfully',
                  color: defColor ,
                  weight: FontWeightManager.semiBold,
                  fontSize: 18,

              ),

              SizedBox(height: 20,),

              Container(
                width: MediaQuery.of(context).size.width/1.5,
                height: 40,
                decoration: BoxDecoration(
                    color: btnColor,
                    // border: Border.all(),
                    borderRadius: BorderRadius.circular(50)
                ),
                child: MaterialButton(onPressed: (){

                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SendOrderScreen()),
                  );

                  print('delivery address');

                } , child: Text('Select delivery address',
                  style: TextStyle(
                    color: Colors.white ,
                    fontWeight: FontWeightManager.semiBold ,
                    fontFamily: fontFamily ,
                    fontSize: FontSizeManager.s12 ,
                  ),  ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
