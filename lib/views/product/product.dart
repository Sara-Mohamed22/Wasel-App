

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel/models/iconModel.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/cubit/app-cubit.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';

import 'infoProduct.dart';

class ProductScreen extends StatelessWidget {
  final String? title ;
  const ProductScreen({Key? key , this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    AppCubit cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit , AppState>(
      listener: (context , state){},
      builder:(context , state){
        return Scaffold(
            appBar: AppBar(
              // automaticallyImplyLeading: false,
              title: Text(title!),
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
                padding: const EdgeInsets.symmetric(vertical: 20.0 , horizontal: 10),
                child: Column(
                  children: [

                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: false,
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 4.3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 20
                          ),
                          itemCount: 20,
                          itemBuilder: (BuildContext ctx, index) {
                            return
                              InkWell(
                                onTap: (){
                                  print('infooo');
                                  navTo(context, InfoProduct(title: title,) );
                                },
                                child:
                                  Container(
                                    height: 250,
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0)),
                                        semanticContainer: true,
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        elevation: 5,
                                        child: Stack(
                                            alignment: AlignmentDirectional.topStart,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                                child: Container(
                                                  child: Column(

                                                    children: [

                                                      Container(
                                                        width: 200,
                                                        height: 120,
                                                        child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnBoCAoWBN_45O6wERRCzNwcb_CAYaqzYJJA&usqp=CAU',
                                                        ),
                                                      ),

                                                      Column(
                                                        children: [
                                                          Row(children:
                                                          [
                                                            Text('برتقال عصير',
                                                              style: TextStyle(color: defColor ,
                                                                  fontSize: 11,
                                                                  fontWeight: FontWeightManager.semiBold,),) ,
                                                            Spacer(),
                                                            Text(' 5.75 ليرة ',
                                                              style: TextStyle(color: btnColor ,
                                                                  fontSize: 11,

                                                                  fontWeight: FontWeightManager.semiBold),)
                                                          ],),

                                                          SizedBox(height: 5,),

                                                          Row(children:
                                                          [
                                                            Text('1 حبة',
                                                                style: TextStyle(color: defColor ,
                                                                    fontSize: 11,

                                                                    fontWeight: FontWeightManager.semiBold)) ,
                                                            Spacer(),
                                                            Text('5.75 ' ,
                                                              style: TextStyle(decoration: TextDecoration.lineThrough ,
                                                                  color: gray ,
                                                                  fontWeight: FontWeightManager.semiBold),)
                                                          ],)
                                                        ],
                                                      ),

                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                            color: btnColor,
                                                            // border: Border.all(),
                                                            borderRadius: BorderRadius.circular(50)
                                                        ),
                                                        child: MaterialButton(onPressed: (){

                                                          // Navigator.pushReplacement(context,
                                                          //   MaterialPageRoute(builder: (context) => RegisterScreen()),
                                                          // );

                                                          print('add to cart');

                                                        } , child: Text(addCart,
                                                          style: TextStyle(
                                                            color: Colors.white ,
                                                            fontWeight: FontWeightManager.semiBold ,
                                                            fontFamily: fontFamily ,
                                                            fontSize: FontSizeManager.s11 ,
                                                          ),  ),),
                                                      ) ,


                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                                child: Container(
                                                    height: 30,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                        color: defColor ,
                                                        border: Border.all(),
                                                        borderRadius: const BorderRadius.horizontal(
                                                            left: Radius.circular(5),
                                                            right: Radius.circular(20)
                                                        )
                                                    ),


                                                    child: Center(
                                                      child: Text('-10%' , style: TextStyle(color: Colors.white),
                                                        textAlign: TextAlign.center,),
                                                    )),
                                              )

                                            ])),
                                  )
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
                    Text('Home' , style: TextStyle(color: gray),)

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
                    Text('Search' , style: TextStyle(color: gray),)
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
                          Text('Category' , style: TextStyle(color: btnColor , fontSize: 12), )
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
                          Text('Cart' , style: TextStyle(color: gray),)

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
                          Text('Profile' , style: TextStyle(color: gray),)

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
      } ,
    );
  }
}
