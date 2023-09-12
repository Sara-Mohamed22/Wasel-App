

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasel/data/local/cashHelper.dart';
import 'package:wasel/models/iconModel.dart';
import 'package:wasel/models/productModel.dart' as PM ;
import 'package:wasel/models/productModel.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/cubit/app-cubit.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';
import 'package:wasel/views/carts/cart.dart';

import 'infoProduct.dart';

class ProductScreen extends StatelessWidget {
  final String? title ;
  const ProductScreen({Key? key , this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

 List<dynamic> listX = [] ;

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
            body: RefreshIndicator(
                edgeOffset: .8,
                onRefresh: () {
                  return Future.delayed(Duration(seconds: 3 ) , (){
                    cubit.getAllProducts() ;

                  });
                },
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10),
                  child: Column(
                    children: [

                      Container(
                        height: MediaQuery.of(context).size.height/1.5,
                        child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: false,
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 3 / 4.7,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 20
                            ),
                            itemCount: cubit.productOFCategory?.data?.products?.length ,
                            itemBuilder: (BuildContext ctx, index) {
                              return
                                InkWell(
                                  onTap: (){

                                    print('infooo${cubit.productOFCategory?.data?.products![index].id}');


                                    cubit.getRelatedProducts(id:cubit.productOFCategory?.data?.products![index].id).
                                    then((value) {

                                      cubit.getCommonProducts(id: cubit.productOFCategory?.data?.products![index].id ).
                                      then((value) {

                                        navTo(context, InfoProduct(title: title,
                                          product: cubit.productOFCategory?.data?.products![index],) );

                                      });



                                    });


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
                                                  padding: const EdgeInsets.symmetric(horizontal: 20.0, ),
                                                  child: Container(
                                                    child: Column(

                                                      children: [

                                                        Container(
                                                          width: 200,
                                                          height: 120,

                                                          child:
                                                          cubit.productOFCategory!.data!.products![index].images!.isEmpty ?
                                                              Image.asset('assets/images/emptyImg.jpeg') :
                                                          Image.network(
                                                             cubit.productOFCategory!.data!.products![index].images![0].medium!
                                                          ),
                                                        ),

                                                        Column(
                                                          children: [
                                                            Row(children:
                                                            [
                                                              Expanded(
                                                                child: Text(
                                                                  // 'برتقال عصير',
                                                          cubit.productOFCategory!.data!.products![index].name! ,
                                                                  maxLines: 3,
                                                                  softWrap: true,
                                                                  style: TextStyle(color: defColor ,
                                                                      fontSize: 9,
                                                                      fontWeight: FontWeightManager.semiBold,),),
                                                              ) ,
                                                              Spacer(),
                                                              Text(
                                                                  cubit.productOFCategory!.data!.products![index].price.toString() ,
                                                                // ' 5.75 ليرة ',
                                                                style: TextStyle(color: btnColor ,
                                                                    fontSize: 9,

                                                                    fontWeight: FontWeightManager.semiBold),)
                                                            ],),

                                                            SizedBox(height: 5,),

                                                            Row(children:
                                                            [

                                                              Expanded(
                                                                child: Text(
                                                                  '${cubit.productOFCategory!.data!.products![index].weight} '
                                                                      '${cubit.productOFCategory!.data!.products![index].weightUnit}' ,
                                                                    maxLines: 2,
                                                                    softWrap: true,
                                                                    style: TextStyle(color: defColor ,
                                                                        fontSize: 9,

                                                                        fontWeight: FontWeightManager.semiBold)),
                                                              ) ,
                                                              Spacer(),
                                                              Text( cubit.productOFCategory!.data!.products![index].oldPrice.toString() ,
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
                                                              color: cubit.productOFCategory!.data!.products![index].canBuy == true ?
                                                                       btnColor : gray,
                                                              // border: Border.all(),
                                                              borderRadius: BorderRadius.circular(50)
                                                          ),
                                                          child: MaterialButton(onPressed:
                                                          cubit.productOFCategory!.data!.products![index].canBuy == true ?
                                                              () async {

                                                            listX.add(cubit.productOFCategory!.data!.products![index] );

                                                            cartProducts = [] ;

                                                            cartProducts.add( cubit.productOFCategory!.data!.products![index]  );


                                                            if(CashHelper.getData(key: 'obj') !=null)
                                                            {

                                                              jsonDecode(CashHelper.getData(key: 'obj')).forEach((e) {
                                                                print('--proooooo- ${PM.DataInfo.fromJson(e).name}');


                                                                  if( cubit.productOFCategory!.data!.products![index].id ==  DataInfo.fromJson(e).id  )
                                                                  {

                                                                    print('yyyyyy ${cubit.productOFCategory!.data!.products![index].initalQuantity}');
                                                                    cubit.productOFCategory!.data!.products![index].initalQuantity  =
                                                                    (cubit.productOFCategory!.data!.products![index].initalQuantity! + 1)  ;

                                                                  }

                                                                else
                                                                {
                                                                  print('nnnnnnn ${cubit.productOFCategory!.data!.products![index].id}');
                                                                  cartProducts.add(PM.DataInfo.fromJson(e));

                                                                }

                                                                // cartProducts.add(PM.DataInfo.fromJson(e));
                                                              });

                                                            }





                                                            cubit.notifyNum(cartProducts.length);


                                                            await  CashHelper.saveData(key: 'obj',
                                                                value: ' ${jsonEncode(cartProducts)}' );

                                                            Navigator.push(context,
                                                              MaterialPageRoute(builder: (context) => CartScreen(
                                                              products: cartProducts ,)),
                                                            );

                                                            print('add to cart');

                                                          } : null
                                                             , child: Text(addCart,
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

                                                cubit.productOFCategory?.data?.products![index].availableOffer !=null ?
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
                                                        child: Text(
                                                          '${cubit.productOFCategory?.data?.products![index].availableOffer?.percentDiscountPrice}' ,
                                                          style: TextStyle(color: Colors.white),
                                                          textAlign: TextAlign.center,),
                                                      )),
                                                ) :
                                                    Container()

                                              ])),
                                    )
                                );







                            }),
                      ),


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
        );
      } ,
    );
  }
}
