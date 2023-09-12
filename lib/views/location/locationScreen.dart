import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasel/data/local/cashHelper.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/cubit/app-cubit.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';


class LocationScreen extends StatelessWidget {
  LocationScreen({Key? key}) : super(key: key);


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
                title: Text('Delivery Address' , style: TextStyle(
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

                                  child: Card(
                                    elevation: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric( horizontal: 20),
                                      child: Row(
                                        children: [




                                          Column(
                                            children:
                                            [
                                              Text('Address',
                                                maxLines: 2,
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis ,
                                                style: TextStyle(
                                                    color: defColor ,
                                                    fontFamily: fontFamily ,
                                                    fontWeight: FontWeightManager.bold
                                                ),),
                                              SizedBox(height: 10,),
                                              Row(
                                                children: [
                                                  Text('${cubit.locationModel?.data?[index].text}',  style: TextStyle(
                                                      color: btnColor ,
                                                      fontFamily: fontFamily ,
                                                      fontWeight: FontWeightManager.medium
                                                  )),
                                                  SizedBox(width: 5,),
                                                ],
                                              )
                                            ],
                                          ),

                                          // Spacer(),




                                        ],
                                      ),
                                    ),),
                                );

                            }

                            ,
                            separatorBuilder: (context, index)=> SizedBox(height: 20,),

                            itemCount: cubit.locationModel!.data!.length ),
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
                            Text('Cart'.tr , style: TextStyle(color: gray ),)

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

              )
          )
          ;
        });
  }
}
