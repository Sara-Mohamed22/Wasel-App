
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/cubit/app-cubit.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';
import 'package:wasel/views/payment/payment.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);



    return  BlocConsumer<AppCubit, AppState>(
        listener: (context , state){},
      builder: (context, state){
          return  Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
                title: Text('Checkout Order' , style: TextStyle(
                    fontSize: FontSizeManager.s15 ,
                    fontWeight: FontWeightManager.semiBold
                ),),
                centerTitle: true,

              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),

                      createString(
                        title:'Delivery Address' ,
                        color: btnColor,
                        fontSize: 18 ,
                        weight: FontWeightManager.semiBold

                      ),

                      createString(
                          title:'House Address' ,
                          color:defColor ,
                          fontSize: 15 ,
                          weight: FontWeightManager.semiBold

                      ),

                      createString(
                          title:' Mansoura - Egypt' ,
                          color: defColor,
                          fontSize: 15 ,
                          weight: FontWeightManager.semiBold

                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: createString(
                            title:'Products' ,
                            color: btnColor,
                            fontSize: 18 ,
                            weight: FontWeightManager.semiBold

                        ),
                      ),

                      Container(
                        height: 40,
                        child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                createString(
                                    title:'1 Kilo of Orange' ,
                                    color: defColor,
                                    fontSize: 15 ,
                                    weight: FontWeightManager.semiBold

                                ),
                                
                                createString(
                                    title:'1X' ,
                                    color: btnColor,
                                    fontSize: 15 ,
                                    weight: FontWeightManager.semiBold

                                ),

                                
                                createString(
                                    title:'8.90' ,
                                    color: btnColor,
                                    fontSize: 15 ,
                                    weight: FontWeightManager.semiBold

                                ),
                              ],
                            )
                        ),

                      Divider(thickness: 2, color: Colors.black12),

                      Container(
                          height: 40,
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              createString(
                                  title:'1 Kilo of Orange' ,
                                  color: defColor,
                                  fontSize: 15 ,
                                  weight: FontWeightManager.semiBold

                              ),

                              createString(
                                  title:'1X' ,
                                  color: btnColor,
                                  fontSize: 15 ,
                                  weight: FontWeightManager.semiBold

                              ),


                              createString(
                                  title:'8.90' ,
                                  color: btnColor,
                                  fontSize: 15 ,
                                  weight: FontWeightManager.semiBold

                              ),
                            ],
                          )
                      ),

                      Divider(thickness: 2, color: Colors.black12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        children: [
                          createString(
                              title:'Total' ,
                              color: btnColor,
                              fontSize: 18 ,
                              weight: FontWeightManager.semiBold

                          ),
                          createString(
                              title:'26.07' ,
                              color: btnColor,
                              fontSize: 18 ,
                              weight: FontWeightManager.semiBold

                          ),
                        ],
                      ),

                      Divider(thickness: 2, color: Colors.black12),


                      SizedBox(height: 20,),
                      createString(
                          title:'Tasks' ,
                          color: btnColor,
                          fontSize: 18 ,
                          weight: FontWeightManager.semiBold

                      ),

                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          createString(
                              title:'Delivery Charge' ,
                              color: defColor,
                              fontSize: 13 ,
                              weight: FontWeightManager.semiBold

                          ),




                          createString(
                              title:'5.00' ,
                              color: btnColor,
                              fontSize: 13 ,
                              weight: FontWeightManager.semiBold

                          ),
                        ],
                      ) ,
                      Divider(thickness: 2, color: Colors.black12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          createString(
                              title:'Task by 10%' ,
                              color: defColor,
                              fontSize: 13 ,
                              weight: FontWeightManager.semiBold

                          ),




                          createString(
                              title:'3.73' ,
                              color: btnColor,
                              fontSize: 13 ,
                              weight: FontWeightManager.semiBold

                          ),
                        ],
                      ) ,
                      Divider(thickness: 2, color: Colors.black12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          createString(
                              title:'Total Tasks' ,
                              color: defColor,
                              fontSize: 13 ,
                              weight: FontWeightManager.semiBold

                          ),




                          createString(
                              title:'8.73' ,
                              color: btnColor,
                              fontSize: 13 ,
                              weight: FontWeightManager.semiBold

                          ),
                        ],
                      ) ,


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
                                  MaterialPageRoute(builder: (context) => PaymentScreen()),
                                );

                                print('complete order');

                              } , child: Text('Complete Order',
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
          ) ;
      },
    );
  }
}
