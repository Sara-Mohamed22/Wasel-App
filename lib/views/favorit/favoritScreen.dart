
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasel/data/local/cashHelper.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/cubit/app-cubit.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';
import 'package:wasel/views/carts/cart.dart';
import 'package:wasel/views/product/infoProduct.dart';

class FavoritScreen extends StatelessWidget {
  const FavoritScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);

    cubit.getAllFav() ;

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
            body:
                RefreshIndicator(
                edgeOffset: .8 ,
                onRefresh: () {
                return Future.delayed(Duration(seconds: 3 ) , (){
                cubit.getAllFav() ;

                });
                },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 20 ),
                  child: Column(
                    children:
                    [

                      Container(
                        height: MediaQuery.of(context).size.height,

                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: false,

                          itemBuilder: (BuildContext ctx, index) {

                            return
                              InkWell(
                                  onTap: (){

                                        navTo(context, InfoProduct(title: cubit.favModel!.data![index].product!.name!,
                                          product: cubit.favModel!.data![index].product ,) );

                                  },
                                  child:
                                  Card(
                                    elevation: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 80,
                                            child: Image.network(cubit.favModel!.data![index].product!.images![0].medium! ,
                                            ),
                                          ),

                                          Container(
                                            height: 80 ,
                                            child: VerticalDivider(thickness: 1, color: gray, ),
                                          ),

                                          Column(
                                            children:
                                            [
                                              Text(cubit.favModel!.data![index].product!.name!,
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

                                                navTo(context, InfoProduct(

                                                  title: cubit.favModel!.data![index].product?.name,
                                                  product: cubit.favModel!.data![index].product ,)

                                                  );

                                              },
                                              child: Icon(Icons.arrow_forward_ios_outlined , color: btnColor , ))


                                        ],
                                      ),
                                    ),),


                              );

                          },

                          itemCount:  cubit.favModel?.data?.length ?? 0,
                        ),
                      ),

                      SizedBox(height: 10,),
                    ],
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
        )  ;
      },
    );
  }
}
