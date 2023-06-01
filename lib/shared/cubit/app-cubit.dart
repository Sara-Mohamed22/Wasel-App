
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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


 // isNavigateFunc(bool nav )
 // {
 //   isNavigate = nav ;
 //   emit(ISNavigate());
 //  }


}