import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_shop/ui/common/data/homedata.dart';
import 'package:flutter_shop/ui/service/service_api.dart';
import 'package:flutter_swiper/flutter_swiper.dart';//第三方http插件
import 'package:flutter_screenutil/flutter_screenutil.dart';//设备适配
class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String hometxt = '首页内容';
  @override
  void initState() {
   
    // getHomepageContent().then((res){
    //   setState(() {
    //     hometxt = res.toString();
    //   });
    // });

     super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('首页'),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SwiperDemo(),
          ],
        ),
      ),
    );
  }
}

//https://github.com/best-flutter/flutter_swiper/blob/master/README-ZH.md#%E5%9F%BA%E6%9C%AC%E4%BD%BF%E7%94%A8
//https://www.jianshu.com/p/505b92a2bccf
//首页轮播图
class SwiperDemo extends StatelessWidget{
  @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   return Container(
  //     height: 120,
  //     alignment: Alignment.center,
  //     child: Swiper(
  //       itemBuilder: (BuildContext contex,int index){
  //         return Image.network(banner_images[index],fit: BoxFit.cover,);
  //       },
  //       itemCount: banner_images.length,//轮播数量
  //       pagination: new SwiperPagination(),//显示默认分页指示器，下面的点点
  //       //control:  new SwiperControl(),//展示默认分页按钮，两边的箭头
  //       autoplay: true,//自动翻页
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080,height: 2028)..init(context);
    print('设备宽度：${ScreenUtil.screenWidth}');
    print('设备高度: ${ScreenUtil.screenHeight}');
    print('设备密度: ${ScreenUtil.pixelRatio}');
    // TODO: implement build
    return Container(
      //color: Colors.black87,
      padding: EdgeInsets.only(top: 10),
      height: ScreenUtil().setHeight(540),
      child: Swiper(
        scrollDirection: Axis.horizontal,
        itemCount:banner_images.length,
        autoplay: true,
        itemBuilder: (BuildContext context ,int index){
          return Container(
            height: ScreenUtil().setHeight(500),
            margin: EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(banner_images[index]),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          );
        },
        pagination: SwiperPagination( // 分页指示器
        alignment: Alignment.bottomCenter,// 位置 Alignment.bottomCenter 底部中间
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5), // 距离调整
        builder: DotSwiperPaginationBuilder(
          activeColor: Colors.blue,
          color: Colors.black,
          size: 6,
          activeSize: 8,
          space: 3,
        )),
        viewportFraction: 0.80,
        scale: 0.8,
        // layout: SwiperLayout.TINDER,
        // itemWidth: MediaQuery.of(context).size.width,
        // itemHeight: MediaQuery.of(context).size.height,
      ),
    );
  }
}


//首页导航
class GridViewClassify extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Swiper(
        index: 0,
        loop: true,//无限轮播开关
      ),
    );
  }
}


