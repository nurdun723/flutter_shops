import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_shop/ui/common/data/homedata.dart';
import 'package:flutter_shop/ui/service/service_api.dart';
import 'package:flutter_swiper/flutter_swiper.dart';//第三方http插件
import 'package:flutter_screenutil/flutter_screenutil.dart';//设备适配
import 'package:url_launcher/url_launcher.dart';//打开网址、发送邮件、拨打电话、以及发送信息功能
class HomePage extends StatefulWidget {


  _HomePageState createState() => _HomePageState();
}

/** 
 * 为了保持页面的状态必须 with AutomaticKeepAliveClientMixin ，而且 bool get wantKeepAlive => true ，必须混入Statefullwidget里面;
 * */ 
class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {


  String hometxt = '首页内容';
  List littleAdvertisementtxt = headlines;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
   
    // getHomepageContent().then((res){
    //   setState(() {
    //     hometxt = res.toString();
    //   });
    // });

     super.initState();
     print('加载页面....');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('首页'),
        elevation: 0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SwiperDemo(),
              GridViewClassify(),
              LittleAdvertisement(advertisementlist: littleAdvertisementtxt),
              RecommendProdct(),
              BigimagesOne()
            ],
          ),
        )
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
  final List gridViewItemList = menueDataJson['items'];
  final String userphone = '17521515627';

  Widget _gridviewitems(BuildContext context , item){
    return Container(
      child: InkWell(
        onTap:item['title']=='外卖打电话'?telphone:(){print('不能打电话');},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.network(item['pic_url'],width: ScreenUtil().setWidth(110),),
            Text('${item['title']}',style: TextStyle(fontSize: 12),)
          ],
        ),
      ),
    );
  }


  void telphone() async{
    String url = 'tel:'+userphone;//打电话
    //String url = 'sms:'+userphone;//发短信
    //String url = 'http://jspang.com';//访问网站
    if(await canLaunch(url)){
      await launch(url);
    }else{
      print('不能访问');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10),
      height: ScreenUtil().setHeight(465),
      padding: EdgeInsets.all(10),
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 10,
        childAspectRatio: 1.0,
        //padding: EdgeInsets.all(4.0),
        children: gridViewItemList.map((item){
          return _gridviewitems(context, item);
        }).toList(),
      ),
    );
  }
}


//小广告
class LittleAdvertisement extends StatelessWidget{
  List advertisementlist;
  LittleAdvertisement({Key key , this.advertisementlist}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      
      width: double.infinity,
      //height: ScreenUtil().setHeight(50),
      height: ScreenUtil().setHeight(100),
      padding: EdgeInsets.fromLTRB(10, 8, 10, 5),
      color: Colors.blue,
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.volume_up,size: 22,color: Colors.white,),
          SizedBox(width: ScreenUtil().setWidth(30),),
          Expanded(
            child: Swiper(
              scrollDirection: Axis.vertical,
              itemCount: advertisementlist.length,
              autoplay: true,
              itemBuilder:(BuildContext context , int index){
                return Text('${advertisementlist[index]}',style: TextStyle(color: Colors.white),maxLines: 1,overflow: TextOverflow.clip,);
              },
            ),
          )
          
        ],
      ),
    );
  }
}


//推荐商品
class RecommendProdct extends StatelessWidget {
  final List recomendlist = recommendJson['items'];

  Widget RecommendTitle(BuildContext context){
    return Container(
      width: double.infinity,
      height: ScreenUtil().setHeight(85),
      padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: Colors.blue[300]
          )
        )
      ),
      child: Text('推荐商品',style: TextStyle(fontSize: ScreenUtil().setSp(38),color: Colors.blue,fontWeight: FontWeight.bold),),
    );
  }

  Widget recommenditems(index){
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(left: 10,right:10),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              width: 1,
              style: BorderStyle.solid,
              color: Colors.blue[300]
            ),
            bottom: BorderSide(
              width: 1,
              style: BorderStyle.solid,
              color: Colors.blue[300]
            )
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(recomendlist[index]['pic_url'],width: ScreenUtil().setWidth(250),height: ScreenUtil().setHeight(250), ),
            SizedBox(height: ScreenUtil().setHeight(30),),
            Text('${recomendlist[index]['title']}',style: TextStyle(fontSize: ScreenUtil().setSp(36),color: Colors.black),),
            Text('￥${recomendlist[index]['product_priceone']}',style: TextStyle(fontSize: ScreenUtil().setSp(34),color: Colors.black),),
            Text('￥${recomendlist[index]['product_pricetwo']}',style: TextStyle(fontSize: ScreenUtil().setSp(32),color: Colors.grey,decoration: TextDecoration.lineThrough),),
          ],
        ),
      ),
    );
  }

  Widget alaotProct(index){
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(left: 10,right:10),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              width: 1,
              style: BorderStyle.solid,
              color: Colors.blue[300]
            ),
            bottom: BorderSide(
              width: 1,
              style: BorderStyle.solid,
              color: Colors.blue[300]
            )
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text('更多推荐...',style: TextStyle(fontSize: ScreenUtil().setSp(36),fontWeight: FontWeight.w600,color: Colors.blue),),
            )
          ],
        ),
      ),
    );
  }

  Widget RecommendListview(BuildContext context){
    return Container(
      height: ScreenUtil().setHeight(440),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:recomendlist.length - 4,
        itemBuilder:(context , index){
          return index == recomendlist.length - 5?alaotProct(index):recommenditems(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10,bottom: 15),
      child:Column(
        children: <Widget>[
          RecommendTitle(context),
          RecommendListview(context)
        ],
      ) ,
    );
  }
}


//图片
class BigimagesOne extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10),
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      child: Image.asset('static/images/618.png'),
    );
  }
}

//tab页面切换
class TabbarWidge extends StatelessWidget{

  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      child: TabBar(
        tabs: <Widget>[

        ],
      ),
    );
  }
}




