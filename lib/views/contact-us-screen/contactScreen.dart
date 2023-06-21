import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/cubit/app-cubit.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);

    return  BlocConsumer<AppCubit , AppState>(
      listener: (context , state){},
      builder: (context , state){
        return  Scaffold(
            appBar:  AppBar(
              automaticallyImplyLeading: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              title: Text('Contact us' , style: TextStyle(
                  fontSize: FontSizeManager.s15 ,
                  fontWeight: FontWeightManager.semiBold
              ),),
              centerTitle: true,

            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical:  20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [

                    createString(
                        title: 'Contact us',
                        color: btnColor ,
                      weight: FontWeightManager.bold ,
                      fontSize: 18
                    ),
                    SizedBox(height: 20,),

                    Card(
                      child:
                      InkWell(
                        onTap: ()async{
                          const url = 'https://api.whatsapp.com/send?phone=${09177}';
                          if(await canLaunch(url)){
                          await launch(url);
                          }else {
                          throw 'Could not launch $url';
                          }

                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),

                          child: Column(
                            children:
                            [

                              Row(
                                children: [

                                  FaIcon(FontAwesomeIcons.whatsapp ,
                                    color: btnColor, size: 32,),

                                  SizedBox(width: 15,),

                                  createString(
                                      title: 'WhatsApp',
                                      color: defColor ,
                                      weight: FontWeightManager.semiBold,
                                      fontSize: 15
                                  ),

                                  Spacer(),

                                  Icon(Icons.arrow_forward_ios_outlined, color: btnColor, ),


                                ],),

                            ],
                          ),
                        ),
                      ),
                    ),

                    Card(
                      child:
                      InkWell(

                        onTap: ()async{
                          const url = "tel: ";
                          if (await canLaunch(url ))
                          {
                            await launch(url);
                          }
                          else
                          {
                            throw 'Could not launch $url';
                          }

                        },

                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),

                          child: Column(
                            children:
                            [

                              Row(
                                children: [

                                  FaIcon(FontAwesomeIcons.phoneVolume,
                                    color: btnColor, size: 30,),

                                  SizedBox(width: 15,),

                                  createString(
                                      title: 'Phone',
                                      color: defColor ,
                                      weight: FontWeightManager.semiBold,
                                      fontSize: 15
                                  ),

                                  Spacer(),

                                  Icon(Icons.arrow_forward_ios_outlined, color: btnColor, ),


                                ],),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child:
                      InkWell(
                        onTap: ()async{
                          // String email = Uri.encodeComponent("mail@fluttercampus.com");
                          // String subject = Uri.encodeComponent("Hello Flutter");
                          // String body = Uri.encodeComponent("Hi! I'm Flutter Developer");

                          // Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");

                          Uri mail = Uri.parse("mailto:");
                          if (await launchUrl(mail))
                          {
                          }
                          else
                          {
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),

                          child: Column(
                            children:
                            [

                              Row(
                                children: [

                                  FaIcon(FontAwesomeIcons.envelopeOpenText,
                                    color: btnColor, size: 30,),

                                  SizedBox(width: 15,),

                                  createString(
                                      title: 'E-Mail',
                                      color: defColor ,
                                      weight: FontWeightManager.semiBold,
                                      fontSize: 15
                                  ),

                                  Spacer(),

                                  Icon(Icons.arrow_forward_ios_outlined, color: btnColor, ),


                                ],),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar:
            BottomNavigationBar(


              selectedItemColor: btnColor,

              currentIndex: cubit.currentIndex ,
              type: BottomNavigationBarType.fixed ,

              items: [

                BottomNavigationBarItem(icon:
                Column(
                  children: [
                    Container(

                      child: Image.asset('assets/images/home.png', color: cubit.unselectNavBar , ),
                      width: 28,
                      height: 28,
                    ),
                    Text('Home'.tr , style: TextStyle(color: gray),)

                  ],

                ) ,
                  label: '', ),

                BottomNavigationBarItem(icon:
                Column(
                  children: [
                    Container(

                      child: Image.asset('assets/images/search.png',color: cubit.unselectNavBar , ),
                      width: 28,
                      height: 28,
                    ),
                    Text('Search'.tr , style: TextStyle(color: gray),)
                  ],
                ) ,

                  label: '' ,),


                BottomNavigationBarItem(icon:
                Stack(
                  alignment: Alignment.topRight,

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset('assets/images/category.png' ,color: cubit.unselectNavBar , ),
                            width: 28 ,
                            height: 28 ,
                          ),
                          Text('Category'.tr , style: TextStyle(color: gray , fontSize: 12), )
                        ],
                      ),
                    ),

                    /*  CircleAvatar(radius: 10,
                        backgroundColor: btnColor,
                          child: Text('3' , style: TextStyle(color: Colors.white),),
                        )*/


                  ],
                ), label: '',),

                BottomNavigationBarItem(icon:
                Stack(
                  alignment: Alignment.topRight,

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset('assets/images/cart.png' , color: cubit.unselectNavBar ,),
                            width: 28 ,
                            height: 28 ,
                          ),
                          Text('Cart'.tr , style: TextStyle(color: gray),)

                        ],
                      ),
                    ),

                    CircleAvatar(radius: 10,
                      backgroundColor: defColor,
                      child: Text('3' , style: TextStyle(color: Colors.white),),
                    )


                  ],
                ), label: '',),

                BottomNavigationBarItem(icon:
                Stack(
                  alignment: Alignment.topRight,

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset('assets/images/profile.png' ,color: cubit.selectNavBar , ),
                            width: 28 ,
                            height: 28 ,
                          ),
                          Text('Profile'.tr , style: TextStyle(color: btnColor),)

                        ],
                      ),
                    ),




                  ],
                ), label: '',),

              ],
              elevation: 5,


              onTap: (index)
              {
                print('indexxxx $index');

                cubit.changeBottomNav(index);

                navTo(context, cubit.screens[index]);

              },

            )
        );
      },
    );
  }
}
