import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sadovod/data/error_handler.dart';
import 'package:sadovod/data/interseptor.dart';
import 'package:sadovod/data/token_ropository.dart';
import 'package:sadovod/sadovod_app.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppDependency extends StatelessWidget {
  const AppDependency({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<TokenRepository>(
          create: (_) => TokenRepository(),
        ),
        ProxyProvider<TokenRepository, Dio>(
          update: (context, tokenRepository, previousDio) {
            var dio = Dio();
            dio.options.baseUrl = "http://127.0.0.1:8088/";
            dio.options.headers['Content-Type'] = 'application/json';
            dio.interceptors.add(PrettyDioLogger());
            tokenRepository.initTokens();
            dio.interceptors.add(
              JWTInterceptor(
                repository: tokenRepository,
                dio: dio,
              ),
            );
            return dio;
          },
        ),
        Provider<ErrorHandler>(create: (_) => DefaultErrorHandler()),
      ],
      child: SadovodApp(),
    );
  }
}
