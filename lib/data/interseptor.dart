import 'package:dio/dio.dart';
import 'package:sadovod/data/token_ropository.dart';

class JWTInterceptor extends QueuedInterceptor {
  JWTInterceptor({
    required this.repository,
    required Dio dio,
  }) : _dio = dio;

  final TokenRepository repository;

  final Dio _dio;

  String? get _accessToken => repository.accessToken;

  String? get _refreshToken => repository.refreshToken;

  @override
  void onRequest(options, handler) {
    if (_accessToken != null) {
      options.headers['Authorization'] = 'Bearer $_accessToken';
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if ((response.requestOptions.path == 'auth/sign-in' || response.requestOptions.path == 'auth/sign-up')) {
      repository.saveTokens(
        accessToken: response.data['token'],
        refreshToken: response.data['refreshToken'],
      );
    }
    super.onResponse(response, handler);
  }

  @override
  Future onError(error, handler) async {
    if ((error.response?.statusCode == 403 ||
        error.response?.statusCode == 401) &&
        (error.requestOptions.path != 'auth/sign-in' || error.requestOptions.path != 'auth/sign-up')) {
      await _refresh();
      if (repository.auth) {
        final response = await _retry(error.requestOptions);
        handler.resolve(response);
      }
    }
    return super.onError(error, handler);
  }

  Future<void> _refresh() async {
    if (_refreshToken == null) {
      return;
    }
    try {
      final response = await _dio.post(
        'auth/refresh',
        data: {
          'token': _refreshToken,
        },
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        repository.saveTokens(
          accessToken: response.data['token'],
          refreshToken: response.data['refreshToken'],
        );
      }
    } catch (e) {
      repository.deleteTokens();
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}