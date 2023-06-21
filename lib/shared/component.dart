

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'style/fonts.dart';

void  navTo(context , widget ) =>
    Navigator.push(context, MaterialPageRoute(builder: (context)=> widget ));





void showToast({
  @required String? msg ,
  @required ToastState? state

}) =>  Fluttertoast.showToast(
    msg: msg! ,
    toastLength : Toast.LENGTH_LONG,
    gravity : ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5 ,
    backgroundColor: changeColorToast(state!),
    textColor: Colors.white,
    fontSize: 16.0
);

enum ToastState { SUCCESS , ERROR , WARNING }

Color changeColorToast( ToastState state)
{
  Color? color ;
  switch(state)
  {
    case ToastState.SUCCESS :
      color = Colors.green ;
      break ;
    case ToastState.ERROR :
      color = Colors.red;
      break ;

    case ToastState.WARNING :
      color = Colors.amber ;
      break ;
  }

  return color ;
}

Widget createString(
    {
      @required String? title,
      @required  Color? color ,
      FontWeight? weight ,
      double? fontSize ,
      String fontFam = fontFamily ,
      int line =3


    }
    ){

  return  Text( title! ,
      maxLines: line ,
      softWrap: true,
      style: TextStyle(
          color: color ,
          fontFamily: fontFamily ,
          fontSize: fontSize ,
          fontWeight: weight,
          overflow:TextOverflow.ellipsis

      ));
}