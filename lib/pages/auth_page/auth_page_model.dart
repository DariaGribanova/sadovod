import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sadovod/data/request_utils.dart';
import 'package:sadovod/data/service/auth_service.dart';
import 'package:sadovod/data/token_ropository.dart';
import 'package:sadovod/model/auth.dart';
import 'package:sadovod/model/auth_response.dart';


class AuthPageModel extends ElementaryModel {
  AuthPageModel(ErrorHandler errorHandler, this.tokenRepository, this.authService)
      : super(errorHandler: errorHandler);

  final TokenRepository tokenRepository;
  final AuthService authService;

  bool isLoggedIn() {
    return tokenRepository.auth;
  }

  Future<void> auth() async {
     await authService.auth(
      request: Auth(
        username: 'Dashich', password: '11111',
      ),
    );
  }

}
