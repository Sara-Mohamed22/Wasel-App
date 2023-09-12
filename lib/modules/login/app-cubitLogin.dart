
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel/data/endPoint.dart';
import 'package:wasel/data/local/cashHelper.dart';
import 'package:wasel/data/network/dioHelper.dart';
import 'package:wasel/models/userModel.dart';
import 'package:google_sign_in/google_sign_in.dart';

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



  UserModel? editModel ;
  EditData({
    @required String? name ,
    @required String? phone ,
    @required String? email ,

  })
  {

    emit(EditLoadingState());

    DioHelper.postData(
        url: EDIT,
        data: {
          "name" : name ,
          "email" : email ,
          "phone": phone ,
        })!.
    then((value) {

      print('editttttInfo ${value.data}');

      editModel = UserModel.FromJson(value.data);
      CashHelper.saveData(key: 'name', value: editModel?.data?.name );
      CashHelper.saveData(key: 'phone', value: editModel?.data?.phone );
      CashHelper.saveData(key: 'email', value: editModel?.data?.email );

      emit(EditSuccessState(editModel));

    }).
    catchError((e)
    {
      print('eerror ${e.toString()}');
      emit(EditErrorState());
    });

  }


  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user ;

  Future signInWithGoogle() async {

     emit(GoogleLoadingState());
    try {
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return;

      _user = googleUser;
      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      print('kkk44 ${googleAuth.accessToken} ');
      print('kk555 ${googleAuth.idToken}');
      // print('kk666 ${_us}');
      print('kk555 ${FirebaseAuth.instance.currentUser?.displayName}  ${FirebaseAuth.instance.currentUser?.phoneNumber}');





      await FirebaseAuth.instance.signInWithCredential(credential).then((value) {


        CashHelper.saveData(key: 'name', value: value.user?.displayName ?? '' );
        CashHelper.saveData(key: 'phone', value: value.user?.phoneNumber ?? '' );
        CashHelper.saveData(key: 'email', value: value.user?.email );
        CashHelper.saveData(key: 'avater', value: value.user?.photoURL ?? '');
        CashHelper.saveData(key: 'token', value: googleAuth.accessToken);

      });
      emit(GoogleSuccessState());

    }
    catch(e)
    {

      print('kkk ${e.toString()}');
      emit(GoogleErrorState());

    }
  }


  Future logoutWithGoogle()async {
    await GoogleSignIn().disconnect() ;
    await FirebaseAuth.instance.signOut();

  }

}