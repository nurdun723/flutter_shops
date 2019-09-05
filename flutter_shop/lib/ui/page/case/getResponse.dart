import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import './httpheader.dart';
//请求数据以及将数据填充到对应的位置
class CheckRoom extends StatefulWidget {

  CheckRoomState createState() => CheckRoomState();
}

class CheckRoomState extends State<CheckRoom> {
  TextEditingController typeController = TextEditingController();
  String _responestext = '咱们先选择一下我们喜欢的类型...';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('美好人间'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),//内容那边距
                  labelText: '类型',//
                  helperText: '请输入你喜欢类型',//下面的提示文字
                ),
                autofocus: false,
              ),
              RaisedButton(
                color: Colors.red,
                child: Text('选择完毕',style: TextStyle(color: Colors.white),),
                onPressed: _checkoutdata,//如果不加这个属性的话，按钮会处于disabled状态

              ),
              Text('${_responestext}',overflow: TextOverflow.clip,)

            ],
          ),
        ),
      )
    );
  }

  void _checkoutdata(){
    if(typeController.text.toString() == ''){
      showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text('请输入你喜欢的类型....',style: TextStyle(color: Colors.red,fontSize: 16),),
        )
      );
    }else{
      // postData(typeController.text.toString()).then((res){
      //   setState(() {
      //     _responestext = res['data']['name'];
      //    print(res);
      //   });
      // });
    }
    // getjikeData().then((res){
    //   setState((){
    //     _responestext = res['data']['list'].toString(); 
    //   });
    // });
  }

  //获取数据
  Future getData(String typetext) async{ 
    try{
      Response response;
      var dataobj = {'name':typetext};
      response = await Dio().get(
        'https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian',
        queryParameters: dataobj // get请求的参数列表
      );
      return response.data;
    }catch(e){
      return print(e);
    }
  }

  //post请求
  Future postData(String typetext) async{
    try{
      Response response;
      var dataobj = {'name':typetext};
      response = await Dio().post(
        'https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/post_dabaojian',
        queryParameters: dataobj // get请求的参数列表
      );
      return response.data;
    }catch(e){
      return print(e);
    }
  }
}


//请求极客时间网站数据

  // Future getjikeData() async{
  //   Dio dio = new Dio();
  //   //dio.options.headers = httpheader; // 设置请求头
  //   Response response;
  //   try{
  //     response = await dio.post('https://time.geekbang.org/serv/v1/column/topList');
  //     return response.data;
  //   }catch(e){
  //     return print(e);
  //   }
  // }
