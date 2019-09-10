import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';


//获取火爆专区的数据
getHomePageHotGoods(int page,[String keyworld = '鞋子']) async{
  print('页面数:${page}');
  print('关键字:${keyworld}');
  try{
    Response response;
    Dio dio = new Dio();
    response = await dio.get('https://so.m.jd.com/ware/search._m2wq_list?keyword=$keyworld&datatype=1&callback=C&page=$page&pagesize=4&ext_attr=no&brand_col=no&price_col=no&color_col=no&size_col=no&ext_attr_sort=no&merge_sku=yes&multi_suppliers=yes&area_ids=1,72,2818&qp_disable=no&fdesc=%E5%8C%97%E4%BA%AC');
    String body = response.toString();
    String jsonString = body.substring(2, body.length - 2);
    var json = jsonDecode(jsonString.replaceAll(RegExp(r'\\x..'), '/'));
    return json['data']['searchm']['Paragraph'] as List;
  }catch(e){
    return print(e);
  }
}