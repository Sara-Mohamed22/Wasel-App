import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/cubit/app-cubit.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';

import 'checkout.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);


  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);


    return BlocConsumer<AppCubit ,AppState>(
        listener:(context , state){} ,
    builder:(context , state) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
          title: Text('Cart' , style: TextStyle(
            fontSize: FontSizeManager.s15 ,
            fontWeight: FontWeightManager.semiBold
          ),),
          centerTitle: true,

        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0 , ),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Container(
                  height: MediaQuery.of(context).size.height ,
                  child: ListView.separated(

                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context , index){
                        return


                        Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          // background: Container(color: Colors.red),
                        /*  onDismissed: (direction) {
                            setState(() {
                              // items.removeAt(index);
                            });
                            // Scaffold.of(context).showSnackBar(SnackBar(content: Text("remove")));
                          },*/
                          child: Card(
                            elevation: 2,
                            child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 120,
                                child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnBoCAoWBN_45O6wERRCzNwcb_CAYaqzYJJA&usqp=CAU',
                                ),
                              ),

                             Container(
                               height: 120 ,
                               child: VerticalDivider(thickness: 1, color: gray, ),
                             ),

                              Column(
                                children:
                                [
                                  Text('برتقال مصري 1 كيلو',
                                    maxLines: 2,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis ,
                                    style: TextStyle(
                                      color: defColor ,
                                      fontFamily: fontFamily ,
                                      fontWeight: FontWeightManager.medium
                                    ),),
                                  Text('1 x 8.90',  style: TextStyle(
                                      color: btnColor ,
                                      fontFamily: fontFamily ,
                                      fontWeight: FontWeightManager.medium
                                  )) ,
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Text('8.90 Lira',  style: TextStyle(
                                          color: btnColor ,
                                          fontFamily: fontFamily ,
                                          fontWeight: FontWeightManager.medium
                                      )),
                                      SizedBox(width: 5,),
                                      Text('10.70', style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: gray
                                      ),)
                                    ],
                                  )
                                ],
                              ),

                              Spacer(),
                              Container(
                                width: 50,
                                height: 120,
                                decoration: BoxDecoration(

                                    color: btnColor,
                                    borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  )

                                ),
                                child: Column(

                                  children:
                                  [
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: btnColor,
                                          borderRadius: BorderRadius.circular(50)
                                      ),
                                      child: MaterialButton(onPressed: (){

                                        cubit.addQuantity();


                                      } , child: Text('+',
                                        style: TextStyle(
                                          color: Colors.white ,
                                          fontWeight: FontWeightManager.medium ,
                                          fontFamily: fontFamily ,
                                          fontSize: FontSizeManager.s22,
                                        ),  )
                                     ,),
                                    ),
                                    Container(
                                       width: 50,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: defColor,

                                      ),
                                      child: Text('${cubit.initalQuantity }',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white ,
                                          fontWeight: FontWeightManager.medium ,
                                          fontFamily: fontFamily ,
                                          fontSize: FontSizeManager.s18,
                                        ),  ),
                                    ),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: btnColor,
                                      ),
                                      child: MaterialButton(onPressed: (){

                                        cubit.minusQuantity();
                                      } , child:
                                      Text('-',
                                        style: TextStyle(
                                          color: Colors.white ,
                                          fontWeight: FontWeightManager.medium ,
                                          fontFamily: fontFamily ,
                                          fontSize: FontSizeManager.s22,
                                        ),  ),
                                    ))
                                  ],
                                ),
                              )



                            ],
                          ),),
                        );

                      }

                      ,
                      separatorBuilder: (context, index)=> SizedBox(height: 20,),
                      itemCount: 4 ),
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
                              MaterialPageRoute(builder: (context) => CheckoutScreen()),
                            );

                            print('continue order');

                          } , child: Text('Continue Order',
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
      )
      ;
    });
  }
}
