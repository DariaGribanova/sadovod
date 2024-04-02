import 'package:elementary/elementary.dart';
import 'package:sadovod/data/manager/profile_manager.dart';
import 'package:sadovod/data/service/auth_service.dart';
import 'package:sadovod/data/token_ropository.dart';
import 'package:sadovod/model/auth.dart';

class AuthPageModel extends ElementaryModel {
  AuthPageModel(
      ErrorHandler errorHandler, this.tokenRepository, this.authService, this.profileManager)
      : super(errorHandler: errorHandler);

  final TokenRepository tokenRepository;
  final AuthService authService;
  final ProfileManager profileManager;

  bool isLoggedIn() {
    return tokenRepository.auth;
  }

  Future<void> auth({required String username, required String password}) async {
    await authService.auth(
      request: Auth(
        username: username,
        password: password,
      ),
    ).then((value) => profileManager.getUser());
  }
}
