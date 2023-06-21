
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/cubit/app-cubit.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';

import 'verifyScreen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  String? initalVal ;

  @override
  Widget build(BuildContext context) {

    AppCubit cubit = AppCubit.get(context);
    return  BlocConsumer<AppCubit, AppState>(
      listener: (context , state){},
      builder: (context,state){

        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              title: Text('Payment' , style: TextStyle(
                  fontSize: FontSizeManager.s15 ,
                  fontWeight: FontWeightManager.semiBold
              ),),
              centerTitle: true,

            ),

            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 20 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: createString(
                          title:'Select Payment Method' ,
                          color: btnColor,
                          fontSize: 16 ,
                          weight: FontWeightManager.semiBold

                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      elevation: 3,
                      child: RadioListTile(
                        title: createString(
                            title: "Pay by credit card",
                            color: defColor ,
                            weight: FontWeightManager.semiBold
                        ),
                        value: "Pay by credit card",
                        groupValue: initalVal ,
                        onChanged: (value){
                          setState(() {
                        initalVal = value.toString() ;
                          });
                        },
                      ),
                    ),

                    SizedBox(height: 10,),

                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      elevation: 3,
                      child: RadioListTile(
                        title: createString(
                            title: "Pay by cash on delivery" ,
                            color: defColor ,
                            weight: FontWeightManager.semiBold
                        ),
                        value: "pay by cash on delivery",
                        groupValue: initalVal ,
                        onChanged: (value){
                          setState(() {
                            initalVal = value.toString() ;

                          });
                        },
                      ),
                    ),


                  ],
                ),
              ),
            ),

            bottomNavigationBar:
            Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  Container(
                    width: double.infinity,
                    height: 100 ,
                    color: defColor ,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center ,
                            children: [
                              Text('Total', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: FontSizeManager.s15 ,
                                  fontWeight: FontWeightManager.semiBold,
                                  fontFamily: fontFamily
                              ),),
                              Text('26.06  Lira',
                                  style: TextStyle(
                                      color: btnColor,
                                      fontSize: FontSizeManager.s15 ,
                                      fontWeight: FontWeightManager.semiBold,
                                      fontFamily: fontFamily
                                  ))
                            ],
                          ) ,
                          Spacer(),
                          Container(
                            width: MediaQuery.of(context).size.width/2.5,
                            height: 40,
                            decoration: BoxDecoration(
                                color: btnColor,
                                // border: Border.all(),
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: MaterialButton(onPressed: (){

                              Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => VerifyScreen()),
                              );

                              print('Payment');

                            } , child: Text('Payment',
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
                                  child: Image.asset('assets/images/cart.png' , color: cubit.selectNavBar ,),
                                  width: 28 ,
                                  height: 28 ,
                                ),
                                Text('Cart'.tr , style: TextStyle(color: btnColor ),)

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
                                  child: Image.asset('assets/images/profile.png' ,color: cubit.unselectNavBar , ),
                                  width: 28 ,
                                  height: 28 ,
                                ),
                                Text('Profile'.tr , style: TextStyle(color: gray),)

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

                  ),
                ],
              ),
            )
        );
      },
    );
  }
}
