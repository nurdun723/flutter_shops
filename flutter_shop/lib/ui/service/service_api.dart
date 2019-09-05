import "package:dio/dio.dart";
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

/**
 * 这个文件主要是存放请求后台借口的api
 */

//获取首页数据

Future getHomepageContent() async{
  try{
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse('application/x-www-form-urlencoded');//设置返回数据类型是表单数据类型
    var formData = {'lon':'115.02932','lat':'35.76189'};
    response = await dio.post(servicePath['homePageContent'],data:formData);
    if(response.statusCode==200){
      return response.data;
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  }catch(e){
    return print('后台数据借口异常=====>${e}');
  }  
}