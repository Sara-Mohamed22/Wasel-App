import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wasel/data/local/cashHelper.dart';



class DioHelper
{
  static Dio? dio ;


  static init() {
    dio = Dio(BaseOptions(

      baseUrl: 'https://matjar.appclouders.com/api/',

      receiveDataWhenStatusError: true ,

    ));

  }



  static Future<Response>? getData({

    @required String? url,
    Map<String, dynamic>? query ,
    String? lang  ,
    String? token

  })async
  {
    dio!.options.headers =
    {
      'Content-Type':'application/json' ,
      'Accept' : 'application/json',
      'lang':  CashHelper.getData(key: 'lang') ,
      'Authorization':'Bearer ${CashHelper.getData(key: 'token')}',

    }
    ;

    return await  dio!.get(url! , queryParameters: query ,
        options:
        Options(
        followRedirects: false,
        validateStatus: (status) { return status! < 500; }
    )) ;
  }



  static Future<Response>? postData({
    @required String? url ,
    Map<String , dynamic>? query ,
    @required Map<String , dynamic>? data ,
    String? lang  ,
    String? token

  }) async
  {


    dio!.options.headers =
    {
      'Accept' : 'application/json',
      'Content-Type':'application/json' ,
      'lang':  CashHelper.getData(key: 'lang') ,
      'Authorization':'Bearer ${CashHelper.getData(key: 'token')}' ,
    }
    ;
    return await  dio!.post(url! , queryParameters: query , data: data ,
        options:
        Options(
        followRedirects: false,
        validateStatus: (status) { return status! < 500; }
    )

    );

  }




  static Future<Response> putData(
      { @required String? url ,

        Map<String , dynamic>? data ,
        Map<String , dynamic>? query ,
        @required String? lang  ,
        String? token


      }
      )async
  {
    dio!.options.headers={
      'Content-Type':'application/json' ,
      'lang':  CashHelper.getData(key: 'lang') ,
      'Authorization':'Bearer ${CashHelper.getData(key: 'token')}' ,

    };
    return await  dio!.put(url! , queryParameters: query , data: data);
  }

}



















