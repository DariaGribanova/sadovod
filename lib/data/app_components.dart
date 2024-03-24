import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sadovod/data/interseptor.dart';
import 'package:sadovod/data/service/auth_service.dart';
import 'package:sadovod/data/token_ropository.dart';

const timeout = Duration(seconds: 30);

class AppComponents {
  static final AppComponents _instance = AppComponents._internal();

  factory AppComponents() => _instance;

  AppComponents._internal();

  final Dio dio = Dio();
  final TokenRepository tokenRepository = TokenRepository();
  late final AuthService authService = AuthService(dio);

  Future<void> init() async {
    dio.options
      //..baseUrl = 'http://10.0.2.2:8088/'
      ..baseUrl = 'http://192.168.80.208:8088/'
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout
      ..contentType = ContentType.json.mimeType
      ..responseType = ResponseType.json;
    dio.options.headers['Content-Type'] = 'application/json';
    dio.interceptors.add(PrettyDioLogger());

    await tokenRepository.initTokens();

    dio.interceptors.add(
      JWTInterceptor(
        repository: tokenRepository,
        dio: dio,
      ),
    );
  }
}
