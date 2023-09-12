import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasel/data/local/cashHelper.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/cubit/app-cubit.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';

import 'detailOrder.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);

    return  BlocConsumer<AppCubit , AppState>(
      listener: (context, state){},
      builder: (context , state){

        print('784 ${cubit.orderModel?.bdata?.bdata?[0].status}');
//
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
            body:     RefreshIndicator(
              edgeOffset: .8,
              onRefresh: () {
                return Future.delayed(Duration(seconds: 3 ) , (){
                  cubit.getAllOrders() ;
                });
              },
              child: SingleChildScrollView(
                // physics: BouncingScrollPhysics(),
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0 , horizontal:  20),

                  child: cubit.orderModel?.bdata?.bdata !=null ?
                  Container(
                    height: MediaQuery.of(context).size.height ,
                    child: ListView.separated(
                      shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context , index){
                          return Card(
                          child:
                          Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),

                          child:

                          Row(
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
                          // title: ' #123456789',
                              title: ' #${cubit.orderModel?.bdata?.bdata?[index].id}',

                              color: defColor ,
                              weight: FontWeightManager.semiBold ,
                              fontSize: 13
                ),

                SizedBox(width: 20,),

                createString(
                title: '${cubit.orderModel?.bdata?.bdata?[index].total}',
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
                title: '${cubit.orderModel?.bdata?.bdata?[index].status }',
                color: Color(0xFF4267B2) ,
                weight: FontWeightManager.regular ,
                fontSize: 15
                ),

                SizedBox(width: 30,),
                createString(
                title: '${cubit.orderModel?.bdata?.bdata?[index].createdAtFormatted}',
                color: Color(0xFF4267B2) ,
                weight: FontWeightManager.regular ,
                fontSize: 13
                ),

                ],
                ),

                ],
                ),

               Spacer(),

                InkWell(
                child: Icon(Icons.arrow_forward_ios_outlined, color: btnColor, ),
                onTap: (){
                print('arrowww');

                Navigator.push(context,
                MaterialPageRoute(builder: (context) => OrderDetail(
                  sendOrderModel: cubit.orderModel?.bdata?.bdata?[index]  ,)),
                );

                },
                ),






                ],
                ),
                ),
                );
                        },

                        separatorBuilder: (context , index)=> SizedBox(height: 10,),
                        itemCount: cubit.orderModel!.bdata!.bdata!.length ),
                  ):
                    Center(child: Text('Empty...'),


                ),
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
                      child:

                      CashHelper.getData(key: 'notificationNum') !=null ?

                      Text('${CashHelper.getData(key: 'notificationNum')}'   , style: TextStyle(color: Colors.white),):
                      Text('0'   , style: TextStyle(color: Colors.white),),
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
