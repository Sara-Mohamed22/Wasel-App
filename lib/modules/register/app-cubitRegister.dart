
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel/data/endPoint.dart';
import 'package:wasel/data/network/dioHelper.dart';
import 'package:wasel/models/userModel.dart';
import 'package:wasel/models/verifyModel.dart';

import 'app-stateRegister.dart';

class AppRegisterCubit extends Cubit<AppRegisterState>
{


  AppRegisterCubit() : super(AppRegisterInitialState());

  static  AppRegisterCubit get(context) => BlocProvider.of(context) ;



  UserModel? userModel ;

   userRegister({

    @required String? name ,
       String? email ,
     @required String? phone ,
     @required String? pass ,
     String? avater

      })
   {

     emit(AppRegisterLoadingState());

     DioHelper.postData(
         url: REGISTER ,
         data: {
           "name" : name ,
           "email" : email,
           "phone" : phone ,
            "password": pass ,
            "avater" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2isZuHGKcPICoPLlOGjc8gF0ZxalLKOirvQ&usqp=CAU"
         })!.
       then((value) {

       print('vall ${value.data}');

       userModel = UserModel.FromJson(value.data);

       emit(AppRegisterSuccessState(userModel));

     }).
     catchError((e)
     {
       print('eerror ${e.toString()}');
       emit(AppRegisterErrorState());
     });

   }







 /*  sendCodeVerify({
       @required String? phone
      })
   {

     emit(SendCodeVerifyLoadingState());

     DioHelper.postData(
         url: 'verification/$SEND',
         data: {
           "phone" : phone
         })!.
     then((value)
     {
       print('recoddde ${value.data}');

       verifyModel = VerifyModel.FromJson(value.data);
       emit(SendCodeVerifySuccessState(verifyModel));

     }).
     catchError((e)
     {
       print('exx ${e.toString()}');

       emit(SendCodeVerifyErrorState());
     });
   }
*/



/* Future<VerifyModel> sendCodeVerify({
    @required String? phone
  })async
  {
try {
  emit(SendCodeVerifyLoadingState());

  dynamic data = await DioHelper.postData(
      url: 'verification/$SEND',
      data: {
        "phone": phone
      });
  print('coddde ${data.value}');

  verifyModel = VerifyModel.FromJson(data);
  emit(SendCodeVerifySuccessState(verifyModel));
  }
    catch(e)
    {
      print('exx ${e.toString()}');

      emit(SendCodeVerifyErrorState());
    };

   return verifyModel! ;
  }*/



  UserModel? userVerifyModel ;

  VerifyCodeFunc({
    @required String? phone ,
    @required String? code ,

  })
  {

    emit(VerifyCodeLoadingState());

    DioHelper.postData(
        url: 'verification/$VERIFY',
        data: {
          "phone" : phone ,
          "code" : code
        })!.
    then((value)
    {
      print('verify ${value.data}');

      userVerifyModel = UserModel.FromJson(value.data);
      emit(VerifyCodeSuccessState(userVerifyModel));

    }).
    catchError((e)
    {
      print('exx ${e.toString()}');

      emit(VerifyCodeErrorState());
    });
  }


  VerifyModel? verifyModel ;

  resendCodeVerify({
    @required String? phone
  })
  {

    emit(RESendCodeVerifyLoadingState());

    DioHelper.postData(
        url: 'verification/$RESEND',
        data: {
          "phone" : phone
        })!.
    then((value)
    {
      print('recoddde ${value.data}');

      verifyModel = VerifyModel.FromJson(value.data);
      emit(RESendCodeVerifySuccessState(verifyModel));

    }).
    catchError((e)
    {
      print('exx ${e.toString()}');

      emit(RESendCodeVerifyErrorState());
    });
  }

}