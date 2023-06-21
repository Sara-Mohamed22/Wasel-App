
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel/data/endPoint.dart';
import 'package:wasel/data/network/dioHelper.dart';
import 'package:wasel/models/userModel.dart';

import 'app-stateLogin.dart';

class AppLoginCubit extends Cubit<AppLoginState>
{

  AppLoginCubit() : super(AppLoginInitalState());


 static AppLoginCubit get(context) => BlocProvider.of(context);

  UserModel? userModel ;


  userLogin({

    @required String? phone ,
    @required String? pass ,

  })
  {

     emit(AppLoginLoadingState());

    DioHelper.postData(
        url: LOGIN ,
        data: {
          "username" : phone ,
          "password": pass ,
        })!.
    then((value) {

      print('loginInfo ${value.data}');

      userModel = UserModel.FromJson(value.data);

       emit(AppLoginSuccessState(userModel));

    }).
    catchError((e)
    {
      print('eerror ${e.toString()}');
       emit(AppLoginErrorState());
    });

  }


}