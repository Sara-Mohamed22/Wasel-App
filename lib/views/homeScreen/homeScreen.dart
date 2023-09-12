
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wasel/data/local/cashHelper.dart';
import 'package:wasel/data/local/sqflitDB.dart';
import 'package:wasel/models/iconModel.dart';
import 'package:wasel/models/productModel.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/cubit/app-cubit.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';
import 'package:wasel/views/carts/cart.dart';
import 'package:wasel/views/product/infoProduct.dart';
import 'package:wasel/views/product/product.dart';

class Product
{
  String? img ;
  String? title ;
  String? price ;

  Product(this.img, this. title, this. price);
}



class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);


  // List <DataInfo> cartProducts = [];


 List<IconSlider> iconSliders =
 [
   IconSlider('assets/images/MGroup1.png', 'فواكه وخضروات'),
   IconSlider('assets/images/MGroup2.png', 'لحوم وأسماك'),
   IconSlider('assets/images/MGroup3.png', 'ألبان وأجبان'),
   IconSlider('assets/images/MGroup4.png', 'أدوات منزلية'),
   IconSlider('assets/images/MGroup5.png', 'منتجات غذائية'),

 ];

   // List<DataInfo> cartProducts = [];

   @override
  Widget build(BuildContext context) {

     var y  ;

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
      listener: (context , state){

        if(state is CheckFAVSuccessState)
          {


          }
      },

      builder: (context ,state){



        return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(MediaQuery
                  .of(context)
                  .size
                  .height / 9),

              child: AppBar(
                title: Image.asset(
                  'assets/images/Logo.png', height: 120, width: 120,),
                backgroundColor: Colors.white,
                centerTitle: true,
                elevation: 0,
              ),
            ),
            body:
                    cubit.productModel?.data?.data !=null ||
                    cubit.categoryModel?.data?.data !=null   ?

               RefreshIndicator(
                 edgeOffset: .8,
                 onRefresh: () {
                   return Future.delayed(Duration(seconds: 3 ) , (){
                     cubit.getAllProducts() ;
                     cubit.getSliderImage() ;
                   });
                 },
                 child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                    child: Column(
                        children: [



                          cubit.sliderModel?.data !=null ?

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),

                            child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child:
                                Container(
                                  height: 150,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder: (context , index){
                                        return   Container(
                                          // width:200 ,
                                          // height: 200,
                                          child:
                                          Image.network(
                                              // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq8U5pA2yDlmER2nzbpPOY5fNB7cF5k_56jw&usqp=CAU'
                                             cubit.sliderModel!.data![index].modelId![0].image!.medium!
                                             ),
                                        ) ;
                                      },
                                      separatorBuilder: (context, index)=> SizedBox(width: 15,),
                                      itemCount: cubit.sliderModel!.data!.length
                                  ),
                                )


                            ),
                          ) :
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child:SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),

                              child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child:
                                  Container(
                                    height: 150,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context , index){
                                          return   Container(
                                            // width:200 ,
                                            // height: 200,
                                            child:
                                            Image.network(
                                              // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq8U5pA2yDlmER2nzbpPOY5fNB7cF5k_56jw&usqp=CAU'
                                                cubit.sliderModel!.data![index].modelId![0].image!.medium!
                                            ),
                                          ) ;
                                        },
                                        separatorBuilder: (context, index)=> SizedBox(width: 15,),
                                        itemCount: 10
                                    ),
                                  )


                              ),
                            ) ,
                          ),




                          SizedBox(height: 50,),

                       cubit.categoryModel?.data?.data !=null ?
                       SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),

                            child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child:
                                Container(
                                  height: 140,
                                  child: ListView.separated(

                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder: (context , index){
                                       /* return   Container(
                                          width:110 ,
                                          // height: 200,
                                            child:InkWell(
                                              onTap: (){
                                                print('proooo');
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
                                            )

                                        ) ;*/


                                        return   Container(
                                            width:110 ,
                                            // height: 200,
                                            child:InkWell(
                                              onTap: ()async{
                                                // print('proooo${cubit.categoryModel!.data!.data![index].name }');

                                                cubit.getAllProductsOFCategories(id:cubit.categoryModel!.data!.data![index].id )!.
                                                then((value) {

                                                  navTo(context, ProductScreen(title: cubit.categoryModel!.data!.data![index].name ,) );

                                                });
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

                                                      Image.network(cubit.categoryModel!.data!.data![index].image!.medium!),

                                                      Expanded(
                                                        child: Text(cubit.categoryModel!.data!.data![index].name! ,
                                                          softWrap: true,
                                                          textAlign: TextAlign.center ,
                                                          maxLines: 2,
                                                          style: TextStyle(color: btnColor , ),),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )

                                        ) ;
                                      },
                                      separatorBuilder: (context, index)=> SizedBox(width: 10,),
                                      itemCount: cubit.categoryModel!.data!.data!.length ),
                                )


                            ),
                          ) :
                          Center(child: Text('loading...')),


                          SizedBox(height: 50,),

                         /* Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                              Text('Offers ' , style: TextStyle(
                                  color: btnColor,
                                  fontWeight: FontWeightManager.medium,
                                fontSize: FontSizeManager.s18),) ,
                              Spacer(),

                              Text('ALL', style: TextStyle(
                                  color: gray ,
                                  fontWeight: FontWeightManager.regular,
                                  fontSize: FontSizeManager.s18),)
                            ],),
                          ),

                          SizedBox(height: 20,),

                          SizedBox(height: 20,),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 20),
                            child: Row(
                              children: [
                                Text('BestSeller ' , style: TextStyle(
                                    color: btnColor,
                                    fontWeight: FontWeightManager.medium,
                                    fontSize: FontSizeManager.s16),) ,

                                Spacer(),

                                Text('ALL', style: TextStyle(
                                    color: gray ,
                                    fontWeight: FontWeightManager.regular,
                                    fontSize: FontSizeManager.s16),)
                              ],),
                          ),*/

                          cubit.productModel?.data?.data !=null ?

                          Container(
                            height: MediaQuery.of(context).size.height/2,
                            child: GridView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: false,
                                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 3 / 4.8 ,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),

                                itemBuilder: (BuildContext ctx, index) {

                               // cubit.checkFav(cubit.productModel!.data!.data![index].id)!.
                               // then((value) {
                               //
                               // });

                                  return
                                    InkWell(
                                      onTap: (){

                                        cubit.getRelatedProducts(id:cubit.productModel!.data!.data![index].id).
                                        then((value) {

                                          cubit.getCommonProducts(id: cubit.productModel!.data!.data![index].id ).then((value) {

                                            navTo(context, InfoProduct(title: cubit.productModel!.data!.data![index].name!,
                                              product: cubit.productModel!.data!.data![index] ,) );

                                          });


                                        });


                                      },
                                      child: Container(

                                          width:200 ,
                                          // height: 200,
                                          child:
                                          Stack(
                                            alignment: AlignmentDirectional.topEnd ,
                                            children: [

                                              Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10.0)),
                                                  semanticContainer: true,
                                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                                  elevation: 3,
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
                                                                    child:
                                                                    // cubit.productModel!.data!.data![index].images != null ?

                                                                    // Image.network(cubit.productModel!.data!.data![index].images![index]!.medium! ??

                                                                        Image.network(
                                                                            cubit.productModel!.data!.data![index].images![0].medium!
                                                                  ),
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                      children:
                                                                    [
                                                                      Expanded(
                                                                        child: Text(
                                                                          // 'برتقال عصير',
                                                                           cubit.productModel!.data!.data![index].name! ,
                                                                          maxLines: 2,
                                                                          softWrap: true,
                                                                          overflow: TextOverflow.ellipsis ,
                                                                          style: TextStyle(color: defColor ,
                                                                              fontFamily: fontFamily ,
                                                                              fontSize: 9,
                                                                              fontWeight: FontWeightManager.bold),),
                                                                      ) ,
                                                                      // Spacer(),


                                                                      Text(
                                                                        // ' 5.75 ليرة ',
                                                                          cubit.productModel!.data!.data![index].price.toString() ,
                                                                        style: TextStyle(color: btnColor ,
                                                                            fontFamily: fontFamily ,
                                                                            fontSize: 9,
                                                                            fontWeight: FontWeightManager.bold),)

                                                                    ],),


                                                                    SizedBox(height: 8,),

                                                                    Row(

                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                                                                      children:
                                                                    [
                                                                      Text(
                                                                    '${cubit.productModel!.data!.data![index].weight}'
                                                                        ' ${cubit.productModel!.data!.data![index].weightUnit }' ,
                                                                          // '1 كيلو',
                                                                          style: TextStyle(color: defColor ,
                                                                              fontFamily: fontFamily ,
                                                                              fontSize: 9,
                                                                              fontWeight: FontWeightManager.bold)) ,
                                                                      // Spacer(),
                                                                      Text(
                                                                          cubit.productModel!.data!.data![index].oldPrice.toString() ,
                                                                        // '5.75 ' ,
                                                                        style: TextStyle(decoration: TextDecoration.lineThrough ,
                                                                            color: gray ,
                                                                            fontFamily: fontFamily ,
                                                                            fontSize: 9,
                                                                            fontWeight: FontWeightManager.bold),)
                                                                    ],)
                                                                  ],
                                                                ),

                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Container(
                                                                  width: double.infinity,
                                                                  height: 30,
                                                                  decoration: BoxDecoration(
                                                                      color: btnColor,
                                                                      // border: Border.all(),
                                                                      borderRadius: BorderRadius.circular(50)
                                                                  ),
                                                                  child: MaterialButton(onPressed: ()async {



                                                                       // if ( CashHelper.getData(key: 'obj') != null)
                                                                       //   jsonDecode(CashHelper.getData(key: 'obj')).forEach((e)
                                                                       //   {
                                                                       //
                                                                       //     cartProducts.add(DataInfo.fromJson(e));
                                                                       //
                                                                       //   });

                                                                        cartProducts = [] ;


                                                                         cartProducts.add( cubit.productModel!.data!.data![index] );


                                                                        /*   cartProducts.forEach((e) {

                                                                          print('yes ${cubit.productModel!.data!.data![index].id}');

                                                                          if( e.id  == cubit.productModel!.data!.data![index].id )
                                                                          {
                                                                            print('yesssssssssssss ${cubit.productModel!.data!.data![index].id}');

                                                                            cubit.productModel!.data!.data![index].initalQuantity  += 1 ;
                                                                             cartProducts.remove(cubit.productModel!.data!.data![index].id);


                                                                          }

                                                                          else
                                                                          {
                                                                            print('noooooooooooooo ${cubit.productModel!.data!.data![index].id}');
                                                                            cartProducts.add( cubit.productModel!.data!.data![index] );

                                                                          }

                                                                        }); */

                                                                        // cartProducts.add( cubit.productModel!.data!.data![index] );



                                                                        if(CashHelper.getData(key: 'obj') !=null)
                                                                       {

                                                                         jsonDecode(CashHelper.getData(key: 'obj')).forEach((e) {
                                                                           print('--homeeeeee- ${DataInfo.fromJson(e).name}');

                                                                           print('yes ${DataInfo.fromJson(e).id}');

                                                                           // cartProducts.forEach((element) {

                                                                             if( cubit.productModel!.data!.data![index].id ==  DataInfo.fromJson(e).id  )
                                                                             {

                                                                               print('yesssssssssssss ${cubit.productModel!.data!.data![index].initalQuantity}');
                                                                               cubit.productModel!.data!.data![index].initalQuantity  =
                                                                               (cubit.productModel!.data!.data![index].initalQuantity! + 1)  ;

                                                                             }

                                                                            else
                                                                            {
                                                                              print('noooooooooooooo ${cubit.productModel!.data!.data![index].id}');
                                                                                                        cartProducts.add(DataInfo.fromJson(e));
                                                                            }


                                                                           // });


                                                                              // cartProducts.add(DataInfo.fromJson(e))  ;


                                                                         });

                                                                       }





                                                                          await  CashHelper.saveData(key: 'obj',
                                                                                value: ' ${jsonEncode(cartProducts)}' );


                                                                           cubit.notifyNum(cartProducts.length);

                                                                      Navigator.push(context,
                                                                      MaterialPageRoute(builder: (context) => CartScreen(
                                                                      // product: cubit.productModel?.data?.data?[index],
                                                                        products: cartProducts ,
                                                                      )),
                                                                      );


                                                                        print('add to cart ${cartProducts.length}');

                                                                       // cubit.saveItemCarts( cubit.productModel!.data!.data![index] , index );


                                                                  } , child: Text(
                                                                    addCart,
                                                                    textAlign: TextAlign.center,
                                                                    maxLines: 1,
                                                                    style: TextStyle(
                                                                      color: Colors.white ,
                                                                      fontWeight: FontWeightManager.semiBold ,
                                                                      fontFamily: fontFamily ,
                                                                      fontSize: 9,
                                                                    ),  ),),
                                                                ) ,


                                                              ],
                                                            ),
                                                          ),
                                                        ),

                                                        cubit.productModel!.data!.data![index].availableOffer !=null ?
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
                                                                  // '-10%' ,
                                                                cubit.productModel!.data!.data![index].availableOffer!.percentDiscountPrice.toString() ,
                                                                  style: TextStyle(color: Colors.white),
                                                                  textAlign: TextAlign.center,),
                                                              )),
                                                        ) : Container()

                                                      ])),

                                              StatefulBuilder(
                                             builder : (context, setInnerState) {


                                               return Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Container(
                                                    color: Colors.transparent ,
                                                    child: InkWell(

                                                        onTap:(){

                                                          setInnerState(() {

                                                            cubit.favList[cubit.productModel!.data!.data![index].id!] =
                                                            ! (cubit.favList[cubit.productModel!.data!.data![index].id ])!  ;


                                                            cubit.addToFav(cubit.productModel!.data!.data![index].id).then((value)
                                                            {
                                                              cubit.checkFav(cubit.productModel!.data!.data![index].id!);
                                                            });




                                                          });


                                                        },



                                                        child:

                                                       cubit.favList[cubit.productModel!.data!.data![index].id ] == true ?

                                                    /*    Padding(
                                                               padding: const EdgeInsets.all(5.0),
                                                               child:

                                                               // state is !ADDTOFAVLoadingState    ?
                                                               //     state is !CheckFAVLoadingState ?


                                                               cubit.favList[cubit.productModel!.data!.data![index].isFavored ] == true ?

                                                               Icon(Icons.favorite ,
                                                                 color: Colors.red ):


                                                               Container(
                                                                   width:20 ,
                                                                   height: 20,
                                                                   child: Center(child: CircularProgressIndicator())),
                                                             ) :*/


                                                           StatefulBuilder(

                                                             builder: (context, setInnerState) =>
                                                                 InkWell(
                                                                   onTap: (){
                                                                     setInnerState(() {

                                                                cubit.favList[cubit.productModel!.data!.data![index].id!] =
                                                                ! (cubit.favList[cubit.productModel!.data!.data![index].id ])!  ;


                                                                cubit.addToFav(cubit.productModel!.data!.data![index].id).then((value)
                                                                {
                                                                  cubit.checkFav(cubit.productModel!.data!.data![index].id!);
                                                                });




                                                                     });
                                                                   },
                                                                   child: Padding(
                                                                   padding: const EdgeInsets.all(5.0),
                                                                   child: cubit.favList[cubit.productModel!.data!.data![index].id ]!
                                                                       ? Icon(Icons.favorite , color: Colors.red ) : Icon(Icons.favorite_border) ,
                                                               ),
                                                                 ),
                                                           )

                                                           :

                                                             // state is !CheckFAVLoadingState || state is !ADDTOFAVLoadingState ?
                                                             Padding(
                                                              padding: const EdgeInsets.all(5.0),
                                                              child:

                                                              // state is !CheckFAVLoadingState  ?
                                                              //    state is CheckFAVSuccessState ?

                                                              cubit.favList[cubit.productModel!.data!.data![index].id ] != true ?

                                                                 Icon(Icons.favorite_border)
                                                                  :
                                                              Container(
                                                                  width:20 ,
                                                                  height: 20,
                                                                  child:
                                                                  Center(child: CircularProgressIndicator()))
                                                            )




                                  //     Padding(
                                  //   padding: const EdgeInsets.all(5.0),
                                  //   child: SpinKitPumpingHeart(
                                  //     color: Colors.transparent,
                                  //     size: 20,
                                  //   ),
                                  // )


                                  ),
                                                  ),
                                                );
                                             },
                                              )


                                            ],
                                          ))
                                    );

                                },

                              itemCount: cubit.productModel?.data?.data!.length ,
                            ),
                          ) :
                          Center(child: Text('loading...')),


                        ]),
                  )
            ),
               )  :



              Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                    child: Column(
                        children: [

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),

                            child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child:
                                Container(
                                  height: 150,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder: (context , index){
                                        return   Container(
                                          // width:200 ,
                                          // height: 200,
                                          child: Image.network(
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq8U5pA2yDlmER2nzbpPOY5fNB7cF5k_56jw&usqp=CAU'),
                                        ) ;
                                      },
                                      separatorBuilder: (context, index)=> SizedBox(width: 15,),
                                      itemCount: 5 ),
                                )


                            ),
                          ),

                          SizedBox(height: 50,),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),

                            child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child:
                                Container(
                                  height: 140,
                                  child: ListView.separated(

                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder: (context , index){
                                        return   Container(
                                            width:110 ,
                                            // height: 200,
                                            child:InkWell(
                                              onTap: (){
                                                print('proooo');
                                              },

                                              child: Card(

                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),

                                                elevation: 1,
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
                                            )

                                        ) ;
                                      },
                                      separatorBuilder: (context, index)=> SizedBox(width: 10,),
                                      itemCount: iconSliders.length ),
                                )


                            ),
                          ),

                          SizedBox(height: 50,),

                          Container(
                            height: MediaQuery.of(context).size.height,
                            child: GridView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: false,
                                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 3 / 4.8 ,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                                itemCount: products.length,
                                itemBuilder: (BuildContext ctx, index) {

                                  print('ff ${cubit.favList}');


                                  return
                                    InkWell(
                                        onTap: (){
                                          print('11111');
                                          // navTo(context, ProductScreen(title: products[index].title ,) );
                                        },
                                        child: Container(

                                            width:200 ,
                                            // height: 200,
                                            child:
                                            Stack(
                                              alignment: AlignmentDirectional.topEnd ,
                                              children: [

                                                Card(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10.0)),
                                                    semanticContainer: true,
                                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                                    elevation: 2,
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
                                                                    child:
                                                                    // cubit.productModel!.data!.data![index].images != null ?

                                                                    // Image.network(cubit.productModel!.data!.data![index].images![index]!.medium! ??
                                                                    Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkBrsmk-EbKwQ3KAoFWyd8v_ZCwBbJcAm1dg&usqp=CAU',
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                        children:
                                                                        [
                                                                          Expanded(
                                                                            child: Text(
                                                                              '',
                                                                              // cubit.productModel!.data!.data![index].name! ,
                                                                              maxLines: 2,
                                                                              softWrap: true,
                                                                              overflow: TextOverflow.ellipsis ,
                                                                              style: TextStyle(color: defColor ,
                                                                                  fontFamily: fontFamily ,
                                                                                  fontSize: 9,
                                                                                  fontWeight: FontWeightManager.bold),),
                                                                          ) ,
                                                                          // Spacer(),


                                                                          Text(
                                                                            ' ',
                                                                            // cubit.productModel!.data!.data![index].price.toString() ,
                                                                            style: TextStyle(color: btnColor ,
                                                                                fontFamily: fontFamily ,
                                                                                fontSize: 9,
                                                                                fontWeight: FontWeightManager.bold),)
                                                                        ],),


                                                                      SizedBox(height: 8,),

                                                                      Row(

                                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                                                                        children:
                                                                        [
                                                                          Text(
                                                                              // '${cubit.productModel!.data!.data![index].weight} ${cubit.productModel!.data!.data![index].weightUnit }' ,
                                                                              '',
                                                                              style: TextStyle(color: defColor ,
                                                                                  fontFamily: fontFamily ,
                                                                                  fontSize: 9,
                                                                                  fontWeight: FontWeightManager.bold)) ,
                                                                          // Spacer(),
                                                                          Text(
                                                                            // cubit.productModel!.data!.data![index].oldPrice.toString() ,
                                                                            '' ,
                                                                            style: TextStyle(decoration: TextDecoration.lineThrough ,
                                                                                color: gray ,
                                                                                fontFamily: fontFamily ,
                                                                                fontSize: 9,
                                                                                fontWeight: FontWeightManager.bold),)
                                                                        ],)
                                                                    ],
                                                                  ),

                                                                  SizedBox(
                                                                    height: 10,
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

                                                                      Navigator.push(context,
                                                                        MaterialPageRoute(builder: (context) =>
                                                                            CartScreen(
                                                                              // product: cubit.productModel!.data!.data![index] ,
                                                                                products: cartProducts ,
                                                                            )
                                                                              ),
                                                                      );


                                                                      print('add to cart ');

                                                                    } , child: Text(
                                                                      addCart,
                                                                      textAlign: TextAlign.center,
                                                                      maxLines: 1,
                                                                      style: TextStyle(
                                                                        color: Colors.white ,
                                                                        fontWeight: FontWeightManager.semiBold ,
                                                                        fontFamily: fontFamily ,
                                                                        fontSize: 9,
                                                                      ),  ),),
                                                                  ) ,


                                                                ],
                                                              ),
                                                            ),
                                                          ),

                                                          Container()

                                                        ])),
                                                Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: InkWell(
                                                      onTap:(){
                                                        print('fav $index');
                                                        // cubit.changeFavorites();
                                                      },
                                                      child:
                                                      cubit.favList[cubit.productModel!.data!.data![index].id ] == true ?
                                                      Icon(Icons.favorite , color: Colors.red,)
                                                          : Icon(Icons.favorite_border)
                                                  ),
                                                )


                                              ],
                                            ))
                                    );







                                }),
                          ),


                        ]),
                  )
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

                      child: Image.asset('assets/images/home.png', color: cubit.selectNavBar , ),
                      width: 28,
                      height: 28,
                    ),
                    Text('Home'.tr , style: TextStyle(color: btnColor),)

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
              elevation: 2,


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
