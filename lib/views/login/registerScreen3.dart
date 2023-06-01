import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';

import 'verifyScreen.dart';

class RegisterScreen extends StatelessWidget {

   RegisterScreen({Key? key }) : super(key: key);

  var formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
   TextEditingController nameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   var phon ;

  @override
  Widget build(BuildContext context) {
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
              Text(log3 , style: TextStyle(
                  fontWeight: FontWeightManager.regular ,
                  fontFamily: fontFamily ,
                  fontSize: FontSizeManager.s18 ,
                  color: btnColor ),),
              SizedBox(height: 20,),
              Form(
                  key: formKey,
                  child: Column(children: [

                    /*    TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  style: TextStyle(
                    color: defColor ,
                    fontFamily: fontFamily ,
                    fontWeight: FontWeightManager.medium ,
                    fontSize: FontSizeManager.s18
                  ),
                  decoration: InputDecoration(
                    hintText: 'رقم المحمول' ,
                    hintStyle: TextStyle(
                      color: gray ,
                      fontFamily: fontFamily,
                      fontSize: FontSizeManager.s15 ,
                      fontWeight: FontWeightManager.light
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: gray)
                    ),


                  ),

                  validator: (value)=> value!.isEmpty ? 'Enter your phone number , please' : null ,


                ), */


                    IntlPhoneField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      controller: phoneController,
                      style: TextStyle(
                          color: defColor ,
                          fontFamily: fontFamily ,
                          fontWeight: FontWeightManager.medium ,
                          fontSize: FontSizeManager.s18
                      ),
                      decoration: InputDecoration(
                        hintText: 'رقم المحمول' ,
                        // errorText: 'Enter valid phone number , please',
                        hintStyle: TextStyle(
                            color: gray ,
                            fontFamily: fontFamily,
                            fontSize: FontSizeManager.s15 ,
                            fontWeight: FontWeightManager.light
                        ),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: gray)
                        ),


                      ),
                      // validator: (value)=> value!.isEmpty ? 'Enter your phone number , please' : null ,

                      initialCountryCode: 'SA',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                        phon = phone.completeNumber  ;
                      },
                    ),

                    SizedBox(height: 10,),

                    TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      style: TextStyle(
                          color: defColor ,
                          fontFamily: fontFamily ,
                          fontWeight: FontWeightManager.medium ,
                          fontSize: FontSizeManager.s18
                      ),
                      decoration: InputDecoration(
                        hintText: name ,
                        hintStyle: TextStyle(
                            color: gray ,
                            fontFamily: fontFamily,
                            fontSize: FontSizeManager.s15 ,
                            fontWeight: FontWeightManager.light
                        ),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: gray)
                        ),


                      ),

                      validator: (value)=> value!.isEmpty ? 'Enter your name , please' : null ,


                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      style: TextStyle(
                          color: defColor ,
                          fontFamily: fontFamily ,
                          fontWeight: FontWeightManager.medium ,
                          fontSize: FontSizeManager.s18
                      ),
                      decoration: InputDecoration(
                        hintText: email ,
                        hintStyle: TextStyle(
                            color: gray ,
                            fontFamily: fontFamily,
                            fontSize: FontSizeManager.s15 ,
                            fontWeight: FontWeightManager.light
                        ),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: gray)
                        ),


                      ),

                      validator: (value)=> value!.isEmpty ? 'Enter your email , please' : null ,


                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      controller: passController,
                      style: TextStyle(
                          color: defColor ,
                          fontFamily: fontFamily ,
                          fontWeight: FontWeightManager.medium ,
                          fontSize: FontSizeManager.s18
                      ),
                      decoration: InputDecoration(
                        hintText: pass ,
                        hintStyle: TextStyle(
                            color: gray ,
                            fontFamily: fontFamily,
                            fontSize: FontSizeManager.s15 ,
                            fontWeight: FontWeightManager.light
                        ),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: gray)
                        ),


                      ),

                      validator: (value)=> value!.isEmpty ? 'Enter your password , please' : null ,


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

                    // Navigator.pushReplacement(context,
                    //   MaterialPageRoute(builder: (context) => LoginScreen2()),
                    // );

                    if(formKey.currentState!.validate())
                    {
                      print('login');

                      Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => VerifyScreen(phoneNum: phon ,)),
                      );

                    }


                  } , child: Text('تسجيل',
                    style: TextStyle(
                      color: Colors.white ,
                      fontWeight: FontWeightManager.semiBold ,
                      fontFamily: fontFamily ,
                      fontSize: FontSizeManager.s18 ,
                    ),  ),),
                ),
              ),

              Column(children: [
                Row(children: [
                  Expanded(child: Divider(thickness: 1, color: defborderColor , )),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(log2 ,style: TextStyle(
                        fontWeight: FontWeightManager.regular ,
                        fontFamily: fontFamily ,
                        fontSize: FontSizeManager.s15 ,
                        color: btnColor ),),
                  ),

                  Expanded(child: Divider(thickness: 1, color: defborderColor)),
                ],),

                SizedBox(height: 20,),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      InkWell(
                        onTap: ()async{
                          print('fb');

                          const url = 'https://ar-ar.facebook.com/';

                          if(await canLaunch(url)){
                            await launch(url);
                          }
                          else {
                            throw 'Could not launch $url';
                          }


                        },
                        child: FaIcon(FontAwesomeIcons.facebook ,
                          color: Color(0xFF4267B2), size: 32,),
                      ),

                      InkWell(
                        onTap: ()async{
                          print('google');
                          const url = 'https://www.google.com/';

                          if(await canLaunch(url)){
                            await launch(url);
                          }
                          else {
                            throw 'Could not launch $url';
                          }

                        },
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFFF3D00),
                          radius: 16,
                          child: Center(
                            child: FaIcon(FontAwesomeIcons.google ,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ),
                      ),

                      InkWell(
                          onTap: ()async{
                            print('github');
                            const url = 'https://github.com/';

                            if(await canLaunch(url)){
                              await launch(url);
                            }
                            else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: FaIcon(FontAwesomeIcons.github , size: 32,)),

                    ])
              ],),

            ],),
        ),
      )),
    );
  }
}
