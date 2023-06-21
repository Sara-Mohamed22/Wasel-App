
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/cubit/app-cubit.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';

class FavoritScreen extends StatelessWidget {
  const FavoritScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit , AppState>(
      listener: (context , state){},
      builder: (context , state){
        return Scaffold(
            appBar:  AppBar(
              automaticallyImplyLeading: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              title: Text('Favorite' , style: TextStyle(
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
                  children:
                  [
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnBoCAoWBN_45O6wERRCzNwcb_CAYaqzYJJA&usqp=CAU',
                              ),
                            ),

                            Container(
                              height: 80 ,
                              child: VerticalDivider(thickness: 1, color: gray, ),
                            ),

                            Column(
                              children:
                              [
                                Text('Orange 1 kilo',
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis ,
                                  style: TextStyle(
                                      color: defColor ,
                                      fontFamily: fontFamily ,
                                      fontWeight: FontWeightManager.medium
                                  ),),
                              ],
                            ),

                            Spacer(),

                            InkWell(
                              onTap: (){
                                print('right arrow');
                              },
                                child: Icon(Icons.arrow_forward_ios_outlined , color: btnColor , ))


                          ],
                        ),
                      ),),
                    SizedBox(height: 10,),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnBoCAoWBN_45O6wERRCzNwcb_CAYaqzYJJA&usqp=CAU',
                              ),
                            ),

                            Container(
                              height: 80 ,
                              child: VerticalDivider(thickness: 1, color: gray, ),
                            ),

                            Column(
                              children:
                              [
                                Text('Orange 1 kilo',
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis ,
                                  style: TextStyle(
                                      color: defColor ,
                                      fontFamily: fontFamily ,
                                      fontWeight: FontWeightManager.medium
                                  ),),
                              ],
                            ),

                            Spacer(),

                            InkWell(
                                onTap: (){
                                  print('right arrow');
                                },
                                child: Icon(Icons.arrow_forward_ios_outlined , color: btnColor , ))


                          ],
                        ),
                      ),),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnBoCAoWBN_45O6wERRCzNwcb_CAYaqzYJJA&usqp=CAU',
                              ),
                            ),

                            Container(
                              height: 80 ,
                              child: VerticalDivider(thickness: 1, color: gray, ),
                            ),

                            Column(
                              children:
                              [
                                Text('Orange 1 kilo',
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis ,
                                  style: TextStyle(
                                      color: defColor ,
                                      fontFamily: fontFamily ,
                                      fontWeight: FontWeightManager.medium
                                  ),),
                              ],
                            ),

                            Spacer(),

                            InkWell(
                                onTap: (){
                                  print('right arrow');
                                },
                                child: Icon(Icons.arrow_forward_ios_outlined , color: btnColor , ))


                          ],
                        ),
                      ),),
                    SizedBox(height: 10,),
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
        )  ;
      },
    );
  }
}
