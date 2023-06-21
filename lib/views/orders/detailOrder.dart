import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/cubit/app-cubit.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);

    return  BlocConsumer<AppCubit , AppState>(
      listener: (context , state){},
      builder: (context ,state){
        return Scaffold(
            appBar:  AppBar(
              automaticallyImplyLeading: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              title: Text('Orders' , style: TextStyle(
                  fontSize: FontSizeManager.s15 ,
                  fontWeight: FontWeightManager.semiBold
              ),),
              centerTitle: true,

            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 20 ),
                child: Column(
                  children: [
                    Card(
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),

                        child: Expanded(

                          child: Row(
                            children:
                            [

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start ,
                                children:

                                [
                                  Row(
                                    children: [
                                      createString(
                                          title: 'Order Number : ',
                                          color: defColor ,
                                          weight: FontWeightManager.regular ,
                                          fontSize: 13
                                      ),

                                      createString(
                                          title: ' #123456789',
                                          color: defColor ,
                                          weight: FontWeightManager.regular ,
                                          fontSize: 13
                                      ),

                                      SizedBox(width: 20,),

                                      createString(
                                          title: '26.07',
                                          color: btnColor ,
                                          weight: FontWeightManager.semiBold ,
                                          fontSize: 13
                                      ),

                                      SizedBox(width: 3,),

                                      createString(
                                          title: 'Lira',
                                          color: btnColor ,
                                          weight: FontWeightManager.semiBold ,
                                          fontSize: 13
                                      ),
                                    ],
                                  ),



                                  Row(
                                    children: [
                                      createString(
                                          title: 'Request Preparing',
                                          color: Color(0xFF4267B2) ,
                                          weight: FontWeightManager.regular ,
                                          fontSize: 15
                                      ),

                                      SizedBox(width: 30,),
                                      createString(
                                          title: 'June 14,2023',
                                          color: Color(0xFF4267B2) ,
                                          weight: FontWeightManager.regular ,
                                          fontSize: 13
                                      ),

                                    ],
                                  ),

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

                                      print('track order');

                                    } , child: Text('Track Order',
                                      style: TextStyle(
                                        color: Colors.white ,
                                        fontWeight: FontWeightManager.semiBold ,
                                        fontFamily: fontFamily ,
                                        fontSize: FontSizeManager.s15 ,
                                      ),  ),),
                                  ),



                                ],
                              ),









                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30,),

                    Column(
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
                                    title:'8.90 ₺' ,
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
                                title:'26.07 ₺' ,
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
                                title:'5.00 $sign' ,
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
                                title:'3.73 $sign' ,
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
                                title:'8.73 $sign' ,
                                color: btnColor,
                                fontSize: 13 ,
                                weight: FontWeightManager.semiBold

                            ),
                          ],
                        ) ,


                      ],
                    )

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
        ) ;
      },
    );
  }
}
