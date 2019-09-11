import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

//https://www.jianshu.com/p/8356a3bc8f6c
//https://www.jianshu.com/p/3b547c5d19eb
//多国语言资源的汇总
class LocalizationCenter{
  final Locale locale;

  LocalizationCenter(this.locale);

  static Map<String ,Map<String ,String>> _localizationValues = {
    'en': {
      'task title': 'Flutter Change Launge',
      'titlebar title': 'Flutter Demo Home Page',
      'click tip': 'You have pushed the button this many times:',
      'inc':'Increment'
    },
    'zh': {
      'task title': 'Flutter 切换语言',
      'titlebar title': 'Flutter 示例主页面',
      'click tip': '你一共点击了这么多次按钮：',
      'inc':'增加'
    }
  };

  get taskTitle{
    return _localizationValues[locale.languageCode]['task title'];
  }

  get titlebarTitle{
    return _localizationValues[locale.languageCode]['titlebar title'];
  }

  get clickTop{
    return _localizationValues[locale.languageCode]['click tip'];
  }
  
  get inc{
    return _localizationValues[locale.languageCode]['inc'];
  }

  //此处获取该类的实例
  static LocalizationCenter of(BuildContext context){
    return Localizations.of(context, LocalizationCenter);
  }
}


//为了初始化localization需要一个叫做 LocalizationsDelegate的类来完成
class LocalizationDelegetedCenter extends LocalizationsDelegate<LocalizationCenter>{
  
  const LocalizationDelegetedCenter();

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['en','zh'].contains(locale.languageCode);
  }

  @override
  //LocalizationCenter就是在此方法内被初始化的
  Future<LocalizationCenter> load(Locale locale) {
    // TODO: implement load
    return new SynchronousFuture<LocalizationCenter>(new LocalizationCenter(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<LocalizationCenter> old) {
    // TODO: implement shouldReload
    return false;
  }

  static LocalizationDelegetedCenter delegate = const LocalizationDelegetedCenter();

}






