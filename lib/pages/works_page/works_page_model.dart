import 'package:elementary/elementary.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sadovod/data/token_ropository.dart';


class WorksPageModel extends ElementaryModel {
  WorksPageModel(ErrorHandler errorHandler, this.tokenRepository)
      : super(errorHandler: errorHandler);

  final TokenRepository tokenRepository;

  BehaviorSubject<bool> isLoggedIn() {
    return tokenRepository.isLoggedIn;
  }

}
