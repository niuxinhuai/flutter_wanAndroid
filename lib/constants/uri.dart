class Uri {
  ///base
  static const String baseUri = "https://www.wanandroid.com/";

  ///首页banner
  static const String home_banner = "banner/json";

  ///首页文章列表
  static String home_article(int page) => "article/list/$page/json";
}
