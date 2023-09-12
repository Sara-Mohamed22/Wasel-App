import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasel/data/local/cashHelper.dart';
import 'package:wasel/data/local/sqflitDB.dart';
import 'package:wasel/models/cartModel.dart';
import 'package:wasel/models/productModel.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/cubit/app-cubit.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';

import 'checkout.dart';

class CartScreen extends StatelessWidget {

  // List<DataInfo>? products ;
  List<dynamic>? products ;


  CartScreen({Key? key ,  this.products }) : super(key: key);


  Widget build(BuildContext context) {

    print('ppppp ${ products?.length}');

    dynamic tot = 0;

    dynamic total =0;

    AppCubit cubit = AppCubit.get(context);



    // jsonDecode(CashHelper.getData(key: 'obj')).forEach((e){
    //   print('----------333- ${DataInfo.fromJson(e)   }');
    //
    //
    //   widget.products?.add(DataInfo.fromJson(e));
    //
    //
    //     // productsxx?.add(DataInfo.fromJson(e));
    //
    //
    // });


    // widget.products = cartProducts ;




      if( products == null )
       {
         print('mooooooo');
         products = [];

          if(CashHelper.getData(key: 'obj') != null )
          {

            print('----------- ${jsonDecode(CashHelper.getData(key: 'obj'))  }');

            // widget.products = [];

            jsonDecode(CashHelper.getData(key: 'obj')).forEach((e)
          {
          // widget.products = [];

          print('----------333- ${DataInfo.fromJson(e).id} ');



/*
          widget.products!.forEach((element) {

               if( element.id  == DataInfo.fromJson(e).id )
            {
              print('yesssssssssssss ');
              element.initalQuantity +=1 ;

            }

            else
            {
              print('noooooooooooooo ');


              widget.products?.add(DataInfo.fromJson(e));


            }

          });
*/

            tot += (DataInfo.fromJson(e).initalQuantity)! * (DataInfo.fromJson(e).price) ;
            print('kkkkkoko 1 ${tot}');

            CashHelper.saveData(key: 'total' , value: tot);

          products?.add(DataInfo.fromJson(e));


          });


         }
          else
            {

              products = [];

            }

         // widget.products = cubit.saveCart ;

    }

      else if(products?.length == 0)
        {
             products = [];
            jsonDecode(CashHelper.getData(key: 'obj')).forEach((e)
            {

              tot += (DataInfo.fromJson(e).initalQuantity)! * (DataInfo.fromJson(e).price) ;
              CashHelper.saveData(key: 'total' , value: tot);

              print('kkkkkoko 2 ${tot}');
              products?.add(DataInfo.fromJson(e));
            });

        }

      else
        {
          print('xxxxxooo ${products?.length}');
          // widget.products = widget.products ;

            // widget.products = [];

           /* jsonDecode(CashHelper.getData(key: 'obj')).forEach((e)
            {
              print('----------333- ${DataInfo.fromJson(e).name}');
               widget.products?.add(DataInfo.fromJson(e));
            });*/

          products?.forEach((e) {

            tot += (e.initalQuantity)! * (e.price) ;
            print('kkkkkoko 1 ${tot}');

            CashHelper.saveData(key: 'total' , value: tot);

          });

        }

    // widget.products = jsonDecode(CashHelper.getData(key: 'obj')) ;



      print('----------222- ${products?.length}');
    // SqflitDB().readDb('products').then((value) => print('hivvvve ${value}'));



      // print('xxxxxxxx ${cubit.saveCart.length}');



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

                products?.length !=0 ?
                Container(
                  height: MediaQuery.of(context).size.height/2 ,
                  child: ListView.separated(

                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context , index)  {


                           // total += products?[index].price * products?[index].initalQuantity ;

                           // print('//////// ${total}');

                           // CashHelper.saveData(key: 'total' , value: total);


                           cartsList = [CartModel(
                            products?[index].id  ,
                            products?[index].price,
                            products?[index].initalQuantity
                        )];

                        return


                          StatefulBuilder(
                              builder: (context, setInnerState) =>
                                  Dismissible(
                            key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          background: Container(color: Colors.red),
                             onDismissed: (direction) {

                              // setState(() {
                               setInnerState(() {

                                products?.removeAt(index);
                                 print('hhhhhhhhhh ${products?.length}');

                                  cubit.notifyNum(products!.length);

                                    CashHelper.saveData(key: 'obj',
                                    value: ' ${jsonEncode(products)}' );

                                /*
                                total = CashHelper.getData(key: 'total' ) -   ( products?[index].price * products?[index].initalQuantity )  ;

                                CashHelper.saveData(key: 'total' , value: total);

                                print('+++++++ ${total}');

                                */

                                if(products?.length == 0)
                                  {
                                    CashHelper.saveData(key: 'total' , value: 0);

                                  }

                                  else
                                  {

                                                 tot = 0 ;

                                              products?.forEach((e) {
                                                tot += (e.initalQuantity)! * (e.price);
                                                print('33333333333333333378 ${tot}');

                                                CashHelper.saveData(key: 'total', value: tot);
                                              });
                                            }

                                          });

                          },
                          child: Card(
                              elevation: 2,
                              child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 120,
                                  child:
                                  products![index].images != null ?
                                  Image.network(
                                      products![index].images.length !=0  ?
                                      products![index].images[0].medium :
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7ACdtX6sBmbWevD6fjNxC2anjclYcLKd5Wg&usqp=CAU'
                                  ):

                                   SizedBox(child: Text('No Product in Cart..'),),
                                ),

                               Container(
                                 height: 120 ,
                                 child: VerticalDivider(thickness: 1, color: gray, ),
                               ),

                                Column(
                                  children:
                                  [
                                    Container(
                                      width: 120 ,
                                      child: Text('${products?[index].name}',
                                        maxLines: 3,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis ,
                                        style: TextStyle(
                                          color: defColor ,
                                          fontFamily: fontFamily ,
                                          fontWeight: FontWeightManager.medium
                                        ),),
                                    ),
                                    Text('${products?[index].weight ?? 1 } x ${products?[index].price}',  style: TextStyle(
                                        color: btnColor ,
                                        fontFamily: fontFamily ,
                                        fontWeight: FontWeightManager.medium
                                    )) ,
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Text('${products?[index].price  } Lira',  style: TextStyle(
                                            color: btnColor ,
                                            fontFamily: fontFamily ,
                                            fontWeight: FontWeightManager.medium
                                        )),
                                        SizedBox(width: 5,),
                                        Text('${products?[index].oldPrice}', style: TextStyle(
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

                                          print('ttttt ${products?[index].initalQuantity}');

                                          cubit.addQuantity( products?[index] );


                                              CashHelper.saveData(key: 'obj',
                                              value: ' ${jsonEncode(products)}' );


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
                                        child: Text(
                                        '${products?[index].initalQuantity}'  ,
                                          // '${cubit.initalQuantity }' ,
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

                                          cubit.minusQuantity(products?[index]  );


                                          CashHelper.saveData(key: 'obj',
                                              value: ' ${jsonEncode(products)}' );

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
                        ),
                           );

                      }

                      ,
                      separatorBuilder: (context, index)=> SizedBox(height: 20,),
                      itemCount: products!.length  ),
                        )
                   :
                Center(child: Text('Empty...')),


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
                            // Text('${cubit.total }  Lira',
                            
                              StatefulBuilder(
                                  builder: (context, setInnerState) {

                                    // setInnerState((){});

                                    return
                                      Text('${CashHelper.getData(key: 'total') }  Lira',
                                      //   Text('${cubit.total }  Lira',
                                    style: TextStyle(
                                      color: btnColor,
                                      fontSize: FontSizeManager.s15 ,
                                      fontWeight: FontWeightManager.semiBold,
                                      fontFamily: fontFamily
                                  ));
                                  },
                              )
                          ],
                        ) ,
                        Spacer(),
                       products?.length !=0 ?
                       Container(
                          width: MediaQuery.of(context).size.width/2.5,
                          height: 40,
                          decoration: BoxDecoration(
                              color: btnColor,
                              // border: Border.all(),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: MaterialButton(onPressed: (){

                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => CheckoutScreen(products: products ,)),
                            );

                            print('continue order');

                          } , child: Text('Continue Order',
                            style: TextStyle(
                              color: Colors.white ,
                              fontWeight: FontWeightManager.semiBold ,
                              fontFamily: fontFamily ,
                              fontSize: FontSizeManager.s12 ,
                            ),  ),),
                        ) :
                        Container(
                          width: MediaQuery.of(context).size.width/2.5,
                          height: 40,
                          decoration: BoxDecoration(
                              color: gray,
                              // border: Border.all(),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: MaterialButton(onPressed: (){


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
                          child:
                          CashHelper.getData(key: 'notificationNum') !=null ?
                          Text('${CashHelper.getData(key: 'notificationNum')}'   , style: TextStyle(color: Colors.white),):
                          Text('0'   , style: TextStyle(color: Colors.white),),
                          // Text('${widget.products?.length}' , style: TextStyle(color: Colors.white),),
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
