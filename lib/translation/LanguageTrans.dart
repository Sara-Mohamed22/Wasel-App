import 'package:get/get.dart';

import 'ar.dart';
import 'en.dart';
import 'tr.dart';

class Language extends Translations
{
  @override
  Map<String, Map<String, String>> get keys => {

     "en" : en ,
     "ar" : ar ,
     "tr" : tr ,
  };

}