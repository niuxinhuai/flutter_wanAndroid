class Uri {
  ///base
  static const String baseUri = "https://www.wanandroid.com/";

  ///首页banner
  static const String home_banner = "banner/json";

  ///首页文章列表
  static String home_article(int page) => "article/list/$page/json";

  ///置顶文章
  static const String top_article = "article/top/json";

  ///微信公众号文章
  ///方法：GET
  static const String wxArticle = "wxarticle/chapters/json";

  ///微信公众号下对应的用户id的文章
  ///方法：GET
  static String wxUserArticleList(int id, int page) =>
      "wxarticle/list/$id/$page/json";

  ///导航
  ///方法：GET
  static const String navigationJson = "navi/json";

  ///项目
  ///方法： GET
  static const String projectTree = "project/tree/json";

  ///项目列表下的数据,
  ///方法：GET
  ///参数：
  ///	cid 分类的id，上面项目分类接口
  ///	页码：拼接在链接中，从1开始。
  static String projectList(int page, int cid) =>
      "project/list/$page/json?cid=$cid";

  ///搜索
  ///方法：POST
  ///页码：拼接在链接上，从0开始。
  ///k ： 搜索关键词
  static String searchJson(int page) => "article/query/$page/json";

  ///热搜
  static const String hotSearch = "/hotkey/json";

  ///登录
  ///方法：POST
  ///参数：
  ///	username，password
  static const String login = "user/login";

  ///注册
  ///方法：POST
  ///参数
  ///	username,password,repassword
  static const String register = "user/register";

  ///退出登录
  ///方法：GET
  static const String logout = "user/logout/json";
}
