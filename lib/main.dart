// @dart=2.19.0

import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasel/modules/login/app-cubitLogin.dart';
import 'package:wasel/modules/register/app-cubitRegister.dart';
import 'package:wasel/observer.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/views/login/loginScreen1.dart';

import 'data/local/cashHelper.dart';
import 'data/local/sqflitDB.dart';
import 'data/network/dioHelper.dart';
import 'layout/myHomeScreen.dart';
import 'shared/cubit/app-cubit.dart';
import 'translation/LanguageTrans.dart';
import 'views/login/loginScreen2.dart';
import 'views/maps/mapScreen.dart';
import 'views/payment/payment.dart';



// '>=3.0.0 <4.0.0'
// dio: ^5.1.2
// location: 4.4.0

/*
*  shared_preferences: ^2.1.1
  dio:
  bloc: ^8.1.1
  flutter_bloc: ^8.1.2
  fluttertoast: ^8.2.1
  smooth_page_indicator: ^1.1.0
  font_awesome_flutter: ^10.4.0
  intl_phone_field: ^3.1.0
  url_launcher: ^6.1.11
  flutter_verification_code: ^1.1.6
  google_maps_flutter: ^2.2.7
  geolocator: ^9.0.2
  geocoding: ^2.1.0
  location:
  flutter_image_slideshow: ^0.1.5
  flutter_rating_bar: ^4.0.1
  get: ^4.6.5
  language_picker: ^0.4.3
  conditional_builder_null_safety: ^0.0.6
  firebase_phone_auth_handler:
  sms_autofill: ^2.3.0
  shimmer: ^3.0.0
  flutter_spinkit: ^5.2.0
  sqflite: ^2.2.8+4
  path:
  localstore: ^1.3.5
  flutter_facebook_auth:
  firebase_core:
  firebase_auth: ^0.15.2
  google_sign_in:
  flutter_login_facebook:
* */


void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();
  HttpOverrides.global = MyHttpOverrides();

  //  Directory dir = await getApplicationDocumentsDirectory();
  //
  // await Hive.initFlutter(dir.path );
  // await Hive.openBox('myData');

  SqflitDB().initalDb();
  await CashHelper.init();
  DioHelper.init();

  lang= CashHelper.getData(key: 'lang');
  print('langggg $lang');

  token = CashHelper.getData(key: 'token');

   //CashHelper.removeData(key: 'token');

  print('token $token');


  Widget? start ;

  if(token != null)
    {
      // if(addressID != null )
      //   {
          start = HomeScreen();

      //   }
      // else
      //   {
      //     start = MapScreen() ;
      //   }
    }

  else
  {
    start = LoginScreen1();
  }


  runApp( MyApp(start: start ,));
}

class MyApp extends StatelessWidget {
  final Widget? start ;
  const MyApp({super.key , this.start });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(create: (context) => AppCubit()..
        getAllProducts()..
        getAllCategories()..
        getSliderImage()..
        getContactUs()..
        getAllFav()..
        getCities()..
        getAllPayments()..
        getAllOrders()

        ),

        BlocProvider<AppRegisterCubit>(create: (context)=> AppRegisterCubit() ),
        BlocProvider<AppLoginCubit>(create: (context)=> AppLoginCubit() ),


      ],

      child: GetMaterialApp(

          translations: Language() ,
          // locale: Get.deviceLocale,
          locale: Locale( lang ?? 'Get.deviceLocale'),

          fallbackLocale: Locale('en'),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: const  Color(0xFF1C2945),

              ),
          //
          //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
          //     selectedItemColor: btnColor ,
          //     unselectedItemColor: gray
          //
          // )

          ),


          home:
            // LoginScreen2()
          // VerifyScreen()
          // SuccessScreen()
          start
         //    MapScreen()
          // PaymentScreen()
          // SplashScreen(),
            // HomeScreen()
        ),

    );
  }
}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


