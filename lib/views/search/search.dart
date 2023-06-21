import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/cubit/app-cubit.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';

import '../product/product.dart';

class Product
{
  String? img ;
  String? title ;
  String? price ;

  Product(this.img, this. title, this. price);
}

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);

   TextEditingController searchInput = TextEditingController();

  @override
  Widget build(BuildContext context) {


    List<Product> products =
    [
      Product('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA0XqAIP9mrJBGM3NYsxh2wJL-E6spjtZuxQ&usqp=CAU',
          'فواكه وخضروات' , '8.09 Lira'),

      Product('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA0XqAIP9mrJBGM3NYsxh2wJL-E6spjtZuxQ&usqp=CAU',
          'فواكه وخضروات' , '8.09 Lira'),
      Product('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA0XqAIP9mrJBGM3NYsxh2wJL-E6spjtZuxQ&usqp=CAU',
          'فواكه وخضروات' , '8.09 Lira'),
      Product('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA0XqAIP9mrJBGM3NYsxh2wJL-E6spjtZuxQ&usqp=CAU',
          'فواكه وخضروات' , '8.09 Lira'),
    ];


    AppCubit cubit = AppCubit.get(context);


    return BlocConsumer<AppCubit , AppState>(
      listener: (context,state){},
      builder: (context,state){

        return Scaffold(
            appBar:  AppBar(
              automaticallyImplyLeading: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              title: Text('Search' , style: TextStyle(
                  fontSize: FontSizeManager.s15 ,
                  fontWeight: FontWeightManager.semiBold
              ),),
              centerTitle: true,

            ),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 20),
              child: Column(
                children: [

                  TextFormField(
                    controller: searchInput ,

                    onChanged: (val){
                      print('20333 $val');
                    },
                    decoration: InputDecoration(

                      prefixIcon: Icon(
                        Icons.search,
                        color: btnColor ,
                      ),


                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide:
                         BorderSide(
                            color: btnColor ,
                            width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: Colors.grey,

                      hintText: "What are you looking for?",

                      //make hint text
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.w400,
                      ),



                    ),
                  ),

                  SizedBox(height: 20,),

                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: false,
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 3.2 ,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                        itemCount: products.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return
                            InkWell(
                              onTap: (){
                                print('11111');
                                navTo(context, ProductScreen(title: products[index].title ,) );
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
                                      Image.network(products[index].img!, ),
                                      Text(products[index].title! ,
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

                      child: Image.asset('assets/images/search.png',color: cubit.selectNavBar , ),
                      width: 28,
                      height: 28,
                    ),
                    Text('Search'.tr , style: TextStyle(color: btnColor),)
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
        ) ;
      },
    );
  }
}
