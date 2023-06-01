import 'package:flutter/material.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import 'successScreen.dart';

class VerifyScreen extends StatefulWidget {
  final String? phoneNum ;

  VerifyScreen({Key? key , this.phoneNum }) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  // var formKey = GlobalKey<FormState>();
  bool _onEditing = true;
  String? _code;

  // TextEditingController phoneController = TextEditingController();

  // TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('777777777777777777 '+widget.phoneNum!);

    return  Scaffold(
      body: SafeArea(child:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0 , vertical: 30),
          child: Column(
            children: [
              Image.asset('assets/images/Logo.png',
                // width: 150,
                width: MediaQuery.of(context).size.width ,
                height: 150,),

              Text(verify ,
                  textAlign: TextAlign.center , style: TextStyle(
                  fontWeight: FontWeightManager.regular ,
                  fontFamily: fontFamily ,
                  fontSize: FontSizeManager.s18 ,
                  color: defColor ), ),

              Text(widget.phoneNum! ,style: TextStyle(
                  fontWeight: FontWeightManager.regular ,
                  fontFamily: fontFamily ,
                  fontSize: FontSizeManager.s18 ,
                  color: btnColor ),),

              SizedBox(height: 20,),
              Form(
                  // key: formKey,
                  child: Column(children: [

                    VerificationCode(
                      textStyle: TextStyle(fontSize: 20.0, color: btnColor ),
                      keyboardType: TextInputType.number,
                      itemSize: 60,
                      underlineColor: gray ,
                      length: 4,
                      cursorColor: defColor ,
                      onCompleted: (String value) {
                        setState(() {
                          _code = value;
                          print('11111 '+ _code!);
                        });
                      },
                      onEditing: (bool value) {
                        setState(() {
                          _onEditing = value;

                        });
                        if (!_onEditing) FocusScope.of(context).unfocus();
                      },
                    ),
                  ],)),

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

                    Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SuccessScreen()),
                    );






                  } , child: Text('اعادة ارسال رمز التفعيل',
                    style: TextStyle(
                      color: Colors.white ,
                      fontWeight: FontWeightManager.semiBold ,
                      fontFamily: fontFamily ,
                      fontSize: FontSizeManager.s16 ,
                    ),  ),),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  Text(' 00:15 ') ,
                  SizedBox(height: 20,),

                  Text('اعادة الارسال بعد '),

              ],),

            ],),
        ),
      )),
    );
  }
}
