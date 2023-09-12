import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wasel/data/local/cashHelper.dart';
import 'package:wasel/models/allCountry.dart';
import 'package:wasel/modules/login/app-cubitLogin.dart';
import 'package:wasel/modules/login/app-stateLogin.dart';
import 'package:wasel/modules/register/app-cubitRegister.dart';
import 'package:wasel/modules/register/app-stateRegister.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';

import 'verifyScreen.dart';

class EditDataScreen extends StatefulWidget {

  EditDataScreen({Key? key }) : super(key: key);

  @override
  State<EditDataScreen> createState() => _EditDataScreenState();
}

class _EditDataScreenState extends State<EditDataScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController(
      text: CashHelper.getData(key: 'phone').toString().substring(3));

  TextEditingController nameController = TextEditingController(
      text: CashHelper.getData(key: 'name'));

  TextEditingController emailController = TextEditingController(
      text: CashHelper.getData(key: 'email'));

  var phon ;

  String code = '' ;

  @override
  Widget build(BuildContext context) {


    Countries.allCountries.forEach((e) {
      if('+${CashHelper.getData(key: 'phone').toString().substring(0,3)}' == e["dial_code"])
         {
        print('cooooode ${e["dial_code"]} ${e["code"]}');
        print('tttt $code');
      setState((){
        code = e["code"]!;

      });

       }
    });

    return   BlocConsumer< AppLoginCubit, AppLoginState>(
      listener: (context , state){

        if(state is EditSuccessState )
        {

          showToast(msg: state.editModel?.msg ,
              state: ToastState.SUCCESS );



        }




      } ,
      builder: (context , state){

        AppLoginCubit cubit = AppLoginCubit.get(context);


        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
            title: Text('Edit' , style: TextStyle(
                fontSize: FontSizeManager.s15 ,
                fontWeight: FontWeightManager.semiBold
            ),),
            centerTitle: true,

          ),
          body: SafeArea(child:
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0 , vertical: 30),
              child: Column(
                children: [
                /*  Image.asset('assets/images/Logo.png',
                    // width: 150,
                    width: MediaQuery.of(context).size.width ,
                    height: 150,),*/
                  SizedBox(height: 30,),
                  Form(
                      key: formKey,
                      child: Column(children: [


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

                           initialCountryCode: '$code' ,
                          // initialCountryCode: 'SA' ,

                          onChanged: (phone) {
                            print(phone.completeNumber.substring(1));
                            phon = phone.completeNumber.substring(1)  ;

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

                      ],)),

                  ConditionalBuilder(
                    condition: state is !EditLoadingState ,
                    builder: (context)=> Padding(
                      padding: const EdgeInsets.only(top: 35.0, bottom: 60),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0xff7EC242),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: MaterialButton(onPressed: (){



                          if(formKey.currentState!.validate())
                          {
                            print('update ');


                            cubit.EditData(
                                name:nameController.text ,
                                phone: phon ?? CashHelper.getData(key: 'phone') ,
                                email:  emailController.text);


                          }


                        } , child: Text('update',
                          style: TextStyle(
                            color: Colors.white ,
                            fontWeight: FontWeightManager.semiBold ,
                            fontFamily: fontFamily ,
                            fontSize: FontSizeManager.s18 ,
                          ),  ),),
                      ),
                    ) ,
                    fallback: (context)=> Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),

                      child: CircularProgressIndicator(),
                    ) ,
                  ),



                ],),
            ),
          )),
        );
      },
    )
    ;
  }
}
