import 'package:elementary/elementary.dart';
import 'package:sadovod/data/token_ropository.dart';


class AuthPageModel extends ElementaryModel {
  AuthPageModel(ErrorHandler errorHandler, this.tokenRepository)
      : super(errorHandler: errorHandler);

  final TokenRepository tokenRepository;

  bool isLoggedIn() {
    return tokenRepository.auth;
  }

}
