
import 'package:flutter/material.dart';
import 'package:wasel/data/local/cashHelper.dart';
import 'package:wasel/models/cartModel.dart';
import 'package:wasel/models/productModel.dart';

Color defColor = Color(0xFF1C2945);
Color btnColor = Color(0xff7EC242);
Color defborderColor = Color(0xFF8097B8);
Color gray = Color(0xFF707070);
String sign = '₺';


String? lang   ;
dynamic token  ;

// List<DataInfo> cartProducts = [];
List<dynamic> cartProducts = [];


List <CartModel> cartsList = [];
int? paymentID ;
dynamic addressID ;





const String loginString = 'سجل الدخول أو أنشئ حساب جديد' ;
const String regString = 'انشاء حساب جديد' ;
const String log1 = 'برجاء تسجيل الدخول' ;
const String pass = 'كلمة المرور' ;
const String log2 = 'أو الدخول باستخدام' ;
const String log3 = 'تسجيل حساب جديد' ;
const name = 'الاسم' ;
const success = 'تم تفعيل حسابك بنجاح' ;
const email = 'البريد الالكترونى';
const verify = 'قم بادخال رمز التفعيل المرسل الي هاتفك رقم ' ;
const addCart = 'اضف الي السلة' ;



dynamic imgIcon = [137, 80, 78, 71, 13, 10, 26, 10, 0, 0, 0, 13, 73, 72, 68, 82, 0, 0, 0, 150, 0, 0, 0, 190, 8, 6, 0, 0, 0, 215, 254, 246, 185, 0, 0, 0, 1, 115, 82, 71, 66, 0, 174, 206, 28, 233, 0, 0, 0, 4, 115, 66, 73, 84, 8, 8, 8, 8, 124, 8, 100, 136, 0, 0, 32, 0, 73, 68, 65, 84, 120, 156, 236, 189, 73, 143, 36, 73, 150, 38, 246, 61, 17, 209, 221, 118, 243, 61, 150, 140, 140, 136, 204, 200, 165, 171, 58, 179, 178, 171, 103, 138, 51, 108, 212, 128, 135, 1, 7, 32, 47, 68, 15, 6, 32, 1, 14, 192, 255, 192, 27, 127, 3, 79, 188, 13, 8, 94, 120, 225, 133, 7, 18, 24, 162, 49, 24, 22, 217, 236, 169, 154, 238, 174, 174, 37, 247, 204, 136, 140, 8, 143, 112, 15, 95, 108, 55, 211, 93, 69, 30, 15, 106, 238, 233, 238, 97, 238, 97, 238, 110, 30, 75, 85, 126, 1, 11, 211, 205, 85, 69, 85, 63, 123, 242, 228, 147, 39, 79, 128, 31, 240, 3, 126, 192, 15, 248, 1, 63, 224, 7, 252, 128, 31, 240, 3, 126, 192, 27, 1, 122, 213, 5, 120, 77, 113, 222, 231, 194, 87, 82, 138, 55, 24, 226, 85, 23, 224, 7, 252, 97, 226, 15, 221, 98, 189, 238, 247, 247];