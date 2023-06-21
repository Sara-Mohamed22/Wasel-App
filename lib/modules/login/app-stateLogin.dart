
import 'package:wasel/models/userModel.dart';

abstract class AppLoginState {}

class AppLoginInitalState extends AppLoginState {}


class AppLoginLoadingState extends AppLoginState {}
class AppLoginSuccessState extends AppLoginState {
  final UserModel? userModel ;
  AppLoginSuccessState(this.userModel);
}
class AppLoginErrorState extends AppLoginState {}