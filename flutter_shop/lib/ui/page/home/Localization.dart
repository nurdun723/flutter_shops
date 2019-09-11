import 'package:flutter/material.dart';
import 'package:flutter_shop/main.dart';
import 'package:flutter_shop/ui/common/localization/aplicationLocalization.dart';

class LocalizationHome extends StatefulWidget {
  LocalizationHome({Key key}) : super(key: key);

  _LocalizationHomeState createState() => _LocalizationHomeState();
}

class _LocalizationHomeState extends State<LocalizationHome> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizationCenter.of(context).taskTitle),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(LocalizationCenter.of(context).clickTop),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          if(flag){
            changelocalizationskey.currentState.changelocal(Locale('zh','CH'));
          }else{
            changelocalizationskey.currentState.changelocal(Locale('en','US'));
          }
          flag = !flag;
        },
      ),
    );
  }
}