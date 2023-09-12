import 'package:wasel/models/contactUsModel.dart';
import 'package:wasel/models/productModel.dart';
import 'package:wasel/models/userModel.dart';

abstract class AppState {}

class AppInitialState extends AppState {}
class AppLoadingState extends AppState {}

class ChangeBottomNav extends AppState {}

class ISNavigate extends AppState {}


class AddQuantity extends AppState {}
class MinusQuantity extends AppState {}



class Fav extends AppState {}



class UpdateLanguage extends AppState {}



class GetAllProductsLoadingState extends AppState {}
class GetAllProductsSuccessState extends AppState {}
class GetAllProductsErorrState extends AppState {}


class GetAllCategoriesLoadingState extends AppState {}
class GetAllCategoriesSuccessState extends AppState {}
class GetAllCategoriesErorrState extends AppState {}



class GetAllProductCategoriesLoadingState extends AppState {}
class GetAllProductCategoriesSuccessState extends AppState {}
class GetAllProductCategoriesErorrState extends AppState {}


class EditProfileLoadingState extends AppState {}
class EditProfileSuccessState extends AppState {
  late UserModel userModel ;
  EditProfileSuccessState(this.userModel);
}
class EditProfileErorrState extends AppState {}



class RelatedProductsLoadingState extends AppState {}
class RelatedProductsSuccessState extends AppState {}
class RelatedProductsErorrState extends AppState {}


class CommonProductsLoadingState extends AppState {}
class CommonProductsSuccessState extends AppState {}
class CommonProductsErorrState extends AppState {}



class GetSliderImageLoadingState extends AppState {}
class GetSliderImageSuccessState extends AppState {}
class GetSliderImageErorrState extends AppState {}



class ContactUSLoadingState extends AppState {}

class ContactUSSuccessState extends AppState {
  late ContactModel? contactModel ;
  ContactUSSuccessState(this.contactModel);
}
class ContactUSErorrState extends AppState {}



class ADDTOFAVLoadingState extends AppState {}

class ADDTOFAVSuccessState extends AppState {
  ADDTOFAVSuccessState();
}
class ADDTOFAVErorrState extends AppState {}


class CheckFAVLoadingState extends AppState {}

class CheckFAVSuccessState extends AppState {
  CheckFAVSuccessState();
}
class CheckFAVErorrState extends AppState {}


class GETAllFAVLoadingState extends AppState {}

class GETAllFAVSuccessState extends AppState {
  GETAllFAVSuccessState();
}
class GETAllFAVErorrState extends AppState {}



class FAVHomeLoadingState extends AppState {}
class FAVHomeSuccessState extends AppState {}
class FAVHomeErorrState extends AppState {}



class GetCitiesLoadingState extends AppState {}
class GetCitiesSuccessState extends AppState {}
class GetCitiesErorrState extends AppState {}


class ADDSUggestionLoadingState extends AppState {}
class ADDSUggestionSuccessState extends AppState {}
class ADDSUggestionErorrState extends AppState {}


class GetPaymentLoadingState extends AppState {}
class GetPaymentSuccessState extends AppState {}
class GetPaymentErorrState extends AppState {}


class SelectPaymentLoadingState extends AppState {}
class SelectPaymentSuccessState extends AppState {}
class SelectPaymentErorrState extends AppState {}



class SendOrderLoadingState extends AppState {}
class SendOrderSuccessState extends AppState {}
class SendOrderErorrState extends AppState {}


class GetAddressLoadingState extends AppState {}
class GetAddressSuccessState extends AppState {}
class GetAddressErorrState extends AppState {}


class GetAllOrdersLoadingState extends AppState {}
class GetAllOrdersSuccessState extends AppState {}
class GetAllOrdersErorrState extends AppState {}


class SaveItemLoadingState extends AppState {}
class SaveItemSuccessState extends AppState {}
class SaveItemErorrState extends AppState {}

class GETItemLoadingState extends AppState {}


class NoNotify extends AppState {}
