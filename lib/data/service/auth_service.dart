import 'dart:async';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:sadovod/model/auth.dart';
import 'package:sadovod/model/auth_response.dart';
import 'package:sadovod/model/profile.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST('auth/sign-in')
  Future<AuthResponse> auth({
    @Body() required Auth request,
  });

  @POST('auth/sign-up')
  Future<AuthResponse> registr({
    @Body() required Auth request,
  });

  @GET('users/get_user')
  Future<Profile> getUser();

}
