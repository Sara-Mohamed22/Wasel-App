
import 'package:wasel/models/userModel.dart';
import 'package:wasel/models/verifyModel.dart';

abstract class AppRegisterState {}

class AppRegisterInitialState extends AppRegisterState {}

class AppRegisterLoadingState extends AppRegisterState {}

class AppRegisterSuccessState extends AppRegisterState {
  final UserModel? userModel ;
  AppRegisterSuccessState(this.userModel);
}


class AppRegisterErrorState extends AppRegisterState {}



class SendCodeVerifyLoadingState extends AppRegisterState {}

class SendCodeVerifySuccessState extends AppRegisterState {
  final VerifyModel? verifyModel ;
  SendCodeVerifySuccessState(this.verifyModel);
}


class SendCodeVerifyErrorState extends AppRegisterState {}



class RESendCodeVerifyLoadingState extends AppRegisterState {}

class RESendCodeVerifySuccessState extends AppRegisterState {
  final VerifyModel? verifyModel ;
  RESendCodeVerifySuccessState(this.verifyModel);
}

class RESendCodeVerifyErrorState extends AppRegisterState {}



class VerifyCodeLoadingState extends AppRegisterState {}

class VerifyCodeSuccessState extends AppRegisterState {
  final UserModel? userVerifyModel ;
  VerifyCodeSuccessState(this.userVerifyModel);

}


class VerifyCodeErrorState extends AppRegisterState {}