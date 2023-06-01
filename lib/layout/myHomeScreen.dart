

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/cubit/app-cubit.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit , AppState>(
      listener: (context , state){},
      builder: (context , state){
        return WillPopScope(
          onWillPop: ()async{
            return false ;
          },
          child: Scaffold(


            body: cubit.screens[cubit.currentIndex ],

          ),
        );
      },
    );
  }
}

