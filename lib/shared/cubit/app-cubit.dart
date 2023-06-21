
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasel/data/endPoint.dart';
import 'package:wasel/data/local/cashHelper.dart';
import 'package:wasel/data/network/dioHelper.dart';
import 'package:wasel/models/productModel.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/views/carts/cart.dart';
import 'package:wasel/views/category/category.dart';
import 'package:wasel/views/homeScreen/homeScreen.dart';
import 'package:wasel/views/profile/profile.dart';
import 'package:wasel/views/search/search.dart';

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



 int initalQuantity = 0 ;
 addQuantity()
 {
   initalQuantity ++ ;
   emit(AddQuantity());
 }


 minusQuantity()
 {
   if(initalQuantity > 0)
   initalQuantity -- ;
   emit(MinusQuantity());
 }



 bool isFav = false ;

 changeFavorites()
 {

     isFav = !isFav ;

      emit(Fav());

  }

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

      emit(GetAllProductsSuccessState());
    }).
    catchError((e){
      print(e.toString());
      emit(GetAllProductsErorrState());
    });
 }



  getAllCategories()
  {
    emit(GetAllCategoriesLoadingState());
    DioHelper.getData(
      url: CATEGORIES ,
    )!.
    then((value) {
      print(value.data);


      emit(GetAllCategoriesSuccessState());
    }).
    catchError((e){
      print(e.toString());
      emit(GetAllCategoriesErorrState());
    });
  }


}