class BaseUrl {
  //dummy json base url
  static const String baseUrl = 'https://dummyjson.com/';
}

class Urlpaths {
  //dummy json page paths
  static const String authLoginPath = 'auth/login';
  static const String authLoginMePath = 'auth/me';
}

class ApiConstants {
  //urls
  static const String authLoginUrl = '${BaseUrl.baseUrl}${Urlpaths.authLoginPath}';
  static const String authMeUrl = '${BaseUrl.baseUrl}${Urlpaths.authLoginMePath}';
}
