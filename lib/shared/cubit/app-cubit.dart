
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasel/data/endPoint.dart';
import 'package:wasel/data/local/cashHelper.dart';
import 'package:wasel/data/network/dioHelper.dart';
import 'package:wasel/models/addressModel.dart';
import 'package:wasel/models/categoryModel.dart';
import 'package:wasel/models/contactUsModel.dart';
import 'package:wasel/models/favModel.dart';
import 'package:wasel/models/locationModel.dart';
import 'package:wasel/models/orderModel.dart';
import 'package:wasel/models/paymentModel.dart';
import 'package:wasel/models/productCategory.dart';
import 'package:wasel/models/productModel.dart';
import 'package:wasel/models/sendOrderModel.dart';
import 'package:wasel/models/sliderImgModel.dart';
import 'package:wasel/models/userModel.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/views/carts/cart.dart';
import 'package:wasel/views/category/category.dart';
import 'package:wasel/views/homeScreen/homeScreen.dart';
import 'package:wasel/views/profile/profile.dart';
import 'package:wasel/views/search/search.dart';
import 'package:wasel/models/productModel.dart' as DInfo;
import 'package:localstore/localstore.dart';


class AppCubit extends Cubit<AppState>
{

 AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

 int currentIndex = 0;
 // bool isNavigate = false ;


 List<Widget> screens = [
          HomeScreen(),
          SearchScreen(),
          CategoryScreen(),
          CartScreen() ,
          ProfileScreen()];


 Color selectNavBar = btnColor ;
 Color unselectNavBar = gray ;


 changeBottomNav(int index) {
  currentIndex = index;

  emit(ChangeBottomNav());

 }


 dynamic total = CashHelper.getData(key: 'total' ) ??  0.0 ;


 // int initalQuantity = 1 ;
 // addQuantity(DInfo.DataInfo? proCart )
 addQuantity(dynamic proCart  )

 {
   // dynamic x = proCart?.toJson() ;
   // x['initalQuantity'] ++  ;


     proCart?.initalQuantity = (proCart.initalQuantity! + 1) ;
     // total = tot + proCart.price * proCart.initalQuantity  ;
     total = CashHelper.getData(key: 'total' ) + proCart.price  ;
       CashHelper.saveData(key: 'total' , value: total);

   print('*9******* ${total }');

   // CashHelper.saveData(key: 'total' , value: total);

   // print('000000000000000 ${proCart?.total }');
   // initalQuantity ++ ;
   emit(AddQuantity());

 }


 // minusQuantity(DInfo.DataInfo? proCart)
 minusQuantity(dynamic proCart  )

 {
   if( (proCart?.initalQuantity)!  > 0)

     proCart?.initalQuantity = (proCart.initalQuantity! - 1) ;

     // total = tot -   proCart.price * proCart.initalQuantity  ;
      total = CashHelper.getData(key: 'total' ) -   proCart.price   ;

         CashHelper.saveData(key: 'total' , value: total);
 // total -=   proCart?.price ;
    // CashHelper.saveData(key: 'total' , value: total);

    if(total < 0 ) { total =0 ;
    CashHelper.saveData(key: 'total' , value: total);

    }

    print('000000000000000 ${total }');

   emit(MinusQuantity());
 }





/*
 changeFavorites()
 {

     isFav = !isFav ;

      emit(Fav());

  }*/

 final List locale =
 [
   {'name': 'English','locale': 'en' },
   {'name':'Arabic','locale':  'ar' },
   {'name':'Turkish','locale': 'tr' },

 ];


 String langg = CashHelper.getData(key: 'langName')?? "English" ;
/*
 updateLanguage(Locale locale)async
 {
   Get.back();
   langg = locale.toString() ;
   await  Get.updateLocale(locale);

   emit(UpdateLanguage());
  }*/


 updateLanguage(String locale , String _lan )async
 {
   // Get.back();
   langg = _lan ;

   await  Get.updateLocale(Locale(locale)).then((value)
     {

      CashHelper.saveData(key: 'lang', value: locale );
      CashHelper.saveData(key: 'langName', value: _lan );
       emit(UpdateLanguage());

       }

   );

   emit(UpdateLanguage());
 }



  Map<int,bool> favList = {};

 ProductModel? productModel ;


 getAllProducts()
 {

    emit(GetAllProductsLoadingState());
    DioHelper.getData(
        url: PRODUCTS ,
    )!.
    then((value) {
      // print(value.data);

      productModel = ProductModel.FromJson(value.data);
      print('777777 ${productModel?.data?.data?[1].name}');


      emit(FAVHomeLoadingState());

      productModel?.data?.data?.forEach((e) {
        checkFav(e.id)!.
        then((value)
        {
          favList.addAll({ e.id! : value});
          emit(FAVHomeSuccessState());
        }).
        catchError((e){
          print(e.toString());
          emit(FAVHomeErorrState());
        });

      });

      print('hhhhhh ${favList}');

      emit(GetAllProductsSuccessState());
    }).
    catchError((e){
      print(e.toString());
      emit(GetAllProductsErorrState());
    });
 }



 CategoryModel? categoryModel ;

  getAllCategories()
  {
    emit(GetAllCategoriesLoadingState());
    DioHelper.getData(
      url: CATEGORIES ,
    )!.
    then((value) {
      // print(value.data);

      categoryModel = CategoryModel.FromJson(value.data);

      emit(GetAllCategoriesSuccessState());
    }).
    catchError((e){
      print(e.toString());
      emit(GetAllCategoriesErorrState());
    });
  }




  ProductOFCategory? productOFCategory  ;

  /*getAllProductsOFCategories(
    {
     @required int? id ,

    })
  {
    emit(GetAllProductCategoriesLoadingState());
    DioHelper.getData(
      url: 'categories/$id' ,
    )!.
    then((value) {

      print(value.data);

      productOFCategory = ProductOFCategory.FromJson(value.data) ;

      emit(GetAllProductCategoriesSuccessState());
    }).
    catchError((e){
      print(e.toString());
      emit(GetAllProductCategoriesErorrState());
    });
  }*/


Future<ProductOFCategory>? getAllProductsOFCategories(
      {
        @required int? id ,

      })async {
   try {
     emit(GetAllProductCategoriesLoadingState());
     dynamic data = await DioHelper.getData(
       url: 'categories/$id',);

     print('741 ${data.data}');
     productOFCategory = ProductOFCategory.FromJson(data.data);

     emit(GetAllProductCategoriesSuccessState());
   }
   catch (e) {
     print(e.toString());
     emit(GetAllProductCategoriesErorrState());
   }
   return productOFCategory! ;
 }



UserModel? userModel ;
 editInfoData({
     @required String? name ,
     @required String? phone ,
     @required String? email ,
    String? avatar ,

 })
 {
   emit(EditProfileLoadingState());
   DioHelper.postData(
       url: PROFILE ,
       data:
       {
         "name": name,
         "email":email,
         "phone": phone,
         "avatar":avatar
       })!
       .then((value) {
         userModel = UserModel.FromJson(value.data);
         emit(EditProfileSuccessState(userModel!));
   }).
   catchError((e){
     print(e.toString());
     emit(EditProfileErorrState());
   });
 }




 ProductModel? relatedProduct ;

Future<ProductModel> getRelatedProducts({
    @required int? id
})async
{
    try {
      emit(RelatedProductsLoadingState());

      dynamic data = await DioHelper.getData(url: 'related/products/$id');

      relatedProduct = ProductModel.FromJson(data.data);
      emit(RelatedProductsSuccessState());
    } catch (e) {
      print(e.toString());
      emit(RelatedProductsErorrState());
    }

    return relatedProduct! ;

  }




  ProductModel? commonProduct ;

 Future<ProductModel> getCommonProducts({
    @required int? id
  })async
 {
   try {
     emit(CommonProductsLoadingState());

     dynamic data = await DioHelper.getData(
         url: 'similar/products/$id');


     commonProduct = ProductModel.FromJson(data.data);
     emit(CommonProductsSuccessState());
   }
   catch (e) {
     print(e.toString());
     emit(CommonProductsErorrState());
   }
   return commonProduct! ;
 }




  SliderImgModel? sliderModel ;
 getSliderImage()
 {
   emit(GetSliderImageLoadingState());

   DioHelper.getData(
       url:SLIDER
   )!.
   then((value) {

     print('slider ${value.data}');

     sliderModel = SliderImgModel.FromJson(value.data);
     emit(GetSliderImageSuccessState());
   })
       .catchError((e){
         print(e.toString());
         emit(GetSliderImageErorrState());
   });
 }



 ContactModel? contactModel ;

 getContactUs()
 {
   emit(ContactUSLoadingState());
   DioHelper.getData(url: CONTACTUS )!.
   then((value) {

     print('ddd ${value.data}');

     contactModel = ContactModel.FromJson(value.data);

     emit(ContactUSSuccessState(contactModel));
   }).
   catchError((e){
     print(e.toString());

     emit(ContactUSErorrState());
   });
 }



/*
 addToFav(int? id)
 {
   emit(ADDTOFAVLoadingState());
   DioHelper.postData(
       url: 'toggleFavored/$id',

        )!.
   then((value)async{

     print('ggggg ${value.data}');

    bool x =await  checkFav(id)!;
     favList[id! ] = x ;


     // checkFav(id)!.then((value) =>  favList[id! ] = value);

     emit(ADDTOFAVSuccessState());
   })
       .catchError((e){
         print(e.toString());
         emit(ADDTOFAVErorrState());
   });


 }*/


 Future addToFav(int? id)async
  {
    try {
      emit(ADDTOFAVLoadingState());

      dynamic data = await DioHelper.postData(
          url: 'toggleFavored/$id');

      print('ggggg ${data.data}');

      bool x =await  checkFav(id)!;
      favList[id! ] = x ;


      emit(ADDTOFAVSuccessState());
    }
    catch(e){
      print(e.toString());
      emit(ADDTOFAVErorrState());
    };


  }




 /*checkFav(int? id)
 {
   emit(CheckFAVLoadingState());

   DioHelper.getData(
       url:'checkFavored/$id')!.
   then((value){

     isFav = value.data ;

     emit(CheckFAVSuccessState());
   }).
   catchError((e){
     print(e.toString());
     emit(CheckFAVErorrState());
   });

 }*/



 Future<bool>? checkFav(int? id)async {
   bool? isFav   ;

   try {

      {
        emit(CheckFAVLoadingState());

        dynamic data = await DioHelper.getData(url: 'checkFavored/$id');


        isFav = data.data;

        emit(CheckFAVSuccessState());
        return data.data! ;
      }
     }
    catch (e) {
      print(e.toString());
      emit(CheckFAVErorrState());
      }
    return isFav! ;

 }



  FavModel? favModel ;

 getAllFav()
 {
   emit(GETAllFAVLoadingState());

   DioHelper.getData(
       url: ALLFAV )!.
       then((value){

     print('favvvv ${value.data}');

     favModel =FavModel.fromJson(value.data);
     print('fdata ${favModel?.data?.length}');

     emit(GETAllFAVSuccessState());
   }).
   catchError((e){
     print(e.toString());
     emit(GETAllFAVErorrState());
   });

 }


/*
 favInHome()
 {

   /*  productModel?.data?.data?.forEach((element) {

      if(favModel != null)
        {
          favModel?.data?.forEach((e) {

            if( e.product?.id == element.id)
              {
                element.isFavored = e.product?.isFavored ;

                // emit(FFFFF());

              }
            // emit(FFFFF());
          });
          // emit(FFFFF());

        }
      // emit(FFFFF());

   });

     emit(FFFFF());*/

   emit(FAVHomeLoadingState());

   productModel?.data?.data?.forEach((e) {
     checkFav(e.id)!.
     then((value)
     {
       favList.addAll({ e.id! : value});
       emit(FAVHomeSuccessState());
     }).
     catchError((e){
       print(e.toString());
       emit(FAVHomeErorrState());
     });

   });

   print('hhhhh ${favList}');


 }*/


  LocationModel? locationModel ;

 getCities()
 {

   emit(GetCitiesLoadingState());

   DioHelper.getData(
       url: 'select/$CITIES' )!.
   then((value) {
     print('cities ${value.data}');
     locationModel = LocationModel.fromJson(value.data);
     emit(GetCitiesSuccessState());

   }).
   catchError((e){
     emit(GetCitiesErorrState());
   });
 }



 addSuggestion({
    @required String? name ,
    @required String? desc ,

 })
 {
   emit(ADDSUggestionLoadingState());
   DioHelper.postData(
       url: ADDSUGGESTION ,
       data:
       {
         'name': name ,
         'description': desc
       })!
       .then((value)
          {

           emit(ADDSUggestionSuccessState());
          })
         .catchError((e){
         print(e.toString());
         emit(ADDSUggestionErorrState());
      });

 }



  PaymentModel?  paymentModel ;

  getAllPayments()
 {
    emit(GetPaymentLoadingState());
    DioHelper.getData(url: PAYMENT )!.
    then((value) {
      paymentModel = PaymentModel.fromJson(value.data);
      emit(GetPaymentSuccessState());
    }).
    catchError((e){

      print(e.toString());
      emit(GetPaymentErorrState());
    });
 }




 selectPayment(int id)
 {
   emit(SelectPaymentLoadingState());
   DioHelper.getData(url: 'PAYMENT/$id')!.
   then((value){

     emit(SelectPaymentSuccessState());
   }).
   catchError((e){
     print(e.toString());
     emit(SelectPaymentErorrState());
   });
 }



  SENDORDERModel ? sendOrderModel ;
 sendOrder({
     // String? couponID ,
     dynamic cartItems ,
     int? paymentID


    })
 {
  emit(SendOrderLoadingState());

  print('xxxxxx ${cartItems[0].id }');
  print('yyyyyyy ${ CashHelper.getData(key: 'addresID') }');


  DioHelper.postData(
      url: '$ORDERS/store',
      data: {
      'address_id': CashHelper.getData(key: 'addresID')   ,
      // 'coupon_code': couponID ?? 'code-15',
      'cart_items':  cartItems ,
      'payment_id': paymentID
      })!.
       then((value){

         print('senddddd ${value.data}');

         sendOrderModel = SENDORDERModel .fromJson(value.data);
         print('senddddd555 ${sendOrderModel?.data?.id}');

         emit(SendOrderSuccessState());
         })
      .catchError((e){
        print(e.toString());
        emit(SendOrderErorrState());
  });
 }





  AddressModel? addressModel ;

  getAddressID({
    String? address ,
    String? lat   ,
    String? lng ,
    String desc = 'desc' ,
    int isDefault = 1 ,
    // dynamic cityID =1,
    // dynamic regionID =1

   })

 {

   // ya29.a0AfB_byAOXpvZgm-viiG_9fh3QBF-bygHIqU6aeiykp6tck85h_gw-yi  google
   // 173|dhAmPXrKm8CJNz61dcvFkHZDrbWRTTQ0lwmNQFsx  api

   print('ccccccc ${CashHelper.getData(key: 'token')}');
   print('address ${address}');

   print('lat ${lat}');
   print('long ${lng}');



   emit(GetAddressLoadingState());
      DioHelper.postData(
          url: ADDRESS,
         // token: CashHelper.getData(key: 'token') ,
         data: {
           'address': address,
           // 'city_id': cityID ,
           // 'region_id': regionID ,
           'lat': lat ?? CashHelper.getData(key: 'lat') ,
           'lng': lng ??  CashHelper.getData(key: 'long') ,
           'description': desc ,
           'is_default': isDefault ,
         })!.
      then((value) async {
        print('748798 ${value.data }');
        print('748798 ${CashHelper.getData(key: 'token') }');

        addressModel = AddressModel.fromJson(value.data);
        await CashHelper.saveData(key: 'addresID' , value:  addressModel?.data?.id );
        emit(GetAddressSuccessState());

      }).catchError((e){
        print(e.toString());
        emit(GetAddressErorrState());
      });





 }


  OrderModel?  orderModel ;
 getAllOrders()
 {
   emit(GetAllOrdersLoadingState());
   DioHelper.getData(url: ORDER )!
       .then((value){
         print('orderrrrr ${value.data}');
         orderModel = OrderModel.fromJson(value.data);
         print('orderrrrr ${orderModel?.bdata?.bdata?.length}');

         emit(GetAllOrdersSuccessState());
   })
       .catchError((e){
         emit(GetAllOrdersErorrState());
   });
 }

/*
 saveItemCarts(dynamic obj , int id )async
 {

   emit(SaveItemLoadingState());
   final db = Localstore.instance;

   // gets new id
  // dynamic  id = db.collection('pro').doc().id;

// save the item
//   await db.collection('pro').doc(id).set({
  await db.collection('pro').doc('$id').set(
      {
   'id': obj.id ,
   'name': obj.name ,
  'description': obj.description ,
  'mini_description': obj.miniDescription ,
  'price': obj.price ,
  'old_price': obj.oldPrice ,
  'weight': obj.weight ,
 'weight_unit': obj.weightUnit ,
  'stock': obj.stock ,
  'stock_type': obj.stockType ,
  'can_buy': obj.canBuy ,
  'code': obj.code ,
  'initalQuantity': obj.initalQuantity ,


   'images': obj.images ,
   'default_image' : obj.defaultImage ,

 'customFields': obj.customFields ,


  'availableOffer': obj.availableOffer ,

  'textOptions': obj.textOptions ,
  'selectOptions': obj.selectOptions ,

   }
   ).then((val)=> print('vxc ${val}'));

  /* await db.collection('pro').doc('0').set(obj.toJson()).then((val)=> print('vxc ${val}'));*/

   emit(SaveItemSuccessState());
 }

dynamic saveCart = [];

 getItemCart()
 {
   saveCart = [];
   final db = Localstore.instance;
   db.collection('pro').get().then((value) {

      // saveCart.add(ProductModel.FromJson(value!));
      print('ccccc ${value?['/pro/0']} ');

      saveCart.add (DInfo.DataInfo.fromJson(value?['/pro/0'])) ;

      print('ccccc22222 ${saveCart.length } ');



      // print(' gggggggg ${ saveCart.length }');

    });
   emit(GETItemLoadingState());
 }

 */


notifyNum(int no)
 {
  CashHelper.saveData(key: 'notificationNum', value: no );
   emit(NoNotify());
 }

}


