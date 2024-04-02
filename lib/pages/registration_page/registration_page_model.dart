import 'package:elementary/elementary.dart';
import 'package:sadovod/data/service/auth_service.dart';
import 'package:sadovod/data/token_ropository.dart';
import 'package:sadovod/model/auth.dart';

class RegistrationPageModel extends ElementaryModel {
  RegistrationPageModel(
      ErrorHandler errorHandler, this.tokenRepository, this.authService)
      : super(errorHandler: errorHandler);

  final TokenRepository tokenRepository;
  final AuthService authService;

  bool isLoggedIn() {
    return tokenRepository.auth;
  }

  Future<void> registr({
    required String username,
    required String password,
    required String name,
    required String lastName,
  }) async {
    await authService.registr(
      request: Auth(
        username: username,
        password: password,
        name: name,
        lastname: lastName,
      ),
    );
  }
}
