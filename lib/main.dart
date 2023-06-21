import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasel/modules/login/app-cubitLogin.dart';
import 'package:wasel/modules/register/app-cubitRegister.dart';
import 'package:wasel/observer.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/views/login/loginScreen1.dart';

import 'data/local/cashHelper.dart';
import 'data/network/dioHelper.dart';
import 'layout/myHomeScreen.dart';
import 'shared/cubit/app-cubit.dart';
import 'translation/LanguageTrans.dart';
import 'views/maps/mapScreen.dart';
import 'views/splash/splashScreen.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  HttpOverrides.global = MyHttpOverrides();

  await CashHelper.init();
  DioHelper.init();

  lang= CashHelper.getData(key: 'lang');
  print('langggg $lang');

  token = CashHelper.getData(key: 'token');

  print('token $token');


  Widget? start ;

  if(token != null)
    {
      start = HomeScreen();
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

        BlocProvider(create: (context)=> AppCubit()..getAllProducts()..getAllCategories() ),
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
          start
          // MapScreen()
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


