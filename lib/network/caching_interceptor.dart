import 'package:dio/dio.dart';

class CacheInterceptor extends Interceptor {
  // URIをキー、Responseを値とする簡易キャッシュ
  final Map<Uri, Response> _cache = {};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // GETリクエストの場合のみキャッシュチェック
    if (options.method.toLowerCase() == 'get') {
      final key = options.uri;
      if (_cache.containsKey(key)) {
        // キャッシュが存在する場合、キャッシュレスポンスを返却
        return handler.resolve(_cache[key]!);
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // GETリクエストのレスポンスをキャッシュに保存
    if (response.requestOptions.method.toLowerCase() == 'get') {
      final key = response.requestOptions.uri;
      _cache[key] = response;
    }
    handler.next(response);
  }
}
