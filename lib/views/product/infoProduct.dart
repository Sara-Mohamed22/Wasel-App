
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wasel/models/productCategory.dart' ;
import 'package:wasel/shared/cubit/app-cubit.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';
import 'package:wasel/views/carts/cart.dart';

class InfoProduct extends StatelessWidget {
  final String? title ;
  // final Products? product ;
  final dynamic product ;


  const InfoProduct({Key? key , this.title , this.product }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppCubit cubit = AppCubit.get(context);


    return BlocConsumer<AppCubit , AppState>(
      listener: (context , state){},
      builder: (context , state){



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
            child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.topStart ,
                    children: [
                      ImageSlideshow(

                        width: double.infinity,

                        height: 200,

                        initialPage: 0,

                        indicatorBackgroundColor: Colors.grey,

                        children: [
                          ListView.builder(

                            itemBuilder: (context , index){

                              return   Image.network(
                                product!.images![index].medium! ,
                                fit: BoxFit.cover,
                              );

                            } ,
                            itemCount: product?.images?.length ,
                          ),

                          /*  Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSs00_6MDIJ0A2YyDs4zoVLFEpSd6IY9V2wiw&usqp=CAU',
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsJ5bIp5L8-U3J_9TtS9iHhbvkDuY7gSyzZg&usqp=CAU',
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzUIfKer06aiEfqpxHugrZOr6ZxBsGtkX9yw&usqp=CAU',
                            fit: BoxFit.cover,
                          ),*/


                        ],

                        onPageChanged: (value) {
                          print('Page changed: $value');
                        },

                        autoPlayInterval: 5000,

                        isLoop: true,
                      ),

                      product?.availableOffer !=null ?   Padding(
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
                      ):
                      Container()

                    ],
                  ),

                  SizedBox(height: 30,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start ,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),

                              child: Expanded(

                                child: Container(
                                  width: 250,
                                  child: Text(
                                    // 'برتقال عصير 1 كيلو' ,
                                    product!.name! ,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: TextStyle(
                                        color: defColor ,
                                        fontSize: FontSizeManager.s15,
                                        fontWeight: FontWeightManager.semiBold
                                    ),),
                                ),
                              ),
                            ),

                            RatingBar.builder(
                              initialRating: 3,
                              itemSize: 30,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ) ,

                        Spacer(),

                        Column(
                          children: [
                            Text(
                              // '5.75 ليرة'
                              product!.price.toString()
                              , style: TextStyle(
                                color: btnColor
                            ),),

                            Text(
                              // '6.75'
                              product!.oldPrice.toString()
                              ,  style: TextStyle(
                                decoration: TextDecoration.lineThrough ,
                                color: Colors.grey[500] ,
                                fontWeight: FontWeightManager.semiBold

                            ),),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),

                    child: Text(
                      // 'An orange is a fruit of various citrus species in the family Rutaceae (see list of plants known as orange); it primarily refers to Citrus × sinensis,[1] which is also called sweet orange, to distinguish it from the related Citrus × aurantium, referred to as bitter orange. The sweet orange reproduces asexually (apomixis through nucellar embryony); varieties of the sweet orange arise through mutations' ,
                      product.description ?? 'loading' ,
                      style: TextStyle(
                        color: Colors.grey[500],

                      ),
                      softWrap: true,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis ,
                    ),
                  ),
                  SizedBox(height: 30,),


                  cubit.relatedProduct?.data?.data?.length !=0  ?

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),

                    child: Align(
                      alignment: Alignment.topLeft,
                      child:
                       cubit.relatedProduct?.data?.data !=null    ?
                      Text('Related Products'
                        ,style: TextStyle(
                            color: btnColor ,
                            fontWeight: FontWeightManager.semiBold ,
                            fontSize: FontSizeManager.s16
                        ),) : Text(' '),
                    ),
                  ) : Text(' '),

                  cubit.relatedProduct?.data?.data !=null ?
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0 , vertical: 20),
                      child:
                      Container(
                        height: 220,

                        child: ListView.separated(

                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context , index){
                              return
                                Container(
                                    width:200 ,
                                    // height: 200,
                                    child:InkWell(
                                        onTap: (){
                                          print('proooo');
                                        },
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
                                                    padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                                                    child: Container(

                                                      child: Column(

                                                        children: [

                                                          Container(
                                                            width: 200,
                                                            height: 120,
                                                            child: Image.network(
                                                              cubit.relatedProduct!.data!.data![index].images![index].medium!
                                                              // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfZFZuEoFOFRMkrMP6Qsw7qolZ-C6Oe-ndAA&usqp=CAU',
                                                            ),
                                                          ),
                                                          Column(
                                                            children: [
                                                              Row(children:
                                                              [
                                                                Expanded(
                                                                  child: Text(

                                                                    cubit.relatedProduct!.data!.data![index].name!,
                                                                    // 'برتقال عصير',
                                                                    style: TextStyle(color: defColor ,
                                                                        fontWeight: FontWeightManager.semiBold),
                                                                  softWrap: true,
                                                                  maxLines: 2,
                                                                  overflow: TextOverflow.ellipsis,),
                                                                ) ,
                                                                Spacer(),
                                                                Text(
                                                                  cubit.relatedProduct!.data!.data![index].price.toString() ,
                                                                  // ' 5.75 ليرة ',
                                                                  style: TextStyle(color: btnColor ,
                                                                      fontWeight: FontWeightManager.semiBold),)
                                                              ],),

                                                              SizedBox(height: 5,),

                                                              Row(children:
                                                              [
                                                                Text(
                                                                  '${cubit.relatedProduct!.data!.data![index].weight} '
                                                                      '${cubit.relatedProduct!.data!.data![index].weightUnit }',
                                                                    // '1 حبة',
                                                                    style: TextStyle(color: defColor ,
                                                                        fontWeight: FontWeightManager.semiBold)) ,
                                                                Spacer(),
                                                                Text(
                                                                  // '5.75 ' ,
                                                                    cubit.relatedProduct!.data!.data![index].oldPrice.toString() ,
                                                                    style: TextStyle(decoration: TextDecoration.lineThrough ,
                                                                      color: gray ,
                                                                      fontWeight: FontWeightManager.semiBold),)
                                                              ],)
                                                            ],
                                                          ),



                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  cubit.relatedProduct!.data!.data![index].canBuy != false ?
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
                                                  ) : Container()

                                                ]))));

                            }

                            ,
                            separatorBuilder: (context, index)=> SizedBox(width: 10,),
                            itemCount:
                            cubit.relatedProduct!.data!.data!.length
                        ),
                      )


                  ) : Container()
                     ,

                  SizedBox(height: 30,),

                  cubit.commonProduct?.data?.data?.length !=0 ?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),

                    child: Align(
                      alignment: Alignment.topLeft,
                      child:
                      cubit.relatedProduct?.data?.data !=null ?
                      Text('Common Products'
                        ,style: TextStyle(
                            color: btnColor ,
                            fontWeight: FontWeightManager.semiBold ,
                            fontSize: FontSizeManager.s16
                        ),) : Text(' '),
                    ),
                  ) : Text(''),

                 /* Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0 , vertical: 20),
                      child:
                      Container(
                        height: 220,

                        child: ListView.separated(

                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context , index){
                              return
                                Container(
                                    width:200 ,
                                    // height: 200,
                                    child:InkWell(
                                        onTap: (){
                                          print('proooo');
                                        },
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
                                                    padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                                                    child: Container(

                                                      child: Column(

                                                        children: [

                                                          Container(
                                                            width: 200,
                                                            height: 120,
                                                            child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ77RfoGrFyHsRhhblT9V7vYnuaSHv3rcwveQ&usqp=CAU',
                                                            ),
                                                          ),
                                                          Column(
                                                            children: [
                                                              Row(children:
                                                              [
                                                                Text('برتقال عصير',
                                                                  style: TextStyle(color: defColor ,
                                                                      fontWeight: FontWeightManager.semiBold),) ,
                                                                Spacer(),
                                                                Text(' 5.75 ليرة ',
                                                                  style: TextStyle(color: btnColor ,
                                                                      fontWeight: FontWeightManager.semiBold),)
                                                              ],),

                                                              SizedBox(height: 5,),

                                                              Row(children:
                                                              [
                                                                Text('1 حبة',
                                                                    style: TextStyle(color: defColor ,
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

                                                ]))));

                            }

                            ,
                            separatorBuilder: (context, index)=> SizedBox(width: 10,),
                            itemCount: 4 ),
                      )


                  ),*/

                  cubit.commonProduct?.data?.data !=null ?
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0 , vertical: 20),
                      child:
                      Container(
                        height: 220,

                        child: ListView.separated(

                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context , index){
                              return
                                Container(
                                    width:200 ,
                                    // height: 200,
                                    child:InkWell(
                                        onTap: (){
                                          print('proooo');
                                        },
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
                                                    padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                                                    child: Container(

                                                      child: Column(

                                                        children: [

                                                          Container(
                                                            width: 200,
                                                            height: 110
                                                            ,
                                                            child: Image.network(
                                                                cubit.commonProduct!.data!.data![index].images![index].medium!
                                                              // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfZFZuEoFOFRMkrMP6Qsw7qolZ-C6Oe-ndAA&usqp=CAU',
                                                            ),
                                                          ),

                                                          Column(
                                                            children: [
                                                              Row(children:
                                                              [
                                                                Expanded(
                                                                  child: Text(

                                                                    cubit.commonProduct!.data!.data![index].name!,
                                                                    // 'برتقال عصير',
                                                                    style: TextStyle(color: defColor ,
                                                                        fontWeight: FontWeightManager.semiBold),
                                                                    softWrap: true,
                                                                    maxLines: 2,
                                                                    overflow: TextOverflow.ellipsis,),
                                                                ) ,
                                                                Spacer(),
                                                                Text(
                                                                  cubit.commonProduct!.data!.data![index].price.toString() ,
                                                                  // ' 5.75 ليرة ',
                                                                  style: TextStyle(color: btnColor ,
                                                                      fontWeight: FontWeightManager.semiBold),)
                                                              ],),

                                                              SizedBox(height: 5,),

                                                              Row(children:
                                                              [
                                                                Text(
                                                                    '${cubit.commonProduct!.data!.data![index].weight} '
                                                                        '${cubit.commonProduct!.data!.data![index].weightUnit }',
                                                                    // '1 حبة',

                                                                    style: TextStyle(color: defColor ,
                                                                        fontWeight: FontWeightManager.semiBold)) ,
                                                                Spacer(),
                                                                Text(
                                                                  // '5.75 ' ,
                                                                  cubit.commonProduct!.data!.data![index].oldPrice.toString() ,
                                                                  style: TextStyle(decoration: TextDecoration.lineThrough ,
                                                                      color: gray ,
                                                                      fontWeight: FontWeightManager.semiBold),)
                                                              ],)
                                                            ],
                                                          ),



                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  cubit.commonProduct!.data!.data![index].canBuy != false ?
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
                                                  ) : Container()

                                                ]))));

                            }

                            ,
                            separatorBuilder: (context, index)=> SizedBox(width: 10,),
                            itemCount:  cubit.commonProduct!.data!.data!.length),
                      )


                  ) : Container() ,


                ]
            ),
          ),



          bottomNavigationBar:
          product?.canBuy == true ?

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0 , vertical: 15),
            child: Container(
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                  color: btnColor,
                  // border: Border.all(),
                  borderRadius: BorderRadius.circular(50)
              ),
              child: MaterialButton(onPressed: (){

                Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );

                print('add to cart');

              } ,
                child: Text(addCart,
                  style: TextStyle(
                    color: Colors.white ,
                    fontWeight: FontWeightManager.semiBold ,
                    fontFamily: fontFamily ,
                    fontSize: FontSizeManager.s12 ,
                  ),  ),),
            ),
          ) :
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0 , vertical: 15),
            child: Container(
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                  color: gray,
                  // border: Border.all(),
                  borderRadius: BorderRadius.circular(50)
              ),
              child: MaterialButton(onPressed: null ,
                child: Text(addCart,
                  style: TextStyle(
                    color: Colors.white ,
                    fontWeight: FontWeightManager.semiBold ,
                    fontFamily: fontFamily ,
                    fontSize: FontSizeManager.s12 ,
                  ),  ),),
            ),
          ),

        ) ;
      },
    );


  }
}
