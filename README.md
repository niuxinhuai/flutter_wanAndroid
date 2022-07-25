# flutter_wanAndroid
flutter 版本，fish_redux, flutter_boost, dio, cache, 

* [项目地址](https://github.com/niuxinhuai/flutter_wanAndroid)
* [玩Android接口](https://www.wanandroid.com/blog/show/2)

###flutter doctor
![440E06F5-D4F2-4695-B4C4-E2176857281A.png](https://upload-images.jianshu.io/upload_images/2189604-289b6401b6d10409.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 状态管理采用的是fish_redux,但是目前该plugin不支持null_safety,因此需要override一下另一个plugin，对于项目来说，使用fish_redux使项目看起来更加简洁，通俗易懂，可维护性也比较高。
```
dependency_overrides:
  fish_redux:
    git: git@github.com:leftcoding/fish-redux.git


```
* 网络请求采用的是Dio，缓存使用的是dio_http_cache，比较方便
* 数据库使用的是sqflite,对应的使用地方有1.文章收藏，2.搜索历史 3.天气信息

####代码支持了null-safety，运行时使用了iOS真机运行，因此安卓端想要运行的话需要添加一些权限信息。
#####部分项目运行截图如下：


![IMG_0603.PNG](https://upload-images.jianshu.io/upload_images/2189604-8f100744802c05b6.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![IMG_0604.PNG](https://upload-images.jianshu.io/upload_images/2189604-69b25d9005f273c5.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![IMG_0605.PNG](https://upload-images.jianshu.io/upload_images/2189604-e7b2613a9cb8e3cb.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![IMG_0606.PNG](https://upload-images.jianshu.io/upload_images/2189604-dae6f5be3a1efcf0.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![IMG_0607.PNG](https://upload-images.jianshu.io/upload_images/2189604-c45f0ac8f91c0829.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![IMG_0601.PNG](https://upload-images.jianshu.io/upload_images/2189604-17692ad22499c74f.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![IMG_0602.PNG](https://upload-images.jianshu.io/upload_images/2189604-22cfd5f3959253f5.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![IMG_0608.PNG](https://upload-images.jianshu.io/upload_images/2189604-ee33c34cfe10f522.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![IMG_0609.PNG](https://upload-images.jianshu.io/upload_images/2189604-af009bbeca093650.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


####日历功能比较简单，包含了阴历，阳历，节假日

![IMG_0611.PNG](https://upload-images.jianshu.io/upload_images/2189604-86310fdc240333ba.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


####天气预报


![天气预报.gif](https://upload-images.jianshu.io/upload_images/2189604-a3b734f53070c941.gif?imageMogr2/auto-orient/strip)


希望对大家有帮助


* [项目地址](https://github.com/niuxinhuai/flutter_wanAndroid)
