import 'dart:async';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:sadovod/model/auth.dart';
import 'package:sadovod/model/auth_response.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST('auth/sign-in')
  Future<AuthResponse> auth({
    @Body() required Auth request,
  });

}
