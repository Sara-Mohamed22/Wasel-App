import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasel/models/iconModel.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/cubit/app-cubit.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/views/product/product.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<IconSlider> iconSliders =
    [
      IconSlider('assets/images/MGroup1.png', 'فواكه وخضروات'),
      IconSlider('assets/images/MGroup2.png', 'لحوم وأسماك'),
      IconSlider('assets/images/MGroup3.png', 'ألبان وأجبان'),
      IconSlider('assets/images/MGroup4.png', 'أدوات منزلية'),
      IconSlider('assets/images/MGroup5.png', 'منتجات غذائية'),

    ];


    AppCubit cubit = AppCubit.get(context);


    return BlocConsumer<AppCubit ,AppState>(
        listener:(context , state){} ,
    builder:(context , state) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('التصنيفات'),
          centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            )

        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [


                 Container(
                   height: MediaQuery.of(context).size.height,
                   child: GridView.builder(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: false,
                                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200,
                                        childAspectRatio: 3 / 2,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20),
                                    itemCount: iconSliders.length,
                                    itemBuilder: (BuildContext ctx, index) {
                                    return
                                      InkWell(
                                        onTap: (){
                                          print('11111');
                                          navTo(context, ProductScreen(title: iconSliders[index].title ,) );
                                        },
                                        child: Card(

                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),

                                          elevation: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center ,
                                              children: [
                                                Image.asset(iconSliders[index].img!),
                                                Text(iconSliders[index].title! ,
                                                  softWrap: true,
                                                  textAlign: TextAlign.center ,
                                                  maxLines: 2,
                                                  style: TextStyle(color: btnColor , ),)
                                              ],
                                            ),
                                          ),
                                        ),
                                      );







                                    }),
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
                          child: Image.asset('assets/images/category.png' ,color: cubit.selectNavBar , ),
                          width: 28 ,
                          height: 28 ,
                        ),
                        Text('Category'.tr , style: TextStyle(color: btnColor , fontSize: 12), )
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
    } );
  }
}
