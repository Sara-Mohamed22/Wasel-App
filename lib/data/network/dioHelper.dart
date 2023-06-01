import 'package:dio/dio.dart';
import 'package:flutter/material.dart';



class DioHelper
{
  static Dio? dio ;


  static init() {
    dio = Dio(BaseOptions(
      // baseUrl: 'https://qevents-test.appclouders.com/api/',
      //    baseUrl: 'https://qevent0108.alqemam.com/api/',
      baseUrl: 'https://qevent010801.alqemam.com/api/',

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
      // 'lang':  lang ,
      'Authorization':'Bearer $token',
    }
    ;

    return await  dio!.get(url! , queryParameters: query ) ;
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
      'Content-Type':'application/json' ,
      // 'lang':lang ,
      'Authorization':'Bearer $token' ,
    }
    ;
    return await  dio!.post(url! , queryParameters: query , data: data , );

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
      // 'lang':lang ,
      'Authorization':'Bearer $token' ,

    };
    return await  dio!.put(url! , queryParameters: query , data: data);
  }

}



















