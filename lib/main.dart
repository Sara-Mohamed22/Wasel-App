import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel/observer.dart';
import 'package:wasel/shared/style/constant.dart';

import 'data/local/cashHelper.dart';
import 'data/network/dioHelper.dart';
import 'layout/myHomeScreen.dart';
import 'shared/cubit/app-cubit.dart';
import 'views/maps/mapScreen.dart';
import 'views/splash/splashScreen.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await CashHelper.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider(create: (context)=> AppCubit() ),
      ],
      child: MaterialApp(
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
        // MapScreen()
        // SplashScreen(),
          HomeScreen()
      ),
    );
  }
}



