import 'package:flutter/material.dart'; // Google 风格
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/ui/page/case/getResponse.dart';
import 'package:flutter_shop/ui/page/home/home_page.dart';
import 'package:flutter_shop/ui/page/my/my_page.dart';
import 'package:flutter_shop/ui/page/shop/shop_page.dart';
import 'package:flutter_shop/ui/page/shopcar/shop_car.dart';//ios 风格
import 'package:flutter_screenutil/flutter_screenutil.dart';//设备适配


class Indepage extends StatefulWidget {
  IndepageState createState() => IndepageState();
}

class IndepageState extends State<Indepage> {
  //底部导航列表
  final List<BottomNavigationBarItem> navigationbaritem = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('商城')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('我的')
    ),
  ];

  //主页面列表
  final List<Widget> pagelist = [
    HomePage(),
    ShopPage(),
    ShopCarPage(),
    MyPage()
    //CheckRoom()
  ];

  //当前页面下标
  int currentindex = 0;
  //当前页面
  Widget currentpage;

  @override
  void initState() {
    super.initState();

    currentpage = pagelist[currentindex];
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080,height: 2028)..init(context);
    // print('设备宽度：${ScreenUtil.screenWidth}');
    // print('设备高度: ${ScreenUtil.screenHeight}');
    // print('设备密度: ${ScreenUtil.pixelRatio}');
    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: navigationbaritem,
        currentIndex: currentindex,
        onTap: (index){
          setState(() {
            currentindex = index;
          });
        },
      ),
      body: IndexedStack(
        index: currentindex,
        children: pagelist,
      ),
    );
  }
}