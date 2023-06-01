import 'package:flutter/material.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';
import 'package:wasel/views/maps/mapScreen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(child:
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(

              children: [
                SizedBox(height: MediaQuery.of(context).size.height /3,),

              CircleAvatar(
                radius: 45,
                backgroundColor: btnColor,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Icon(Icons.check_circle_outline , color: Colors.white, size: 90,),

                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 15,
                            color: btnColor,

                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                    ),
                  ],
                ),
              ),
                Text(success ,
                  textAlign: TextAlign.center , style: TextStyle(
                      fontWeight: FontWeightManager.regular ,
                      fontFamily: fontFamily ,
                      fontSize: FontSizeManager.s18 ,
                      color: defColor ),),


                Padding(
                  padding: const EdgeInsets.only(top: 35.0, bottom: 60),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xff7EC242),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: MaterialButton(onPressed: (){




                        print('login');

                        Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MapScreen()),
                        );



                    } , child: Text('اختر عنوان التوصيل',
                      style: TextStyle(
                        color: Colors.white ,
                        fontWeight: FontWeightManager.semiBold ,
                        fontFamily: fontFamily ,
                        fontSize: FontSizeManager.s18 ,
                      ),  ),),
                  ),
                ),
            ],),
          ),
        )),
      ),
    );
  }
}
