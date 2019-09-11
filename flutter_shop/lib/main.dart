import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_shop/ui/common/localization/aplicationLocalization.dart';
import 'package:flutter_shop/ui/page/index.dart';

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: Text(),
//     );
//   }
// }


//切换语言
class Changelocalizations extends StatefulWidget {
  final Widget child;
  Changelocalizations({Key key,this.child}) : super(key: key);

  State<Changelocalizations> createState() => _ChangelocalizationsState();
}

class _ChangelocalizationsState extends State<Changelocalizations> {
  Locale _locale = const Locale('zh','CH');

  changelocal(Locale locale){
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Localizations.override(
      context: context,
      locale: _locale,
      child: widget.child,
    );
  }
}


GlobalKey<_ChangelocalizationsState> changelocalizationskey = GlobalKey<_ChangelocalizationsState>();

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        onGenerateTitle: (context){
          return LocalizationCenter.of(context).taskTitle;
        },
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          LocalizationDelegetedCenter.delegate
        ],
        supportedLocales: [
          const Locale('zh','CH'),//中文简体
          const Locale('en','US'),//美国英语
          
        ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue
        ),
        home: Builder(builder: (context){
          return Changelocalizations(
            key: changelocalizationskey,
            child: Indexpage(),
          );
        },),
      ),
    );
  }
}
