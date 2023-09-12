
import 'package:wasel/models/userModel.dart';

abstract class AppLoginState {}

class AppLoginInitalState extends AppLoginState {}


class AppLoginLoadingState extends AppLoginState {}
class AppLoginSuccessState extends AppLoginState {
  final UserModel? userModel ;
  AppLoginSuccessState(this.userModel);
}
class AppLoginErrorState extends AppLoginState {

}

class EditLoadingState extends AppLoginState {}

class EditSuccessState extends AppLoginState {
  final UserModel? editModel ;
  EditSuccessState(this.editModel);
}
class EditErrorState extends AppLoginState {}




class GoogleLoadingState extends AppLoginState {}
class GoogleSuccessState extends AppLoginState {
  // final UserModel? userModel ;
  // GoogleSuccessState(this.userModel);
}
class GoogleErrorState extends AppLoginState {}